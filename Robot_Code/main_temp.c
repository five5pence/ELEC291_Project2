#include <XC.h>
#include <sys/attribs.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

// Defines
#define SYSCLK 40000000L
#define FREQ 100000L
#define Baud2BRG(desired_baud)( (SYSCLK / (16*desired_baud))-1)
#define Baud1BRG(desired_baud)( (SYSCLK / (16*desired_baud))-1)

#define PIN_PERIOD (PORTB&(1<<5))

volatile int ISR_pwm1=0, ISR_pwm2=50, ISR_cnt=0; // Declared variables as volatile, since they can be changed independent on normal code operation
unsigned char motor_con[4];

void __ISR(_TIMER_1_VECTOR, IPL5SOFT) Timer1_Handler(void)
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
        LATBbits.LATB0 = motor_con[0];
        LATBbits.LATB1 = motor_con[1];
        LATBbits.LATB2 = motor_con[2];
        LATBbits.LATB3 = motor_con[3];
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

void numsfromstr (char *string, int buffer[])
{
	int i;
	int j = 0;
	char temp[8]; //temporary number storage buffer

	//clear buffer
	buffer[0] = 0;
	buffer[1] = 0;
	buffer[2] = 0;
	// scan length of string
	do
	{
		if (((string[i] - '0') >= 0) && ((string[i] - '0') <= 9)) //ASCII number detection
		{
			// put value into a char array if the value is an int
			temp[j] = string[i];
			j++;
		}
		i++; //increment through string
	}
	while (string[i] != '\0');

	//temp[j+1] = '/0'; //terminate temp to make it a proper string

	buffer[0] = (temp[0] - '0'); // cast chars to int values
	buffer[1] += (temp[1]-'0')*100;
	buffer[1] += (temp[2]-'0')*10;
	buffer[1] += (temp[3]-'0');
	buffer[2] += (temp[4]-'0')*100;
	buffer[2] += (temp[5]-'0')*10;
	buffer[2] += (temp[6]-'0');
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

void ConfigurePins(void)
{   
	// Configure digital input pin to measure signal period
	//ANSELB &= ~(1<<5); // Set RB5 as a digital I/O (pin 14 of DIP28)
    //TRISB |= (1<<5);   // configure pin RB5 as input
    //CNPUB |= (1<<5);   // Enable pull-up resistor for RB5
	// RB14 is connected to the 'SET' pin of the JDY40.  Configure as output:
    ANSELB &= ~(1<<14); // Set RB14 as a digital I/O
    TRISB &= ~(1<<14);  // configure pin RB14 as output
	LATB |= (1<<14);    // 'SET' pin of JDY40 to 1 is normal operation mode
    
    // Configure output pins
	TRISBbits.TRISB0 = 0; // pin  4 of DIP28
	TRISBbits.TRISB1 = 0; // pin  5 of DIP28
	TRISBbits.TRISB2 = 0; // pin  6 of DIP28
	TRISBbits.TRISB3 = 0; // pin  7 of DIP28

	INTCONbits.MVEC = 1;
}

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

// Needed to by scanf() and gets()
int _mon_getc(int canblock)
{
	char c;
	
    if (canblock)
    {
	    while( !U2STAbits.URXDA); // wait (block) until data available in RX buffer
	    c=U2RXREG;
        while( U2STAbits.UTXBF);    // wait while TX buffer full
        U2TXREG = c;          // echo
	    if(c=='\r') c='\n'; // When using PUTTY, pressing <Enter> sends '\r'.  Ctrl-J sends '\n'
		return (int)c;
    }
    else
    {
        if (U2STAbits.URXDA) // if data available in RX buffer
        {
		    c=U2RXREG;
		    if(c=='\r') c='\n';
			return (int)c;
        }
        else
        {
            return -1; // no characters to return
        }
    }
}

/////////////////////////////////////////////////////////
// UART1 functions used to communicate with the JDY40  //
/////////////////////////////////////////////////////////

// TXD1 is in pin 26
// RXD1 is in pin 24

int UART1Configure(int desired_baud)
{
	int actual_baud;

    // Peripheral Pin Select for UART1.  These are the pins that can be used for U1RX from TABLE 11-1 of '60001168J.pdf':
    // 0000 = RPA2
	// 0001 = RPB6
	// 0010 = RPA4
	// 0011 = RPB13
	// 0100 = RPB2

	// Do what the caption of FIGURE 11-2 in '60001168J.pdf' says: "For input only, PPS functionality does not have
    // priority over TRISx settings. Therefore, when configuring RPn pin for input, the corresponding bit in the
    // TRISx register must also be configured for input (set to ??."
    
    ANSELB &= ~(1<<13); // Set RB13 as a digital I/O
    TRISB |= (1<<13);   // configure pin RB13 as input
    CNPUB |= (1<<13);   // Enable pull-up resistor for RB13
    U1RXRbits.U1RXR = 3; // SET U1RX to RB13

    // These are the pins that can be used for U1TX. Check table TABLE 11-2 of '60001168J.pdf':
    // RPA0
	// RPB3
	// RPB4
	// RPB15
	// RPB7

    ANSELB &= ~(1<<15); // Set RB15 as a digital I/O
    RPB15Rbits.RPB15R = 1; // SET RB15 to U1TX	
	
    U1MODE = 0;         // disable autobaud, TX and RX enabled only, 8N1, idle=HIGH
    U1STA = 0x1400;     // enable TX and RX
    U1BRG = Baud1BRG(desired_baud); // U1BRG = (FPb / (16*baud)) - 1
    // Calculate actual baud rate
    actual_baud = SYSCLK / (16 * (U1BRG+1));

    U1MODESET = 0x8000;     // enable UART1

    return actual_baud;
}
 
int SerialTransmit1(const char *buffer)
{
    unsigned int size = strlen(buffer);
    while(size)
    {
        while( U1STAbits.UTXBF);    // wait while TX buffer full
        U1TXREG = *buffer;          // send single character to transmit buffer
        buffer++;                   // transmit next character on following loop
        size--;                     // loop until all characters sent (when size = 0)
    }
 
    while( !U1STAbits.TRMT);        // wait for last transmission to finish
 
    return 0;
}
 
unsigned int SerialReceive1(char *buffer, unsigned int max_size)
{
    unsigned int num_char = 0;
 
    while(num_char < max_size)
    {
        while( !U1STAbits.URXDA);   // wait until data available in RX buffer
        *buffer = U1RXREG;          // empty contents of RX buffer into *buffer pointer
 
        // insert nul character to indicate end of string
        if( *buffer == '\n')
        {
            *buffer = '\0';     
            break;
        }
 
        buffer++;
        num_char++;
    }
 
    return num_char;
}

// Use the core timer to wait for 1 ms.
void wait_1ms(void)
{
    unsigned int ui;
    _CP0_SET_COUNT(0); // resets the core timer count

    // get the core timer count
    while ( _CP0_GET_COUNT() < (SYSCLK/(2*1000)) );
}

void delayms(int len)
{
	while(len--) wait_1ms();
}

void SendATCommand (char * s)
{
	char buff[40];
	printf("Command: %s", s);
	LATB &= ~(1<<14); // 'SET' pin of JDY40 to 0 is 'AT' mode.
	delayms(10);
	SerialTransmit1(s);
	SerialReceive1(buff, sizeof(buff)-1);
	LATB |= 1<<14; // 'SET' pin of JDY40 to 1 is normal operation mode.
	delayms(10);
	printf("Response: %s\n", buff);
}

void main(void)
{
	char buff[80];
    int cnt=0;
    int mode = 0;
    int count, f;
    char *c;
    int num1,num2,num3;
    
	DDPCON = 0;
	CFGCON = 0;
  
    UART2Configure(115200);  // Configure UART2 for a baud rate of 115200
    UART1Configure(9600);  // Configure UART1 to communicate with JDY40 with a baud rate of 9600
    SetupTimer1();
    ConfigurePins();
	delayms(500); // Give putty time to start before we send stuff.
    //printf("JDY40 test program.\r\n");

	// RB14 is connected to the 'SET' pin of the JDY40.  Configure as output:
    ANSELB &= ~(1<<14); // Set RB14 as a digital I/O
    TRISB &= ~(1<<14);  // configure pin RB14 as output
	LATB |= (1<<14);    // 'SET' pin of JDY40 to 1 is normal operation mode

	// We should select an unique device ID.  The device ID can be a hex
	// number from 0x0000 to 0xFFFF.  In this case is set to 0xABBA
	SendATCommand("AT+DVID9B9A\r\n");  

	// To check configuration
	SendATCommand("AT+VER\r\n");
	SendATCommand("AT+BAUD\r\n");
	SendATCommand("AT+RFID\r\n");
	SendATCommand("AT+DVID\r\n");
	SendATCommand("AT+RFC\r\n");
	SendATCommand("AT+POWE\r\n");
	SendATCommand("AT+CLSS\r\n");

    ANSELB &= ~(1<<6); // Set RB6 as a digital I/O
    TRISB |= (1<<6);   // configure pin RB6 as input
    CNPUB |= (1<<6);   // Enable pull-up resistor for RB6
 	
	//printf("\r\nPress and hold a push-button attached to RB6 (pin 15) to transmit.\r\n");
	
	while(1)
	{
	
		
		/*count=GetPeriod(100); // Get period of 100 wave cycles
		
		
		if (count > 22000){
			count=GetPeriod(100); // If invalid, measure again
		}

		if(count>0)
		{
			f=((SYSCLK/2L)*100L)/count; // Convert period units to Hz

			uart_puts("f="); // serial print for debugging
			PrintNumber(f, 10, 7);
			uart_puts("Hz, count=");
			PrintNumber(count, 10, 6);
			uart_puts("          \n");
		}
		else
		{
			uart_puts("NO FREQUENCY ON PIN14                     \r");
		}*/
		
        // Read serial values from JDY40
		if(U1STAbits.URXDA)
		{
				//printf("y");
				SerialReceive1(buff, sizeof(buff)-1);
				if (strlen(buff)==9){
					num1=atoi(&buff[0]);
					num2=atoi(&buff[2]);
					num3=atoi(&buff[6]);
					//PrintNumber(num2,10,3);
				//PrintNumber(num1,10,1);
				
				}

			
			
			
			//SendInt(f,10,6); // Transmit frequency value
			
		}
        ISR_pwm1 = num2*20; //Power percentage converted to PWM power value ---> This is the right motor
        ISR_pwm2 = num3*20; //
        mode = num1; //placeholder, should be mode field of JDY40 read
		printf("%d",mode);
        // update motor operation mode
        update_motors(mode);

        // If the controller requests a frequency read, send it
		//waitms(200);
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
28.6kHz - 40kHz range of frequency
*/