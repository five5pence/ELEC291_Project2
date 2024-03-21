SHELL=cmd
CC=c51
COMPORT = $(shell type COMPORT.inc)
# Add .obj files for any new things we want to add as libraries
OBJS=main.obj startup.obj timing.obj lcd.obj adc.obj

main.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
# global.h contains global variables

# main code, add header files as needed 	
main.obj: main.c lcd.h adc.h timing.h
	$(CC) -c main.c

# startup initialization routine, sets up crossbar, pinmodes, UART with timer 1
startup.obj: startup.c global.h
	$(CC) -c startup.c

# delays and waits, uses timer 3
timing.obj: timing.c timing.h global.h
	$(CC) -c timing.c

# LCD interface functions, lcd.h contains LCD pinouts
lcd.obj: lcd.c lcd.h timing.h global.h
	$(CC) -c lcd.c

# ADC interface functions
adc.obj: adc.c adc.h timing.h global.h
	$(CC) -c adc.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	EFM8_prog.exe -ft230 -r main.hex
	cmd /c start putty -serial $(COMPORT) -sercfg 115200,8,n,1,N

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	cmd /c start putty -serial $(COMPORT) -sercfg 115200,8,n,1,N

Dummy: main.hex main.Map
	
explorer:
	explorer .