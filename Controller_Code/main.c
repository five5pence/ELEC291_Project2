#include <EFM8LB1.h>
#include <stdio.h>

// custom headers from makefile
#include "timing.h"
#include "lcd.h"
#include "adc.h"

// read serial input and put into string
int getsn (char * buff, int len)
{
	int j;
	char c;
	
	for(j=0; j<(len-1); j++)
	{
		c=getchar();
		if ( (c=='\n') || (c=='\r') )
		{
			buff[j]=0;
			return j;
		}
		else
		{
			buff[j]=c;
		}
	}
	buff[j]=0;
	return len;
}

// Call functions as you did in lab 4/5, the makefile takes care of the rest
void main (void)
{ 
    float v[4];
    char buff[17];

    InitADC();
    LCD_4BIT();

    waitms(500); // Give PuTTy a chance to start before sending
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	
	printf ("Controller test program\n"
	        "File: %s\n"
	        "Compiled: %s, %s\n\n",
	        __FILE__, __DATE__, __TIME__);

    while(1)
    {
        // Controller code here

    }
}