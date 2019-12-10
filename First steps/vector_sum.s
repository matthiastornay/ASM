.data

vector: .int 25,-5,60,20
result:	.int 0

.text
.global main

main:		ldr r0, =vector
			mov r1, #0
			mov r2, #0
loop:		add r1, r1, #1
        	ldr r3, [r0]
        	add r2, r2, r3
        	add r0, r0, #4
test_loop: 	cmp r1, #4
        	blt loop
        	str r2, [r0]
			bx lr

.end