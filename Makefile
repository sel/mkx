SOURCE_DIR = src
DEST_DIRS = out1 out2
SOURCE_FILES = $(wildcard $(SOURCE_DIR)/*.x)
DEST_FILES = $(foreach dest,$(DEST_DIRS), \
  $(patsubst $(SOURCE_DIR)/%,$(dest)/%,$(SOURCE_FILES)))

.SUFFIXES:

.PHONY: all
all: $(DEST_FILES)

.PHONY: clean
clean:
	$(RM) -r $(DEST_DIRS)

$(DEST_DIRS): % :
	mkdir $@

PERCENT := %

.SECONDEXPANSION:
$(DEST_FILES): %: $$(dir $$*) $$(filter $$(PERCENT)/$$(notdir $$*), $(SOURCE_FILES))
	cp -f $(lastword $^) $@
