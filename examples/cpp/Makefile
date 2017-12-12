CC := clang++
SRC_DIR := src
OBJ_DIR := obj
DIST_DIR := dist
SRC_FILES := $(wildcard $(SRC_DIR)/*.cc)
OBJ_FILES := $(addprefix $(OBJ_DIR)/,$(notdir $(SRC_FILES:.cc=.o)))
DIST_FILE := $(DIST_DIR)/server
CFLAGS := -g -c -std=c++11
LFLAGS :=

all: $(DIST_FILE)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cc
	${CC} ${CFLAGS} -c -o $@ $<

$(DIST_FILE): $(OBJ_FILES)
	${CC} ${LFLAGS} -o $@ $^

$(OBJ_FILES): | $(OBJ_DIR)

$(DIST_FILE): | $(DIST_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

run:
	./$(DIST_FILE)

clean:
	rm -rf $(OBJ_DIR)
	rm -rf $(DIST_DIR)
