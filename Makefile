# st - simple terminal
# See LICENSE file for copyright and license details.
VERSION = 0.9
PREFIX = /usr/local

INCS  = -I/usr/X11R6/include
INCS += `pkg-config --cflags fontconfig`
INCS += `pkg-config --cflags freetype2`
INCS += `pkg-config --cflags harfbuzz`

LIBS  = -L/usr/X11R6/lib -lm -lrt -lX11 -lutil -lXft -lXrender
LIBS += `pkg-config --libs fontconfig`
LIBS += `pkg-config --libs freetype2`
LIBS += `pkg-config --libs harfbuzz`

CC = gcc

CFLAGS  = -std=c99
CFLAGS += -O3
CFLAGS += ${INCS}
CFLAGS += -D_XOPEN_SOURCE=600
CFLAGS += -DVERSION=\"${VERSION}\"

LDFLAGS  = ${LIBS}

.POSIX:

SRC = src/st.c src/x.c src/boxdraw.c src/hb.c
OBJ = ${SRC:.c=.o}

src/x.o: src/arg.h src/config.h src/st.h src/win.h src/hb.h
src/hb.o: src/st.h

all: st

src/.c.o:
	@echo $(CC)-c $(CFLAGS) $<

$(OBJ): src/config.h

st: $(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS)

clean:
	rm -f st $(OBJ)

install: st
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f st $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/st
	tic -sx src/st.info

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/st

.PHONY: all options clean install uninstall
