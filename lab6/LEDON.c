//Turn On LED

#include "piHelpers.h"
int main(void)
{
	
	// Turn on the LED
	pioInit();
	pinMode(LEDPIN, OUTPUT);
	digitalWrite(LEDPIN, 1);

	getVoltage();
	
	//HTML header
	printf("%s%c%c\n",
		"Content-Type:text/html;charset=iso-8859-1",13,10);
		
	// Redirect to LEDCON with no delay
	printf("<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;url=index.html\">");
	return 0;

}
