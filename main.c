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

/**
 * Calls ReaderOpenEx() and print status
 */
UFR_STATUS reader_open_ex(uint32_t reader_type, c_string port_name, uint32_t port_interface)
{
	UFR_STATUS status;

	status = ReaderOpenEx(reader_type, port_name, port_interface, 0);
	printf("ReaderOpenEx(%d, '%s', %d, 0):> %s\n", reader_type, port_name,
			port_interface, UFR_Status2String(status));

	return status;
}

int main(void)
{
	UFR_STATUS status;

	puts("Test ReaderOpen version 1.0\n");
	//--------------------------------------------------------------
	printf("* uFCoder library version: %s\n\n", GetDllVersionStr());
	//--------------------------------------------------------------

	puts("Test opening Digital Logic shield uFR RS232 on RPi:");
	status = reader_open_ex(2, "/dev/serial0", 10);

	status = ReaderUISignal(3, 3);
	printf("ReaderUISignal(3, 3):> %s\n", UFR_Status2String(status));

	puts(GetReaderDescription());

	status = ReaderClose();
	printf("ReaderClose():> %s\n", UFR_Status2String(status));

	puts(".");

	return EXIT_SUCCESS;
}
