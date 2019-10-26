.thumb
.syntax unified

.include "gpio_constants.s"     // Register-adresser og konstanter for GPIO

.text
	.global Start
	
Start:

    LDR R0, =GPIO_BASE + (PORT_SIZE*LED_PORT) +GPIO_PORT_DOUTSET
	LDR R1, =GPIO_BASE + (PORT_SIZE*LED_PORT) +GPIO_PORT_DOUTCLR

	LDR R2, =GPIO_BASE + (PORT_SIZE*BUTTON_PORT) + GPIO_PORT_DIN

	LDR R3, =1
	LSL R3, R3, #LED_PIN
	LDR R4, =1
	LSL R4, R4, #BUTTON_PIN

loop:
	LDR R6, [R2]
	CMP R6, R4
	BNE False
		STR R3, [R1]
		B loop
	False:
		STR R3, [R0]
		B loop

NOP // Behold denne pÃ¥ bunnen av fila
