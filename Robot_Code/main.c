/*
    Modified version of Robot_Base.c from the PIC32 makefiles for Project 2
*/

#include <XC.h>
#include <sys/attribs.h>
#include <stdio.h>
#include <stdlib.h>

/* Pinout for DIP28 PIC32MX130:
                                          --------
                                   MCLR -|1     28|- AVDD 
  VREF+/CVREF+/AN0/C3INC/RPA0/CTED1/RA0 -|2     27|- AVSS 
        VREF-/CVREF-/AN1/RPA1/CTED2/RA1 -|3     26|- AN9/C3INA/RPB15/SCK2/CTED6/PMCS1/RB15
   PGED1/AN2/C1IND/C2INB/C3IND/RPB0/RB0 -|4     25|- CVREFOUT/AN10/C3INB/RPB14/SCK1/CTED5/PMWR/RB14
  PGEC1/AN3/C1INC/C2INA/RPB1/CTED12/RB1 -|5     24|- AN11/RPB13/CTPLS/PMRD/RB13
   AN4/C1INB/C2IND/RPB2/SDA2/CTED13/RB2 -|6     23|- AN12/PMD0/RB12
     AN5/C1INA/C2INC/RTCC/RPB3/SCL2/RB3 -|7     22|- PGEC2/TMS/RPB11/PMD1/RB11
                                    VSS -|8     21|- PGED2/RPB10/CTED11/PMD2/RB10
                     OSC1/CLKI/RPA2/RA2 -|9     20|- VCAP
                OSC2/CLKO/RPA3/PMA0/RA3 -|10    19|- VSS
                         SOSCI/RPB4/RB4 -|11    18|- TDO/RPB9/SDA1/CTED4/PMD3/RB9
         SOSCO/RPA4/T1CK/CTED9/PMA1/RA4 -|12    17|- TCK/RPB8/SCL1/CTED10/PMD4/RB8
                                    VDD -|13    16|- TDI/RPB7/CTED3/PMD5/INT0/RB7
                    PGED3/RPB5/PMD7/RB5 -|14    15|- PGEC3/RPB6/PMD6/RB6
                                          --------
*/

 
// Configuration Bits (somehow XC32 takes care of this)
#pragma config FNOSC = FRCPLL       // Internal Fast RC oscillator (8 MHz) w/ PLL
#pragma config FPLLIDIV = DIV_2     // Divide FRC before PLL (now 4 MHz)
#pragma config FPLLMUL = MUL_20     // PLL Multiply (now 80 MHz)
#pragma config FPLLODIV = DIV_2     // Divide After PLL (now 40 MHz) 
#pragma config FWDTEN = OFF         // Watchdog Timer Disabled
#pragma config FPBDIV = DIV_1       // PBCLK = SYCLK
#pragma config FSOSCEN = OFF        // Turn off secondary oscillator on A4 and B4

// Defines
#define SYSCLK 40000000L
#define FREQ 100000L // We need the ISR for timer 1 every 10 us
#define Baud2BRG(desired_baud)( (SYSCLK / (16*desired_baud))-1)

// Measure pin period at pin 14 (RB5)
#define PIN_PERIOD (PORTB&(1<<5)) // Set bit 5 of PORTB SFR

volatile int ISR_pwm1=150, ISR_pwm2=150, ISR_cnt=0; // Declared variables as volatile, since they can be changed independent on normal code operation
unsigned char motor_con[4]; //vector to control pinout
// The Interrupt Service Routine for timer 1 is used to generate one or more standard
// hobby servo signals.  The servo signal has a fixed period of 20ms and a pulse width
// between 0.6ms and 2.4ms.

// Interrupt occurs on overflow of timer 1 (every 10 us)
/*
void __ISR(_TIMER_1_VECTOR, IPL5SOFT) Timer1_Handler(void)
{
	IFS0CLR=_IFS0_T1IF_MASK; // Clear timer 1 interrupt flag, bit 4 of IFS0

	ISR_cnt++; // Increment ISR counter every time interrupt occurs
	if(ISR_cnt==ISR_pwm1)
	{
		LATAbits.LATA3 = 0; // When ISR hits pwm value, set to zero
	}
	if(ISR_cnt==ISR_pwm2)
	{
		LATBbits.LATB4 = 0; // refer to comment above
	}
	if(ISR_cnt>=2000) // Reset ISR count every 20ms, drive motor pins high
	{
		ISR_cnt=0; // 2000 * 10us=20ms
		LATAbits.LATA3 = 1;
		LATBbits.LATB4 = 1;
	}
}
*/

void motor_isr(_TIMER_1_VECTOR, IPL5SOFT) Timer1_Handler(void)
{
 	IFS0CLR=_IFS0_T1IF_MASK; // Clear timer 1 interrupt flag, bit 4 of IFS0

	ISR_cnt++; // Increment ISR counter every time interrupt occurs
	if(ISR_cnt==ISR_pwm1)
	{
		LATBbits.LATB0 = 0; // When ISR hits pwm value, set to zero
        LATBbits.LATB1 = 0;
	}
	if(ISR_cnt==ISR_pwm2)
	{
		LATBbits.LATB2 = 0; // refer to comment above
        LATBbits.LATB3 = 0;
	}
	if(ISR_cnt>=2000) // Reset ISR count every 20ms, drive motor pins high
	{
		ISR_cnt=0; // 2000 * 10us=20ms
        // drive pins to motor_con vector values
        LATAbits.LATA3 = motor_con[0];
        LATBbits.LATB5 = motor_con[1];
        LATBbits.LATA4 = motor_con[2];
        LATBbits.LATB6 = motor_con[3];
	}   
}

void SetupTimer1 (void)
{
	// Explanation here: https://www.youtube.com/watch?v=bu6TTZHnMPY
	__builtin_disable_interrupts();
	PR1 =(SYSCLK/FREQ)-1; // since SYSCLK/FREQ = PS*(PR1+1)
	TMR1 = 0;
	T1CONbits.TCKPS = 0; // 3=1:256 prescale value, 2=1:64 prescale value, 1=1:8 prescale value, 0=1:1 prescale value
	T1CONbits.TCS = 0; // Clock source
	T1CONbits.ON = 1;
	IPC1bits.T1IP = 5;
	IPC1bits.T1IS = 0;
	IFS0bits.T1IF = 0;
	IEC0bits.T1IE = 1;
	
	INTCONbits.MVEC = 1; //Int multi-vector
	__builtin_enable_interrupts();
}
// Core timer information in section 2.2.3
// Use the core timer to wait for 1 ms.
void wait_1ms(void)
{
    unsigned int ui;
    _CP0_SET_COUNT(0); // resets the core timer count

    // get the core timer count
    while ( _CP0_GET_COUNT() < (SYSCLK/(2*1000)) );
}

void waitms(int len)
{
	while(len--) wait_1ms();
}

// GetPeriod() seems to work fine for frequencies between 200Hz and 700kHz.
// Obtain period of n periodic pulses
// Period is measured in (2/SYSCLK)s => 50ns intervals
long int GetPeriod (int n)
{
	int i;
	unsigned int saved_TCNT1a, saved_TCNT1b;
	
    _CP0_SET_COUNT(0); // resets the core timer count
	while (PIN_PERIOD!=0) // Wait for square wave to be 0
	{
		if(_CP0_GET_COUNT() > (SYSCLK/8)) return 0; // Core timer increments every 2 SYSCLK cycles, return 0 if more than 10*10^6 clk cycles elapse
	}

    _CP0_SET_COUNT(0); // resets the core timer count
	while (PIN_PERIOD==0) // Wait for square wave to be 1
	{
		if(_CP0_GET_COUNT() > (SYSCLK/8)) return 0;
	}
	
    _CP0_SET_COUNT(0); // resets the core timer count
	for(i=0; i<n; i++) // Measure the time of 'n' periods
	{
		while (PIN_PERIOD!=0) // Wait for square wave to be 0
		{
			if(_CP0_GET_COUNT() > (SYSCLK/8)) return 0;
		}
		while (PIN_PERIOD==0) // Wait for square wave to be 1
		{
			if(_CP0_GET_COUNT() > (SYSCLK/8)) return 0;
		}
	}

	return  _CP0_GET_COUNT();
}

// Configure UART port 2
void UART2Configure(int baud_rate)
{
    // Peripheral Pin Select
    U2RXRbits.U2RXR = 4;    //SET RX to RB8
    RPB9Rbits.RPB9R = 2;    //SET RB9 to TX

    U2MODE = 0;         // disable autobaud, TX and RX enabled only, 8N1, idle=HIGH
    U2STA = 0x1400;     // enable TX and RX
    U2BRG = Baud2BRG(baud_rate); // U2BRG = (FPb / (16*baud)) - 1
    
    U2MODESET = 0x8000;     // enable UART2
}

// Print string to UART
void uart_puts(char * s)
{
	while(*s)
	{
		putchar(*s);
		s++;
	}
}

// Print number of specified base to serial (up to equivalent hex base)
char HexDigit[]="0123456789ABCDEF";
void PrintNumber(long int val, int Base, int digits)
{ 
	int j;
	#define NBITS 32
	char buff[NBITS+1];
	buff[NBITS]=0;

	j=NBITS-1;
	while ( (val>0) | (digits>0) )
	{
		buff[j--]=HexDigit[val%Base];
		val/=Base;
		if(digits!=0) digits--;
	}
	uart_puts(&buff[j+1]);
}

// Good information about ADC in PIC32 found here:
// http://umassamherstm5.org/tech-tutorials/pic32-tutorials/pic32mx220-tutorials/adc
void ADCConf(void)
{
    AD1CON1CLR = 0x8000;    // disable ADC before configuration
    AD1CON1 = 0x00E0;       // internal counter ends sampling and starts conversion (auto-convert), manual sample
    AD1CON2 = 0;            // AD1CON2<15:13> set voltage reference to pins AVSS/AVDD
    AD1CON3 = 0x0f01;       // TAD = 4*TPB, acquisition time = 15*TAD 
    AD1CON1SET=0x8000;      // Enable ADC
}

// Reads ADC at specified pin
int ADCRead(char analogPIN)
{
    AD1CHS = analogPIN << 16;    // AD1CHS<16:19> controls which analog pin goes to the ADC
 
    AD1CON1bits.SAMP = 1;        // Begin sampling
    while(AD1CON1bits.SAMP);     // wait until acquisition is done
    while(!AD1CON1bits.DONE);    // wait until conversion done
 
    return ADC1BUF0;             // result stored in ADC1BUF0
}

void ConfigurePins(void)
{
    // Configure pins as analog inputs
    // Registers are bit addressable
    ANSELBbits.ANSB2 = 1;   // set RB2 (AN4, pin 6 of DIP28) as analog pin
    TRISBbits.TRISB2 = 1;   // set RB2 as an input
    ANSELBbits.ANSB3 = 1;   // set RB3 (AN5, pin 7 of DIP28) as analog pin
    TRISBbits.TRISB3 = 1;   // set RB3 as an input
    
	// Configure digital input pin to measure signal period
	ANSELB &= ~(1<<5); // Set RB5 as a digital I/O (pin 14 of DIP28)
    TRISB |= (1<<5);   // configure pin RB5 as input
    CNPUB |= (1<<5);   // Enable pull-up resistor for RB5
    
    // We can do the three lines above using this instead:
    // ANSELBbits.ANSELB5=0;  Not needed because RB5 can not be analog input?
    // TRISBbits.TRISB5=1;
    // CNPUBbits.CNPUB5=1;
    // Bit mask/address according to preference
    
    // Configure output pins
	TRISAbits.TRISA0 = 0; // pin  2 of DIP28
	TRISAbits.TRISA1 = 0; // pin  3 of DIP28
	TRISBbits.TRISB0 = 0; // pin  4 of DIP28
	TRISBbits.TRISB1 = 0; // pin  5 of DIP28
	TRISAbits.TRISA2 = 0; // pin  9 of DIP28
	TRISAbits.TRISA3 = 0; // pin 10 of DIP28
	TRISBbits.TRISB4 = 0; // pin 11 of DIP28
	INTCONbits.MVEC = 1;
}

// Print a fixed point number broken into its components
void PrintFixedPoint (unsigned long number, int decimals)
{
	int divider=1, j;
	
	j=decimals;
	while(j--) divider*=10;
	
	PrintNumber(number/divider, 10, 1);
	uart_puts(".");
	PrintNumber(number%divider, 10, decimals);
}
// Motor drive mode is defined by a numerical input
// 1 = forward, 2 = reverse, 3 = CW, 4 = CCW, otherwise = no motion
void update_motors (char control_flags)
{
        if (control_flags==1) //two forward
        {
            motor_con[0] = 1;
            motor_con[1] = 0;
            motor_con[2] = 1;
            motor_con[3] = 0;
        }
        else if (control_flags==2) //two reverse
        {
            motor_con[0] = 0;
            motor_con[1] = 1;
            motor_con[2] = 0;
            motor_con[3] = 1;
        }
        else if (control_flags==3) //CW rotation
        {
            motor_con[0] = 1;
            motor_con[1] = 0;
            motor_con[2] = 0;
            motor_con[3] = 1;
        }
        else if (control_flags==4) //CCW rotation
        {
            motor_con[0] = 0;
            motor_con[1] = 1;
            motor_con[2] = 1;
            motor_con[3] = 0;
        }
        else //default case no motion
        {
            motor_con[0] = 0;
            motor_con[1] = 0;
            motor_con[2] = 0;
            motor_con[3] = 0;
        }
}
// In order to keep this as nimble as possible, avoid
// using floating point or printf() on any of its forms!
void main(void)
{
	volatile unsigned long t=0;
    int adcval;
    long int v;
	unsigned long int count, f;
	unsigned char LED_toggle=0;
    // placeholder value for motor control variable
    unsigned char num = 0;

	CFGCON = 0;
  
    UART2Configure(115200);  // Configure UART2 for a baud rate of 115200
    ConfigurePins();
    SetupTimer1();
  
    ADCConf(); // Configure ADC
    
    waitms(500); // Give PuTTY time to start
	uart_puts("\x1b[2J\x1b[1;1H"); // Clear screen using ANSI escape sequence.
	uart_puts("\r\nPIC32 multi I/O example.\r\n");
	uart_puts("Measures the voltage at channels 4 and 5 (pins 6 and 7 of DIP28 package)\r\n");
	uart_puts("Measures period on RB5 (pin 14 of DIP28 package)\r\n");
	uart_puts("Toggles RA0, RA1, RB0, RB1, RA2 (pins 2, 3, 4, 5, 9, of DIP28 package)\r\n");
	uart_puts("Generates Servo PWM signals at RA3, RB4 (pins 10, 11 of DIP28 package)\r\n\r\n");
	while(1)
	{
        // test code to drive 
        update_motors(num);
        num++;
        if(num>4)
        {
            num = 0;
        }

    	adcval = ADCRead(4); // note that we call pin AN4 (RB2) by it's analog number
		uart_puts("ADC[4]=0x");
		PrintNumber(adcval, 16, 3);
		uart_puts(", V=");
		v=(adcval*3290L)/1023L; // 3.290 is VDD
		PrintFixedPoint(v, 3);
		uart_puts("V ");

		adcval=ADCRead(5);
		uart_puts("ADC[5]=0x");
		PrintNumber(adcval, 16, 3);
		uart_puts(", V=");
		v=(adcval*3290L)/1023L; // 3.290 is VDD
		PrintFixedPoint(v, 3);
		uart_puts("V ");

		count=GetPeriod(100); // Get period of 100 wave cycles
		if(count>0)
		{
			f=((SYSCLK/2L)*100L)/count; // Convert period units to Hz
			uart_puts("f=");
			PrintNumber(f, 10, 7);
			uart_puts("Hz, count=");
			PrintNumber(count, 10, 6);
			uart_puts("          \r");
		}
		else
		{
			uart_puts("NO SIGNAL                     \r");
		}

		// Now toggle the pins on/off to see if they are working.
		// First turn all off:
		LATAbits.LATA0 = 0;	
		LATAbits.LATA1 = 0;			
		LATBbits.LATB0 = 0;			
		LATBbits.LATB1 = 0;		
		LATAbits.LATA2 = 0;			
		// Now turn on one of the outputs per loop cycle to check
		switch (LED_toggle++)
		{
			case 0:
				LATAbits.LATA0 = 1;
				break;
			case 1:
				LATAbits.LATA1 = 1;
				break;
			case 2:
				LATBbits.LATB0 = 1;
				break;
			case 3:
				LATBbits.LATB1 = 1;
				break;
			case 4:
				LATAbits.LATA2 = 1;
				break;
			default:
				break;
		}
		if(LED_toggle>4) LED_toggle=0;

		// Change the servo PWM signals, values continuously drive motor ISR
		if (ISR_pwm1<200)
		{
			ISR_pwm1++; // Slowly ramp up PWM
		}
		else
		{
			ISR_pwm1=100;	// Go back down to 100
		}

		if (ISR_pwm2>100) // Ramp down PWM
		{
			ISR_pwm2--;
		}
		else
		{
			ISR_pwm2=200;   // Go back up to 100
		}

		waitms(200);
	}
}
/*
PIC32 Pinout (Robot Components)
                                          --------
                                   MCLR -|1     28|- AVDD 
  VREF+/CVREF+/AN0/C3INC/RPA0/CTED1/RA0 -|2     27|- AVSS 
        VREF-/CVREF-/AN1/RPA1/CTED2/RA1 -|3     26|- JDY40 RXD
                           Left Motor F -|4     25|- JDY40 SET
                           Left Motor R -|5     24|- JDY40 TXD
                          Right Motor F -|6     23|- AN12/PMD0/RB12
                          Right Motor R -|7     22|- PGEC2/TMS/RPB11/PMD1/RB11
                                    VSS -|8     21|- PGED2/RPB10/CTED11/PMD2/RB10
                     OSC1/CLKI/RPA2/RA2 -|9     20|- VCAP
                OSC2/CLKO/RPA3/PMA0/RA3 -|10    19|- VSS
                         SOSCI/RPB4/RB4 -|11    18|- TDO/RPB9/SDA1/CTED4/PMD3/RB9
         SOSCO/RPA4/T1CK/CTED9/PMA1/RA4 -|12    17|- TCK/RPB8/SCL1/CTED10/PMD4/RB8
                                    VDD -|13    16|- TDI/RPB7/CTED3/PMD5/INT0/RB7
                     Period Measurement -|14    15|- JDY40 BOOT (transmit data)
                                          --------

*/