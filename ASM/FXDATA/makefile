#include ../../mk3.mif


all: $(EXE)fxdata/animal.bin \
	 $(EXE)fxdata/baby.bin \
	 $(EXE)fxdata/fatal.bin \
	 $(EXE)fxdata/friend.bin \
	 .SYMBOLIC


# MAIN GAME	PLAY

fatal.obj: fatal.asm $(OVLARTI) \
	..\common\finish\fatal.psx \
	..\common\finish\fatal.psi

baby.obj: baby.asm $(OVLARTI) \
	..\common\finish\babyl.psx \
	..\common\finish\babyl.psi

friend.obj: friend.asm $(OVLARTI) \
	..\common\finish\friend.psx \
	..\common\finish\friend.psi

animal.obj: animal.asm $(OVLARTI) \
	..\common\finish\animal.psx \
	..\common\finish\animal.psi



