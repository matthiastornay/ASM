.equ R, 4
.equ C, 4
.equ N, R*C

.data

matrix1:	.byte 165, 67, 107, 67, 236, 93, 20, 80, 80, 77, 59, 158, 51, 164, 69, 20
matrix2:	.byte 195, 65, 224, 205, 136, 83, 217, 130, 23, 27, 20, 10, 61, 166, 39, 30
result:		.long 0

.text
.global main

main:	LDR r1, =matrix1
	LDR r2, =matrix2
	LDR r0, =result

	MOV r5, #0
	MOV r6, #0

loop:	CMP r6, #N
	BGT end
	LDRB r3, [r1]
	LDRB r4, [r2]
	ADD r5, r3, r4
	STR r5, [r0]
	ADD r1, r1, #1
	ADD r2, r2, #1
	ADD r0, r0, #1
	ADD r6, r6, #1
	B loop

end:	BX lr

.end

