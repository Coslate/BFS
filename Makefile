#declare variable
CC = g++
INCLUDE_FILES = ./include
INCLUDE_FLAGS = $(foreach d, $(INCLUDE_FILES), -I $d)
CTAGS_UTIL = /usr/local/bin/
CTAGS_FILES = ./include
CTAGS_FLAGS = $(foreach d, $(CTAGS_FILES),-a $d/*)
CFLAGS = -g -Wall -O3 -std=c++11 
COMPILE_FLAGS = -c
MAIN_OBJECT_NAME_MAIN = BFS_main
MAIN_OBJECT_SOURCE_MAIN = $(MAIN_OBJECT_NAME_MAIN).cpp
MAIN_OBJECT_EXEC_MAIN = $(MAIN_OBJECT_NAME_MAIN).o
MAIN_OBJECT_NAME = BFS
MAIN_OBJECT_SOURCE = $(MAIN_OBJECT_NAME).cpp
MAIN_OBJECT_EXEC = $(MAIN_OBJECT_NAME).o
MAIN_OBJECT_EXEC_OUTPUT = ../exec_output/

all : clean BFS all_file_tags
	$(CC) $(CFLAGS) $(INCLUDE_FLAGS) $(MAIN_OBJECT_EXEC_OUTPUT)$(MAIN_OBJECT_EXEC) $(MAIN_OBJECT_SOURCE_MAIN) -o $(MAIN_OBJECT_EXEC_OUTPUT)$(MAIN_OBJECT_EXEC_MAIN)
	${MAIN_OBJECT_EXEC_OUTPUT}$(MAIN_OBJECT_EXEC_MAIN)

BFS : $(MAIN_OBJECT_SOURCE)
	$(CC) $(CFLAGS) $(INCLUDE_FLAGS) $(COMPILE_FLAGS) $(MAIN_OBJECT_SOURCE) -o $(MAIN_OBJECT_EXEC_OUTPUT)$(MAIN_OBJECT_EXEC)

all_file_tags : 
	$(CTAGS_UTIL)ctags -R ./*
	$(CTAGS_UTIL)ctags $(CTAGS_FLAGS)

clean :
	rm -rf $(MAIN_OBJECT_EXEC_OUTPUT)$(MAIN_OBJECT_EXEC)
	rm -rf $(MAIN_OBJECT_EXEC_OUTPUT)$(MAIN_OBJECT_EXEC_MAIN)
	rm -rf ./tags
