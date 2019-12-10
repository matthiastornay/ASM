// Trial divison, adapted from the C script linked
// in the report.

.equ N, 251

.text
.global main

main: 	MOV r0, #N
		MOV r6, #1
		AND r0, r0, r6
		EOR r0, r0, r6 // Logical NOT

		MOV r7, #N

		MOV r2, #3

		CMP r0, #1
		BEQ return_2
		CMP r7, #2
		BLT return_2

		UDIV r3, r7, r2

loop_start:	CMP r2, r3
			BGT return_true

do_modulo:	SUB r5, r7, r2
			ADD r2, #1
			CMP r5, r2
			BGT do_modulo

loop_end:	MVN r5, r5
			CMP r5, #1
			BEQ return_false
			ADD r2, r2, #2
			B loop_start

return_2:	CMP r7, #2
			BEQ return_true
			B return_false

return_true:	MOV r1, #1
				B end

return_false:	MOV r1, #0
				B end

end:	BX lr

