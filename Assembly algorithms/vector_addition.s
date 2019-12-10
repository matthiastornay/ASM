.equ R, 4
.equ C, 4
.equ N, R*C

.data

matrix1:	.byte 165,67,107,67,236,93,20,80,80,77,59,158,51,164,69,20
matrix2:	.byte 195,65,224,205,136,83,217,130,23,27,20,10,61,166,39,30
result:		.long 0

.text
.global main

main:	ldr r1, =matrix1
		ldr r2, =matrix2
		ldr r0, =result

		mov r5, #0
		mov r6, #0

loop:	cmp r6, #N
		bgt end
		ldrb r3, [r1]
		ldrb r4, [r2]
		add r5, r3, r4
		str r5, [r0]
		add r1, r1, #1
		add r2, r2, #1
		add r0, r0, #1
		add r6, r6, #1
		b loop

end:	bx lr

.end

