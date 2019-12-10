.equ 	N, 10
.equ 	TIMES, 16

.data

vector: 	.int 1,236,3,154,32,11,236,153,254,35
max: 		.int 0
mul_by_17: 	.int 0 // for the purpose of training, the MUL instruction is prohibited

.text
.global main

main:	LDR r0, =vector
	MOV r1, #0 // index
	LDR r2, [r0] // actual vmax
	LDR r4, =max // vmax address

increment:	ADD r1, r1, #1
		ADD r0, r0, #4

test:	LDR r3, [r0]
	CMP r2, r3
	BLT replace
	B looping

replace:	MOV r2, r3

looping:	CMP r1, #N
		BLE increment
		STR r2, [r4]

multiply_init:	LDR r5, =mul_by_17
		MOV r1, #0
		MOV r6, r2

multiply:	ADD r1, r1, #1
		ADD r2, r2, r6
		CMP r1, #TIMES
		BLT multiply
		STR r2, [r5]
		b end

end:	BX lr

.end
