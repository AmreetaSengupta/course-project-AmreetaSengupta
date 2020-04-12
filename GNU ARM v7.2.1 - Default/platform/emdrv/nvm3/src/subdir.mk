################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../platform/emdrv/nvm3/src/nvm3_default.c \
../platform/emdrv/nvm3/src/nvm3_hal_flash.c \
../platform/emdrv/nvm3/src/nvm3_lock.c 

OBJS += \
./platform/emdrv/nvm3/src/nvm3_default.o \
./platform/emdrv/nvm3/src/nvm3_hal_flash.o \
./platform/emdrv/nvm3/src/nvm3_lock.o 

C_DEPS += \
./platform/emdrv/nvm3/src/nvm3_default.d \
./platform/emdrv/nvm3/src/nvm3_hal_flash.d \
./platform/emdrv/nvm3/src/nvm3_lock.d 


# Each subdirectory must supply rules for building sources it contributes
platform/emdrv/nvm3/src/nvm3_default.o: ../platform/emdrv/nvm3/src/nvm3_default.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0x1700' '-DENABLE_LOGGING=1' '-DINCLUDE_LOGGING=1' '-DNVM3_DEFAULT_MAX_OBJECT_SIZE=512' '-D__STACK_SIZE=0x1000' '-DHAL_CONFIG=1' '-DMESH_LIB_NATIVE=1' '-DNVM3_DEFAULT_NVM_SIZE=24576' '-DEFR32BG13P632F512GM48=1' -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Include" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd\ssd2119" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emlib\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Source\GCC" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin\coexistence\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\halconfig" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\glib" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\CMSIS\Include" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\sleep\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\drivers" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\ble_stack\inc\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\common\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emlib\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\uartdrv\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\sleep\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\bsp" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\nvm3\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\ble_stack\src\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin\coexistence\hal\efr32" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\nvm3\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\common\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\EFR32BG13_BRD4104A\config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\gpiointerrupt\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd\display" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\protocol\ble" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\halconfig\inc\hal-config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\bootloader\api" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Source" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin" -O0 -fno-builtin -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emdrv/nvm3/src/nvm3_default.d" -MT"platform/emdrv/nvm3/src/nvm3_default.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emdrv/nvm3/src/nvm3_hal_flash.o: ../platform/emdrv/nvm3/src/nvm3_hal_flash.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0x1700' '-DENABLE_LOGGING=1' '-DINCLUDE_LOGGING=1' '-DNVM3_DEFAULT_MAX_OBJECT_SIZE=512' '-D__STACK_SIZE=0x1000' '-DHAL_CONFIG=1' '-DMESH_LIB_NATIVE=1' '-DNVM3_DEFAULT_NVM_SIZE=24576' '-DEFR32BG13P632F512GM48=1' -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Include" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd\ssd2119" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emlib\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Source\GCC" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin\coexistence\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\halconfig" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\glib" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\CMSIS\Include" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\sleep\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\drivers" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\ble_stack\inc\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\common\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emlib\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\uartdrv\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\sleep\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\bsp" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\nvm3\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\ble_stack\src\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin\coexistence\hal\efr32" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\nvm3\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\common\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\EFR32BG13_BRD4104A\config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\gpiointerrupt\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd\display" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\protocol\ble" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\halconfig\inc\hal-config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\bootloader\api" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Source" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin" -O0 -fno-builtin -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emdrv/nvm3/src/nvm3_hal_flash.d" -MT"platform/emdrv/nvm3/src/nvm3_hal_flash.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

platform/emdrv/nvm3/src/nvm3_lock.o: ../platform/emdrv/nvm3/src/nvm3_lock.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m4 -mthumb -std=c99 '-D__HEAP_SIZE=0x1700' '-DENABLE_LOGGING=1' '-DINCLUDE_LOGGING=1' '-DNVM3_DEFAULT_MAX_OBJECT_SIZE=512' '-D__STACK_SIZE=0x1000' '-DHAL_CONFIG=1' '-DMESH_LIB_NATIVE=1' '-DNVM3_DEFAULT_NVM_SIZE=24576' '-DEFR32BG13P632F512GM48=1' -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Include" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd\ssd2119" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emlib\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Source\GCC" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin\coexistence\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\halconfig" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\glib" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\CMSIS\Include" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\sleep\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\drivers" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\ble_stack\inc\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\common\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emlib\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\uartdrv\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\sleep\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\bt_mesh\inc\common" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\common\bsp" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\nvm3\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\protocol\bluetooth\ble_stack\src\soc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin\coexistence\hal\efr32" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\nvm3\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\chip\efr32\efr32xg1x" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\common\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\inc" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\service\sleeptimer\config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\hardware\kit\EFR32BG13_BRD4104A\config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\emdrv\gpiointerrupt\src" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\middleware\glib\dmd\display" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\protocol\ble" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\halconfig\inc\hal-config" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\bootloader\api" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\Device\SiliconLabs\EFR32BG13P\Source" -I"C:\Users\sengu\SimplicityStudio\v4_workspace\ecen-5823-mesh-node\platform\radio\rail_lib\plugin" -O0 -fno-builtin -Wall -c -fmessage-length=0 -ffunction-sections -fdata-sections -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -MMD -MP -MF"platform/emdrv/nvm3/src/nvm3_lock.d" -MT"platform/emdrv/nvm3/src/nvm3_lock.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


