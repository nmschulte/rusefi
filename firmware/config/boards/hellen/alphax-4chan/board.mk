# Combine the related files for a specific platform and MCU.

# Target ECU board design
BOARDCPPSRC = $(BOARD_DIR)/board_configuration.cpp
DDEFS += -DEFI_MAIN_RELAY_CONTROL=TRUE

# This board has trigger scope hardware!
DDEFS += -DTRIGGER_SCOPE

# Add them all together
DDEFS += -DFIRMWARE_ID=\"AlphaX-4chan\"
DDEFS += -DEFI_SOFTWARE_KNOCK=TRUE -DSTM32_ADC_USE_ADC3=TRUE

# pretty temporary
DDEFS += -DDISABLE_PIN_STATE_VALIDATION=TRUE

include $(BOARDS_DIR)/hellen/hellen-common144.mk

DDEFS += $(PRIMARY_COMMUNICATION_PORT_USART2)

DDEFS += -DSHORT_BOARD_NAME=alphax-4chan
