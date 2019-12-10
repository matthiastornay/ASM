.equ RCC_AHBENR,	0x40021014
.equ GPIOE_MODER, 	0x48001000
.equ GPIOE_ODR,	  	0x48001014

.text
.global LED_init
.global Led_on
.global wait

LED_init:	mov r4,lr
 			push {r4}

			// configuration de la clock avec RCC
 			movw r0, #:lower16:RCC_AHBENR
  			movt r0, #:upper16:RCC_AHBENR
  			ldr r1, [r0]

  			// mise en place du masque
  			movw r2, #:lower16:0x00200000
  			movt r2, #:upper16:0x00200000

 			orr r1, r1, r2 // on applique le masque
 			str r1, [r0] // on enregistre le registre masquée dans r0

			// accès au registre de configuration du mode
			movw r0, #:lower16:GPIOE_MODER
			movt r0, #:upper16:GPIOE_MODER

			// configuration en mode OUTPUT
			movw r1, #:lower16:0x55550000
			movt r1, #:upper16:0x55550000

			str r1, [r0] // on place la valeur de configuration en mode OUTPUT

 			pop {r4}
			mov lr,r4
			bx lr

Led_on:		mov r4,lr
 			push {r4}

 			movw r4, #:lower16:GPIOE_ODR
 			movt r4, #:upper16:GPIOE_ODR

			str r0, [r4]

 			pop {r4}
			mov lr,r4
			bx lr

wait:		mov r4,lr
 			push {r4}

 			bl loop

 			pop {r4}
			mov lr,r4
			bx lr

loop:		sub r0, r0, #1
			cmp r0, #1
			bge loop
			bx lr

