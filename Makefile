
all : armhf

armhf :
	gcc -o ufr-examples-reader_open -Llib/linux/arm-hf/ -luFCoder-armhf -Wl,-Rlib/linux/arm-hf/ main.c
