/*
 ============================================================================
 Name        : main.c
 Author      : Digital Logic
 Version     : 1.0
 Copyright   : 
 Description : Very simple test of uFR library
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

#include "lib/include/uFCoder.h"

int main(void)
{
	UFR_STATUS status;

	printf("\n* uFCoder library version: %s\n\n", GetDllVersionStr());
	//--------------------------------------------------------------

	puts("Test opening Digital Logic shield uFR RS232 on RPi: 1.0\n");

	status = ReaderOpenEx(2, "/dev/serial0", 10, 0);
	printf("ReaderOpenEx(2, '/dev/serial0', 10, 0):> %s\n",
			UFR_Status2String(status));

	status = ReaderUISignal(3, 3);
	printf("ReaderUISignal(3, 3):> %s\n", UFR_Status2String(status));

	puts(GetReaderDescription());

	status = ReaderClose();
	printf("ReaderClose():> %s\n", UFR_Status2String(status));

	puts(".");

	return EXIT_SUCCESS;
}
