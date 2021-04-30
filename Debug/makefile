################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include OS/subdir.mk
-include Drivers/STM32F3xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
os_test_f303.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
os_test_f303.list \

OBJCOPY_BIN += \
os_test_f303.bin \


# All Target
all: os_test_f303.elf secondary-outputs

# Tool invocations
os_test_f303.elf: $(OBJS) $(USER_OBJS) /home/snygg/STM32CubeIDE/workspace_1.2.0/os_test_f303/STM32F303VCTX_FLASH.ld
	arm-none-eabi-gcc -o "os_test_f303.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"/home/snygg/STM32CubeIDE/workspace_1.2.0/os_test_f303/STM32F303VCTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="os_test_f303.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

os_test_f303.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "os_test_f303.list"
	@echo 'Finished building: $@'
	@echo ' '

os_test_f303.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "os_test_f303.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
