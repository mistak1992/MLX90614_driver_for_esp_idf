/**
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *MLX90614_API.c
 */
#include "include/MLX90614_SMBus_Driver.h"
#include "esp_system.h"
#include <math.h>
#define TAG_MLX90614 "MLX90614"

//------------------------------------------------------------------------------
  
int MLX90614_DumpEE(uint8_t slaveAddr, uint16_t *eeData)
{
     int error = 0;
     char address = 0x20;
     uint16_t *p = eeData;
     
     while (address < 0x40 && error == 0)
     {
        error = MLX90614_SMBusRead(slaveAddr, address, p);
        address = address + 1;
        p = p + 1;
     }   
         
     return error;
}

//------------------------------------------------------------------------------

int MLX90614_GetTa(uint8_t slaveAddr, float *ta)
{
    int error = 0;
    uint16_t data = 0;
    
    error = MLX90614_SMBusRead(slaveAddr, 0x06, &data);
    
    if (data > 0x7FFF)
    {
        return -4;
    }
        
    *ta = (float)data * 0.02f - 273.15;
        
    return error;
}    

//------------------------------------------------------------------------------

int MLX90614_GetTo(uint8_t slaveAddr, float *to)
{
    int error = 0;
    uint16_t data = 0;
    
    error = MLX90614_SMBusRead(slaveAddr, 0x07, &data);
    
    if (data > 0x7FFF)
    {
        return -4;
    }
    
    if (error == 0)
    {
        *to = (float)data * 0.02f - 273.15;
    } 
    
    return error;
} 

//------------------------------------------------------------------------------

int MLX90614_GetTo2(uint8_t slaveAddr, float *to2)
{
    int error = 0;
    uint16_t data = 0;
    
    error = MLX90614_SMBusRead(slaveAddr, 0x08, &data);
    
    if (data > 0x7FFF)
    {
        return -4;
    }
    
    if (error == 0)
    {
        *to2 = (float)data * 0.02 - 273.15;
    }        
    
    return error;
}   

//------------------------------------------------------------------------------

int MLX90614_GetIRdata1(uint8_t slaveAddr, uint16_t *ir1)
{
    int error = 0;
    uint16_t data = 0;
    
    error = MLX90614_SMBusRead(slaveAddr, 0x04, &data);
    
    if (error == 0)
    {
        *ir1 = data;
    }    
    
    return error;
}    

//------------------------------------------------------------------------------

int MLX90614_GetIRdata2(uint8_t slaveAddr, uint16_t *ir2)
{
    int error = 0;
    uint16_t data = 0;
    
    error = MLX90614_SMBusRead(slaveAddr, 0x05, &data);
    
    if (error == 0)
    {
        *ir2 = data;
    }    
    
    return error;
}  

//------------------------------------------------------------------------------
int MLX90614_GetEmissivity(uint8_t slaveAddr, float *emissivity) {
    int error = 0;
    uint16_t data = 0;
    
    error = MLX90614_SMBusRead(slaveAddr, 0x24, &data);
    
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to get emissivity, error: %d", error);
        return error;
    }

    *emissivity = (float)data / 0xFFFF;
    ESP_LOGI(TAG_MLX90614, "Emissivity: %f", *emissivity);

    return error;
}

//------------------------------------------------------------------------------

int MLX90614_SetEmissivity(uint8_t slaveAddr, float value) {
    int error = 0;
    uint16_t data;
    uint16_t curE;
    uint16_t newE = 0;
    float temp = 0;
    
    if (value > 1.0 || value < 0.05) {
        return -6;  // Emissivity value out of range
    }
    
    temp = value * 65535 + 0.5;
    newE = temp;
    
    // Reading current emissivity
    error = MLX90614_SMBusRead(slaveAddr, 0x24, &curE);
    
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to read current emissivity, error: %d", error);
        return error;
    }

    // Reading the value from the configuration register
    error = MLX90614_SMBusRead(slaveAddr, 0x2F, &data);
    
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to read configuration register, error: %d", error);
        return error;
    }
    
    temp = (float)curE * data;
    temp = temp / newE + 0.5;
    data = temp;
    
    if (data > 0x7FFF) {
        ESP_LOGE(TAG_MLX90614, "Data exceeds limit, data: %04X", data);
        return -6;
    }

    // Unlock EEPROM
    error = MLX90614_SendCommand(slaveAddr, 0x60);
    
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to unlock EEPROM, error: %d", error);
        return error;
    }
    
    // Write new emissivity value to EEPROM
    error = MLX90614_SMBusWrite(slaveAddr, 0x24, 0x0000);
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to write to EEPROM, error: %d", error);
        return error;
    }
    
    error = MLX90614_SMBusWrite(slaveAddr, 0x24, newE);
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to write new emissivity, error: %d", error);
        return error;
    }
    
    // Update configuration register
    error = MLX90614_SMBusWrite(slaveAddr, 0x2F, 0x0000);
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to write configuration register, error: %d", error);
        return error;
    }
    
    error = MLX90614_SMBusWrite(slaveAddr, 0x2F, data);
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to update configuration register, error: %d", error);
        return error;
    }

    // Lock EEPROM
    error = MLX90614_SendCommand(slaveAddr, 0x61);
    
    if (error != 0) {
        ESP_LOGE(TAG_MLX90614, "Failed to lock EEPROM, error: %d", error);
        return error;
    }
    
    ESP_LOGI(TAG_MLX90614, "Successfully set new emissivity value: %f", value);
    
    return error;
}

    
//------------------------------------------------------------------------------

int MLX90614_GetFIR(uint8_t slaveAddr, uint8_t *fir)
{
    int error = 0;
    uint16_t data = 0;
    error = MLX90614_SMBusRead(slaveAddr, 0x25, &data);
    
    data = data >> 8;
    data = data & 0x0007;
    
    *fir = data;
    
    return error;
}

//------------------------------------------------------------------------------

int MLX90614_SetFIR(uint8_t slaveAddr, uint8_t value)
{
    int error = 0;
    uint16_t data = 0;
    uint16_t val = value & 0x0007;
    
    error = MLX90614_SMBusRead(slaveAddr, 0x25, &data);
    
    if (error == 0 && val > 0x0003)
    {
        val = val << 8;
        data = data & 0xF8FF;
        data = data + val;
        error = MLX90614_SMBusWrite(slaveAddr, 0x25, 0);
        if(error == 0)
        {
            error = MLX90614_SMBusWrite(slaveAddr, 0x25, data);
        }
    }
    
    return error;
}

//------------------------------------------------------------------------------

int MLX90614_GetIIR(uint8_t slaveAddr, uint8_t *iir)
{
    int error = 0;
    uint16_t data = 0;
    error = MLX90614_SMBusRead(slaveAddr, 0x25, &data);
    
    data = data & 0x0007;
    
    *iir = data;
    
    return error;
}
 
//------------------------------------------------------------------------------

int MLX90614_SetIIR(uint8_t slaveAddr, uint8_t value)
{
    int error = 0;
    uint16_t data = 0;
    uint8_t val = value & 0x0007;
    
    error = MLX90614_SMBusRead(slaveAddr, 0x25, &data);
    
    if (error == 0)
    {
        data = data & 0xFFF8;
        data = data + val;
        error = MLX90614_SMBusWrite(slaveAddr, 0x25, 0);
        if(error == 0)
        {
            error = MLX90614_SMBusWrite(slaveAddr, 0x25, data);
        }
    }
    
    return error;
}
    
//------------------------------------------------------------------------------

float MLX90614_TemperatureInFahrenheit(float temperature)
{
    return temperature * 1.8f + 32.0;
}

//------------------------------------------------------------------------------
    
int16_t MLX90614_ConvertIRdata(uint16_t ir)
{
    int16_t ir2c = ir;
    
    if(ir > 0x7FFF)
    {
        ir2c = 0x8000 - ir2c;
    }
    
    return ir2c;    
}
    
