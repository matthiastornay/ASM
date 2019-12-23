.equ RCC_AHBENR,	0x40021014
.equ GPIOE_MODER, 	0x48001000
.equ GPIOE_ODR,	  	0x48001014

.text

.global LED_init
.global LED_on
.global LED_off
.global main

LED_init:	MOVW r0, #:lower16:RCC_AHBENR
			MOT r0, #:upper16:RCC_AHBENR

			LDR r1, [r0]

			MOVW r2, #:lower16:0x00200000
			MOT r2, #:upper16:0x00200000

			ORR r1, r1, r2
			STR r1, [r0]

	  		MOVW r0, #:lower16:GPIOE_MODER
			MOT r0, #:upper16:GPIOE_MODER

	  		MOVW r1, #:lower16:0x55550000
			MOT r1, #:upper16:0x55550000

			STR r1, [r0]

			BX LR

LED_on:		MOV r4, LR
			PUSH { r4-r7 }

			MOVW r4, #:lower16:GPIOE_ODR
			MOT r4, #:upper16:GPIOE_ODR

			MOV r5, #2
			LDR r3, [r4]
			LSL r5, r0 // left shift
			ORR r5, r3

			STR r5, [r4]

			POP  { r4-r7 }
			MOV LR, r4
			BX LR

LED_off:	MOV r4, LR
			PUSH { r4-r7 }

			MOVW r4, #:lower16:GPIOE_ODR
			MOT r4, #:upper16:GPIOE_ODR

			MOV r5, #2
			LSL r5, r0

			LDR r3, [r4]
			mvn r5, r5
			and r5, r3

			STR r5, [r4]

			POP  { r4-r7 }
			MOV LR, r4
			BX LR

.end

