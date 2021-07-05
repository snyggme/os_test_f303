################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../OS/osasm.s 

C_SRCS += \
../OS/os.c 

OBJS += \
./OS/os.o \
./OS/osasm.o 

S_DEPS += \
./OS/osasm.d 

C_DEPS += \
./OS/os.d 


# Each subdirectory must supply rules for building sources it contributes
OS/os.o: ../OS/os.c OS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F303xC -DDEBUG -c -I../OS/ -I../Core/Startup -I../Drivers/ -I../Drivers/STM32F3xx_HAL_Driver/Src/ -I../Drivers/STM32F3xx_HAL_Driver/Inc/ -I../Core/Inc/ -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include/ -I../Drivers/CMSIS/Include/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"OS/os.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
OS/osasm.o: ../OS/osasm.s OS/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"OS/osasm.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

