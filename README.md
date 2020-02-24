# MLX90614_driver_for_esp_idf
Offical driver modified for esp_idf. base on https://github.com/melexis/mlx90614-library
## Tested with IDF_VER: v4.0
```
This is ESP32 chip with 2 CPU cores, WiFi/BT/BLE, silicon revision 1, 2MB external flash
log:31.269983 31.049982 26205
log:31.249994 31.049982 26205
log:31.129999 31.070002 36701
log:31.129999 31.049982 26205
log:31.209986 31.049982 26205
log:31.049982 31.049982 26205
log:31.209986 31.049982 26205
log:31.049982 31.070002 36701
log:31.109980 31.070002 36701
log:31.290003 31.070002 36701
log:31.129999 31.070002 36701
log:31.469995 31.070002 36701
log:31.049982 31.049982 36701
log:31.109980 31.109980 57661
log:31.209986 31.089991 47181
log:31.209986 31.089991 47181
```

## How to use
```
// step 1:
// setup GPIO
#define MLX90614_SDA_GPIO 13 // sda for MLX90614
#define MLX90614_SCL_GPIO 12 // scl for MLX90614
#define MLX90614_VCC_GPIO 14 // vcc for MLX90614
gpio_pad_select_gpio(MLX90614_VCC_GPIO);
gpio_set_direction(MLX90614_VCC_GPIO, GPIO_MODE_OUTPUT);
gpio_set_level(MLX90614_VCC_GPIO, 1);

// step 2:
// Initiate the driver
vTaskDelay(1000/portTICK_RATE_MS);
MLX90614_SMBusInit(MLX90614_SDA_GPIO, MLX90614_SCL_GPIO, 50000); // sda scl and 50kHz

// step 3:
// get or set with driver
float to = 0; // temperature of object
float ta = 0; // temperature of ambient
uint16_t dumpInfo = 0;
// loop
while (1)
{
    MLX90614_GetTo(MLX90614_DEFAULT_ADDRESS, &to);
    MLX90614_GetTa(MLX90614_DEFAULT_ADDRESS, &ta);
    MLX90614_GetTa(MLX90614_DEFAULT_ADDRESS, &dumpInfo);
    printf("log:%lf %lf %d\r\n", to, ta, dumpInfo);
    vTaskDelay(1000/portTICK_RATE_MS);
}
```
