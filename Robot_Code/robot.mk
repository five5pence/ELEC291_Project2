SHELL=cmd
CC = xc32-gcc
OBJCPY = xc32-bin2hex
ARCH = -mprocessor=32MX130F064B
OBJ = main.o
PORTN=$(shell type COMPORT.inc)

main.elf: $(OBJ)
	$(CC) $(ARCH) -o main.elf main.o -mips16 -DXPRJ_default=default -legacy-libc -Wl,-Map=main.map
	$(OBJCPY) main.elf
	@echo Success!
   
main.o: main.c
	$(CC) -mips16 -g -x c -c $(ARCH) -MMD -o main.o main.c -DXPRJ_default=default -legacy-libc

clean:
	@del *.o *.elf *.hex *.d *.map 2>NUL
	
LoadFlash:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	pro32.exe -p main.hex
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

putty:
	@taskkill /f /im putty.exe /t /fi "status eq running" > NUL
	@cmd /c start putty -serial $(PORTN) -sercfg 115200,8,n,1,N

dummy: main.hex main.map
	$(CC) --version

explorer:
	@explorer .