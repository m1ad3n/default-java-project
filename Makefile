OUT_DIR	= ./out
SRC_DIR	= ./src

JC		= javac
JFLAGS	= -d $(OUT_DIR) -cp $(SRC_DIR)

JVM		= java
MAIN	= com.example.Main

# Define the list of source files
SOURCES = $(shell find . -name "*.java")
OBJECTS = $(patsubst $(SRC_DIR)/%.java,$(OUT_DIR)/%.class,$(SOURCES))

# Define the default make target
all: $(OBJECTS)

$(OUT_DIR)/%.class: $(SRC_DIR)/%.java
	$(JC) $(JFLAGS) $<

run:
	@$(JVM) -cp $(OUT_DIR) $(MAIN)

# Define a target to clean up the output directory
.PHONY: clean
clean:
	rm -rf $(OUT_DIR)/*