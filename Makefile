ERLANG_PATH ?= $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS ?= -O2 -Wall -Wextra -Wno-unused-parameter -I$(ERLANG_PATH)
ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC
	ifeq ($(shell uname),Darwin)
		CFLAGS += -I/opt/homebrew/include
		LDFLAGS += -L/opt/homebrew/lib
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	else
		LDFLAGS += -Wl,--no-as-needed
	endif
endif

LDFLAGS += -lgit2
src = $(wildcard c_src/*.c)
obj = $(src:.c=.o)

all: priv/geef_nif.so

priv/geef_nif.so: $(src)
	@mkdir -p priv
	$(CC) $(CFLAGS) -shared -w $(LDFLAGS) -o $@ $^

clean:
	$(RM) -r $(obj) priv/geef_nif.so

.PHONY: clean
