all: debug

# Compile units

<replace-me> := build/<replace-me>.o

# Phonies

.PHONY: all clean lib debug

lib: build build/lib-<replace-me>.a

debug: build build/debug

build:
	mkdir -p build

clean:
	rm -rf build/

# Linking

build/lib_<replace-me>.a: $(<replace-me>)
	ar rcs $@ $^

# Main / Entry point

build/main: build/main.o $(<replace-me>)
	g++ $^ -o $@

build/main.o: src/main.cpp
	g++ -c $^ -o $@
