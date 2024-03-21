#define SARCLK 18000000L
#define VDD 3.3035 // The measured value of VDD in volts

void InitADC (void);
void InitPinADC (unsigned char portno, unsigned char pin_num);
unsigned int ADC_at_Pin(unsigned char pin);
float Volts_at_Pin(unsigned char pin);