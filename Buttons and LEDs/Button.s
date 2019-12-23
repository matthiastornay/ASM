.equ RCC_AHBENR,		0x40021014
.equ RCC_APB2ENR,		0x40021018
.equ GPIOA_MODER, 		0x48000000
.equ SYSCFG_EXTICR1,	0x40010008
.equ EXTI_IMR1,			0x40010400
.equ EXTI_EMR1,			0x40010404
.equ EXTI_RTSR,			0x40010408
.equ EXTI_PR1,			0x40010414
.equ NVIC_ISER0, 		0xE000E100

.text

.global Config_Button_IT
.global Clean_IT_Button

Config_Button_IT:	MOVW r0, #:lower16:RCC_APB2ENR
					MOVT r0, #:upper16:RCC_APB2ENR

					MOV r1, #1
					STR r1, [r0]

					MOVW r0, #:lower16:RCC_AHBENR
					MOVT r0, #:upper16:RCC_AHBENR

					LDR r1, [r0]

					MOVW r2, #:lower16:0x00020000
					MOVT r2, #:upper16:0x00020000

					ORR r1, r2
					STR r1, [r0]

			  		MOVW r0, #:lower16:GPIOA_MODER
					MOVT r0, #:upper16:GPIOA_MODER

					LDR r1, [r0]
			  		MOVW r2, #:lower16:0xFFFFFFFC
					MOVT r2, #:upper16:0xFFFFFFFC

					AND r1, r2
					STR r1, [r0]

			 		MOVW r0, #:lower16:SYSCFG_EXTICR1
					MOVT r0, #:upper16:SYSCFG_EXTICR1

					LDR r1, [r0]
			  		MOVW r2, #:lower16:0xFFFFFFF8
					MOVT r2, #:upper16:0xFFFFFFF8

					AND r1, r2
					STR r1, [r0]

			 		MOVW r0, #:lower16:NVIC_ISER0
					MOVT r0, #:upper16:NVIC_ISER0

					LDR r1, [r0]
			  		MOV r2, #0x40

					ORR r1, r2
					STR r1, [r0]

			 		MOVW r0, #:lower16:EXTI_IMR1
					MOVT r0, #:upper16:EXTI_IMR1

					LDR r1, [r0]
			  		MOV r2, #1

					ORR r1, r2
					STR r1, [r0]

				 	MOVW r0, #:lower16:EXTI_EMR1
					MOVT r0, #:upper16:EXTI_EMR1

					LDR r1, [r0]
			  		MOV r2, #1

					ORR r1, r2
					STR r1, [r0]

			 		MOVW r0, #:lower16:EXTI_RTSR
					MOVT r0, #:upper16:EXTI_RTSR

					LDR r1, [r0]
			  		MOV r2, #1

					ORR r1, r2
					STR r1, [r0]

					BX LR

Clean_IT_Button:	PUSH { r4-r5 }

					MOVW r4, #:lower16:EXTI_PR1
					MOVT r4, #:upper16:EXTI_PR1

					LDR r5, [r4]
				  	MOV r6, #0x1

					ORR r5, r6
					STR r5, [r4]

					POP { r4-r5 }

					BX LR

.end

