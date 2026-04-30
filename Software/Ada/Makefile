all:
	rm src/gen -rf
	mkdir -p src/gen

	cd src/gen; g++  -c -fdump-ada-spec ${CURDIR}/../C/BrickPi3.cpp
	cd src/gen; rm aarch64_* asm_* cpp_* *.o brickpi3_cpp.ads  std* string*
	sed -f all.sed -i src/gen/brickpi3_h.ads
	gprbuild -c  brickpi3_h.ads

