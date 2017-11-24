# Digital Logic
# www.d-logic.net
#
# Helper Makefile
#
$(VERBOSE).SILENT:

all : help

help info : 
	echo "----------------------------------------------"
	echo "Making example to test Reader opening function"
	echo "----------------------------------------------"
	echo "For Linux x86 type:               'make lin32'"
	echo "For Linux x86_64 type:            'make lin64'"
	echo "For Linux ARM (Soft Point) type   'make armel'"
	echo "For Linux ARM (Hard Point) type:  'make armhf'"
	echo "For Linux ARM (aarch64) type:     'make aarch64'"
	echo "For Windows x86 type:             'make win32'"
	echo "For Windows x86_64 type:          'make win64'"
	echo "For macOS x86_64 type:            'make macos'"
	echo "----------------------------------------------"

armhf :
	gcc -o ufr-reader_open main.c -Llib/linux/arm-hf/ -luFCoder-armhf -Wl,-Rlib/linux/arm-hf/
	echo "Making done, without errors."
	echo "To run the example, type:"
	echo "   './ufr-reader_open'"

armel :
	gcc -o ufr-reader_open main.c -Llib/linux/arm/ -luFCoder-arm -Wl,-Rlib/linux/arm/
	echo "Making done, without errors."
	echo "To run the example, type:"
	echo "   './ufr-reader_open'"

aarch64 :
	gcc -o ufr-reader_open main.c -Llib/linux/aarch64/ -luFCoder-aarch64 -Wl,-Rlib/linux/aarch64/
	echo "Making done, without errors."
	echo "To run the example, type:"
	echo "   './ufr-reader_open'"

lin32 :
	gcc -m32 -o ufr-reader_open-x86 main.c -Llib/linux/x86/ -luFCoder-x86 -Wl,-Rlib/linux/x86/
	echo "Making done, without errors."
	echo "To run the example, type:"
	echo "   './ufr-reader_open-x86'"

lin64 :
	gcc -o ufr-reader_open-x86_64 main.c -Llib/linux/x86_64/ -luFCoder-x86_64 -Wl,-Rlib/linux/x86_64/
	echo "Making done, without errors."
	echo "To run the example, type:"
	echo "   './ufr-reader_open-x86_64'"

macos osx :
	gcc -o ufr-reader_open main.c -Llib/osx/x86_64/ -luFCoder -Xlinker -rpath lib/osx/x86_64/
	echo "Making done, without errors."
	echo "To run the example, type:"
	echo "   './ufr-reader_open'"

win32 :
	echo "If You see error like: 'skipping incompatible lib/windows/x86/uFCoder-x86.dll when searching for...'"
	echo "  This means You have the gcc compiler for 64 bit"
	echo "  type 'make win64' instead of 'make win32'"
	echo ""
	gcc -o ufr-reader_open-x86 main.c -Llib/windows/x86/ -luFCoder-x86 -Wl,-Rlib/windows/x86/ -Wl,--enable-stdcall-fixup
	echo "Making done, without errors."
	echo "You must use library from the 'lib\windows\x86\'"
	echo ""
	echo "To run the example (one way) type:"
	echo "   'cd lib\windows\x86'"
	echo "   '..\..\..\ufr-reader_open-x86'"
	echo "   'cd ..\..\..\'"

win64 :
	echo "If You see error like: 'lib/windows/x86_64/uFCoder-x86_64.dll: file not recognized: File format not recognized'"
	echo "  This means You have the gcc compiler for 32 bit"
	echo "  type 'make win32' instead of 'make win64'"
	echo ""
	gcc -o ufr-reader_open-x86_64 main.c -Llib/windows/x86_64/ -luFCoder-x86_64 -Wl,-Rlib/windows/x86_64/
	echo "Making done, without errors."
	echo "You must use library from the 'lib\windows\x86_64\'"
	echo ""
	echo "To run the example (one way) type:"
	echo "   'cd lib\windows\x86_64'"
	echo "   '..\..\..\ufr-reader_open-x86_64'"
	echo "   'cd ..\..\..\'"
