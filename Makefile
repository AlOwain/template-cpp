# Uncomment the one you want to use.
# all: lib
# all: program

# Compile units

<replace-me> := build/<replace-me>.o

# Phonies

.PHONY: all clean lib program

lib: build build/lib-<replace-me>.a

program: build build/<replace-me>

build:
	mkdir -p build

clean:
	rm -rf build/

# Library archival

build/lib_<replace-me>.a: $(<replace-me>)
	ar rcs $@ $^

# Program entry point and linking

build/<replace-me>: build/<replace-me>.o $(<replace-me>)
	g++ $^ -o $@

build/<replace-me>.o: src/<replace-me>.cpp
	g++ -c $^ -o $@
