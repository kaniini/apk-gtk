PKG_MODULES = gtk+-2.0 vte
PKG_CFLAGS = $(shell pkg-config ${PKG_MODULES} --cflags)
PKG_LIBS = $(shell pkg-config ${PKG_MODULES} --libs)
CFLAGS = -g -Wall -std=gnu99 ${PKG_CFLAGS}
SOURCES = main.c
OBJECTS = ${SOURCES:.c=.o}

prefix = /usr
bindir = ${prefix}/bin

%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@

apk-gtk: ${OBJECTS}
	${CC} -o $@ ${OBJECTS} ${PKG_LIBS}

clean:
	rm apk-gtk *.o

all: apk-gtk
install: apk-gtk
	install -Dm755 apk-gtk $(DESTDIR)$(bindir)/apk-gtk
