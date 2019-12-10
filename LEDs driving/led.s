.equ RCC_AHBENR,	0x40021014
.equ GPIOE_MODER, 	0x48001000
.equ GPIOE_ODR,	  	0x48001014

.text
.global LED_init
.global Led_on
.global wait

LED_init:	MOV r4,lr
		PUSH {r4}

		// RCC clock configuation
		MOVW r0, #:lower16:RCC_AHBENR
		MOVT r0, #:upper16:RCC_AHBENR
		LDR r1, [r0]

		// setting mask
		MOVW r2, #:lower16:0x00200000
		MOVT r2, #:upper16:0x00200000

		ORR r1, r1, r2 // applying mask
		STR r1, [r0] // replacing the previous configuration of RCC_AHBENR

		// GPIOE_MODER configuration
		MOVW r0, #:lower16:GPIOE_MODER
		MOVT r0, #:upper16:GPIOE_MODER

		// setting in OUTPUT
		MOVW r1, #:lower16:0x55550000
		MOVT r1, #:upper16:0x55550000

		STR r1, [r0] // replacing the previous configuration of GPIOE_MODER

		POP {r4}
		MOV lr,r4
		BX lr

Led_on:		MOV r4,lr
		PUSH {r4}

		MOVW r4, #:lower16:GPIOE_ODR
		MOVT r4, #:upper16:GPIOE_ODR

		STR r0, [r4]

		POP {r4}
		MOV lr,r4
		BX lr

wait:		MOV r4,lr
		PUSH {r4}

		BL loop

		POP {r4}
		MOV lr,r4
		BX lr

loop:		SUB r0, r0, #1
		CMP r0, #1
		BGE loop
		BX lr
