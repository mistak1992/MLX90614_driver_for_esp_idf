# Install script for directory: B:/esp-idf/components/mbedtls/mbedtls/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/mkcooling")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/aes.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/aesni.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/arc4.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/aria.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/asn1.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/asn1write.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/base64.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/bignum.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/blowfish.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/bn_mul.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/camellia.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ccm.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/certs.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/chacha20.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/chachapoly.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/check_config.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/cipher.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/cipher_internal.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/cmac.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/compat-1.3.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ctr_drbg.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/debug.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/des.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/dhm.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecdh.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecdsa.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecjpake.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecp.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecp_internal.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/entropy.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/entropy_poll.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/error.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/gcm.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/havege.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/hkdf.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/hmac_drbg.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md2.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md4.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md5.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md_internal.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/net.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/net_sockets.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/nist_kw.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/oid.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/padlock.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pem.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pk.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pk_internal.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs11.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs12.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs5.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform_time.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform_util.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/poly1305.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ripemd160.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/rsa.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/rsa_internal.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha1.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha256.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha512.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_cache.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_cookie.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_internal.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_ticket.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/threading.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/timing.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/version.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_crl.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_crt.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_csr.h"
    "B:/esp-idf/components/mbedtls/mbedtls/include/mbedtls/xtea.h"
    )
endif()

