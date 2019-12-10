.equ 	N, 10
.equ 	TIMES, 16

.data

vector: 	.int 1,236,3,154,32,11,236,153,254,35
max: 		.int 0
mul_by_17: 	.int 0 // for the purpose of training, the MUL instruction is prohibited

.text
.global main

main:	ldr r0, =vector
	mov r1, #0 // index
	ldr r2, [r0] // actual vmax
	ldr r4, =max // vmax address

increment:	add r1, r1, #1
		add r0, r0, #4

test:	ldr r3, [r0]
	cmp r2, r3
	blt replace
	b looping

replace:	mov r2, r3

looping:	cmp r1, #N
		ble increment
		str r2, [r4]

multiply_init:	ldr r5, =mul_by_17
		mov r1, #0
		mov r6, r2

multiply:	add r1, r1, #1
		add r2, r2, r6
		cmp r1, #TIMES
		blt multiply
		str r2, [r5]
		b end

end:	bx lr

.end
