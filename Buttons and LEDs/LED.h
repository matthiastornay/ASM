#ifndef LED_H_
#define LED_H_

#define LED3		9
#define LED4		8
#define LED5		10
#define LED6		15
#define LED7		11
#define LED8		14
#define LED9		12
#define LED10		13

void LED_init(void);
void LED_on(int LEDid);
void LED_off(int LEDid);

#endif

