#include <stdlib.h>

#define OPERATIONS 50000

void main(void) {

	LED_init();

	int i, j, value;

	for(i = 1; i < 10; i++) {

		value = 256;

		for(j = 0; j < 4; j++) {
			
			Led_on(value << j);
			wait(OPERATIONS * i);
			
		}

		value = 32768;

		for(j = 0; j < 4; j++) {
			
			Led_on(value >> j);
			wait(OPERATIONS * i);
			
		}

	}

	Led_on(0);
	wait(1000000);

	for(i = 0; i <= 32768; i += 16) {
		
		Led_on(i);
		wait(10000);
		
	}

	Led_on(0);

	return;

}
