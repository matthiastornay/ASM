.data

vector: .int 25, -5, 60, 20
result:	.int 0

.text
.global main

main:	LDR r0, =vector
	MOV r1, #0
	MOV r2, #0
	
loop:	ADD r1, r1, #1
	LDR r3, [r0]
	ADD r2, r2, r3
	ADD r0, r0, #4
		
test_loop:	CMP r1, #4
		BLT loop
		STR r2, [r0]
		BX lr

.end
