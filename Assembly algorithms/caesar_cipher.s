// The switch from Z to A is not handled

.equ ADDR_HIGH, 0x2000
.equ ADDR_LOW, 0x0050

.data

message: 	.string "Le truc, pour voler, c'est de se jeter au sol et de rater son coup. - D. Adams"
key:		.byte 5
len:		.long 0

.text
.global main

main:		ldr r0, =message
		ldrb r1, =key
		ldr r5, =len
		mov r6, #0
		ldrb r2, [r1]
		mov r4, #ADDR_LOW
		movt r4, #ADDR_HIGH

loop:		ldrb r3, [r0]
		cmp r3, #0
		beq end
		add r3, r3, r2
		str r3, [r4]
		add r6, r6, #1
		add r0, r0, #1
		add r4, r4, #1
		b loop

end:		STR r6, [r5]
		BX lr

.end
