#-----------------------------------------------------------------------
APP         := XGame
GAMEID      := 22013900

TARGET_NAME := lib$(GAMEID)
TARGET      := $(TARGET_NAME).so 

TARSFILE_DIR  := /home/tarsproto/$(APP)/$(TARGET)/
CONFIG        := source/config/lib22013900.cfg
STRIP_FLAG    := N
LFLAGS        := #-Xlinker --unresolved-symbols=ignore-in-shared-libs

CFLAGS     := -std=c++11 -fPIC -D__GAMEID__=$(GAMEID)
CXXFLAGS   := -std=c++11 -fPIC -D__GAMEID__=$(GAMEID)

INCLUDE   += -I/home/tarsproto/$(APP)
LIB       += -L/home/tarsproto/$(APP)

INCLUDE   += -I./submod -I./submod/xtime/source -I./source -I./source/common
LIB       +=

INCLUDE   += -I/usr/local/cpp_modules/wbl/include
LIB       += -L/usr/local/cpp_modules/wbl/lib -lwbl

INCLUDE   += -I/usr/local/cpp_modules/protobuf/include
LIB       += -L/usr/local/cpp_modules/protobuf/lib -lprotobuf

INCLUDE   += -I/home/tarsproto/XGame/protocols/ 
LIB       += -L/home/tarsproto/XGame/protocols/ -lprotocols

INCLUDE   += -I/usr/local/tars/cpp/include/
LIB       += -L/usr/local/tars/cpp/lib -ltarsutil -ltarsservant -ltarsparse

#-----------------------------------------------------------------------
FILTER_OUT_DIRS := .git .svn  build client
#-----------------------------------------------------------------------

include /home/tarsproto/XGame/protocols/protocols.mk
include submod/makefile_base/base.mk

100:
	sshpass -p 'awzs2022' scp ./build/lib22013900.so root@10.10.10.100:/data/app/so
