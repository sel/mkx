SOURCE_DIR = src
DEST_DIRS = out1 out2
SOURCE_FILES = $(wildcard $(SOURCE_DIR)/*.x)
DEST_FILES = $(foreach dest,$(DEST_DIRS), \
  $(patsubst $(SOURCE_DIR)/%,$(dest)/%,$(SOURCE_FILES)))

.SUFFIXES:

.PHONY: all
all: $(DEST_FILES)
	@echo SOURCE_DIR=$(SOURCE_DIR)
	@echo SOURCE_FILES=$(SOURCE_FILES)
	@echo DEST_DIRS=$(DEST_DIRS)
	@echo DEST_FILES=$(DEST_FILES)

.PHONY: clean
clean:
	$(RM) -r $(DEST_DIRS)

$(DEST_DIRS): % :
	mkdir $@

out1/%.x: out1 $(SOURCE_DIR)/%.x
	cp -f $(lastword $^) $@

out2/%.x: out2 $(SOURCE_DIR)/%.x
	cp -f $(lastword $^) $@
