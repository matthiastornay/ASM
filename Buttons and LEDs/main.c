#include <stdlib.h>
#include "LED.h"
#include "Button.h"

// Globals
int LEDS[8] = {LED4, LED3, LED5, LED7, LED9, LED10, LED8, LED6};
int state = 0;

int main(void) { // Main function (THREAD mode)

	// Configure GPIO, PORT E and IT
	LED_init();
	Config_Button_IT();

	while(1); // infinite loop, waiting for IT

	return 0;

}

void EXTI0_IRQHandler(void) { // IT function (HANDLER mode)

	state = ~state; // switch OFF/ON the LED state
	(state) ? LED_on(LEDS[0]): LED_off(LEDS[0]); // if ... else ...

	Clean_IT_Button(); // clean the pending IT

	return;

}

