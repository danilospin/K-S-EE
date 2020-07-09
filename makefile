# Model compilation options
TARGET=lsd
FUN=fun_KS
FUN_EXTRA=fun_KS_class.h fun_KS_country.h fun_KS_financial.h fun_KS_capital.h fun_KS_consumption.h fun_KS_labor.h fun_KS_firm1.h fun_KS_firm2.h fun_KS_stats.h fun_KS_support.h fun_KS_test.h fun_KS_vintage.h
SWITCH_CC=-Wall -Wno-unused-variable -Wno-unused-but-set-variable -O3
SWITCH_CC_LNK=

# System compilation options
LSDROOT=C:/LSD/LSD-7.2-stable-2
SRC=src
EXT=.exe

# Libraries options
TCL_VERSION=85
PATH_TCL_HEADER=$(LSDROOT)/gnu/include
PATH_TK_HEADER=$(LSDROOT)/gnu/include
PATH_HEADER=$(LSDROOT)/gnu/include
PATH_TCL_LIB=$(LSDROOT)/gnu/lib
PATH_TK_LIB=$(LSDROOT)/gnu/lib
PATH_LIB=$(LSDROOT)/gnu/lib
TCL_LIB=-ltcl$(TCL_VERSION)
TK_LIB=-ltk$(TCL_VERSION)
LIBS=-lz

# Compiler options
CC=g++
GLOBAL_CC=-march=pentium-mmx -mtune=prescott -w
SSWITCH_CC=-mthreads -mwindows -O3
LSDROOT=C:/LSD/LSD-7.2-stable-2

# Body of makefile (from src/makefile_base.txt)
# specify where are the sources of LSD
SRC_DIR=$(LSDROOT)/$(SRC)/

# location of tcl/tk and other headers
INCLUDE=-I$(PATH_TCL_HEADER) -I$(PATH_TK_HEADER) -I$(PATH_HEADER) -I$(LSDROOT)/$(SRC)

# link executable
$(TARGET)$(EXT): $(FUN).o $(SRC_DIR)main.o $(SRC_DIR)lsdmain.o \
$(SRC_DIR)analysis.o $(SRC_DIR)debug.o $(SRC_DIR)draw.o $(SRC_DIR)edit.o \
$(SRC_DIR)edit_dat.o $(SRC_DIR)file.o $(SRC_DIR)interf.o $(SRC_DIR)nets.o \
$(SRC_DIR)object.o $(SRC_DIR)report.o $(SRC_DIR)runtime.o $(SRC_DIR)set_all.o \
$(SRC_DIR)show_eq.o $(SRC_DIR)util.o $(SRC_DIR)variab.o
	$(CC) $(GLOBAL_CC) $(SWITCH_CC) $(FUN).o $(SRC_DIR)main.o $(SRC_DIR)lsdmain.o \
	$(SRC_DIR)analysis.o $(SRC_DIR)debug.o $(SRC_DIR)draw.o $(SRC_DIR)edit.o \
	$(SRC_DIR)edit_dat.o $(SRC_DIR)file.o $(SRC_DIR)interf.o $(SRC_DIR)nets.o \
	$(SRC_DIR)object.o $(SRC_DIR)report.o $(SRC_DIR)runtime.o $(SRC_DIR)set_all.o \
	$(SRC_DIR)show_eq.o $(SRC_DIR)util.o $(SRC_DIR)variab.o \
	$(SWITCH_CC_LNK) -L$(PATH_TCL_LIB) $(TCL_LIB) -L$(PATH_TK_LIB) $(TK_LIB) \
	-L$(PATH_LIB) $(LIBS) -o $(TARGET)

# compile modules
$(FUN).o: $(FUN).cpp $(FUN_EXTRA) model_options.txt \
$(SRC_DIR)check.h $(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch \
$(SRC_DIR)fun_head.h $(SRC_DIR)fun_head_fast.h
	$(CC) $(GLOBAL_CC) $(SWITCH_CC) $(INCLUDE) \
	-c $(FUN).cpp -o $(FUN).o
	
$(SRC_DIR)main.o: $(SRC_DIR)main.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)main.cpp -o $(SRC_DIR)main.o

$(SRC_DIR)lsdmain.o: $(SRC_DIR)lsdmain.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)lsdmain.cpp -o $(SRC_DIR)lsdmain.o

$(SRC_DIR)analysis.o: $(SRC_DIR)analysis.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)analysis.cpp -o $(SRC_DIR)analysis.o

$(SRC_DIR)debug.o: $(SRC_DIR)debug.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)debug.cpp -o $(SRC_DIR)debug.o

$(SRC_DIR)draw.o: $(SRC_DIR)draw.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)draw.cpp -o $(SRC_DIR)draw.o

$(SRC_DIR)edit.o: $(SRC_DIR)edit.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)edit.cpp -o $(SRC_DIR)edit.o

$(SRC_DIR)edit_dat.o: $(SRC_DIR)edit_dat.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)edit_dat.cpp -o $(SRC_DIR)edit_dat.o

$(SRC_DIR)file.o: $(SRC_DIR)file.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)file.cpp -o $(SRC_DIR)file.o

$(SRC_DIR)interf.o: $(SRC_DIR)interf.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)interf.cpp -o $(SRC_DIR)interf.o

$(SRC_DIR)nets.o: $(SRC_DIR)nets.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)nets.cpp -o $(SRC_DIR)nets.o

$(SRC_DIR)object.o: $(SRC_DIR)object.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)object.cpp -o $(SRC_DIR)object.o

$(SRC_DIR)report.o: $(SRC_DIR)report.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)report.cpp -o $(SRC_DIR)report.o

$(SRC_DIR)runtime.o: $(SRC_DIR)runtime.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)runtime.cpp -o $(SRC_DIR)runtime.o

$(SRC_DIR)set_all.o: $(SRC_DIR)set_all.cpp $(SRC_DIR)nolh.h \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)set_all.cpp -o $(SRC_DIR)set_all.o

$(SRC_DIR)show_eq.o: $(SRC_DIR)show_eq.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)show_eq.cpp -o $(SRC_DIR)show_eq.o

$(SRC_DIR)util.o: $(SRC_DIR)util.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)util.cpp -o $(SRC_DIR)util.o

$(SRC_DIR)variab.o: $(SRC_DIR)variab.cpp \
$(SRC_DIR)choose.h $(SRC_DIR)decl.h.gch $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)variab.cpp -o $(SRC_DIR)variab.o

# pre-compile headers
$(SRC_DIR)decl.h.gch: $(SRC_DIR)decl.h \
$(SRC_DIR)choose.h $(SRC_DIR)system_options.txt
	$(CC) $(GLOBAL_CC) $(SSWITCH_CC) $(INCLUDE) \
	-c $(SRC_DIR)decl.h -o $(SRC_DIR)decl.h.gch

clean:
	rm $(SRC_DIR)*.o $(SRC_DIR)*.gch $(FUN).o $(TARGET)*