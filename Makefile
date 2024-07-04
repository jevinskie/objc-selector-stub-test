TARGETS := objc-sel-stub-test objc-sel-stub-test.asm objc-sel-no-stub-test objc-sel-no-stub-test.asm

C_CXX_FLAGS := -Wall -Wextra -Wpedantic -Wno-gnu-line-marker -Os -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions -g0 -fomit-frame-pointer -fno-stack-check -mno-outline -fno-stack-protector -fverbose-asm -v -Wl,-v
C_FLAGS := $(C_CXX_FLAGS) -std=gnu2x
OBJC_FLAGS := $(C_FLAGS) -fobjc-arc

all: $(TARGETS)

.PHONY: clean

clean:
	rm -rf *.dSYM/
	rm -f $(TARGETS)

objc-sel-stub-test: objc-sel-stub-test.m
	$(CC) -o $@ $< $(OBJC_FLAGS) -framework Foundation -save-temps

objc-sel-stub-test.asm: objc-sel-stub-test.m
	$(CC) -S -o $@ $< $(OBJC_FLAGS) -framework Foundation

objc-sel-no-stub-test: objc-sel-no-stub-test.m
	$(CC) -o $@ $< $(OBJC_FLAGS) -framework Foundation -save-temps -fno-objc-msgsend-selector-stubs

objc-sel-no-stub-test.asm: objc-sel-no-stub-test.m
	$(CC) -S -o $@ $< $(OBJC_FLAGS) -framework Foundation -fno-objc-msgsend-selector-stubs
