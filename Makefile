TARGET = urler
OBJS = urler.o
LDLIBS = -lcurl
CFLAGS := $(CFLAGS) -W -Wall -pedantic -g
MANUAL = urler.1

BINDIR ?= $(DESTDIR)$(prefix)/bin
MANDIR ?= $(DESTDIR)$(prefix)/share/man/man1

$(TARGET): $(OBJS)

install:
	install -d $(BINDIR)
	install -m 0755 $(TARGET) $(BINDIR)
	install -m 0744 $(MANUAL) $(MANDIR)

clean:
	rm -f $(OBJS) $(TARGET)

test:
	@perl test.pl
