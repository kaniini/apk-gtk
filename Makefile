GTK_VERSION := 2

ifeq ($(GTK_VERSION),2)

   PKG_MODULES = gtk+-2.0 vte gdk-pixbuf-2.0

else

   PKG_MODULES = gtk+-3.0 vte-2.91 gdk-pixbuf-2.0

endif

PKG_CFLAGS = $(shell pkg-config ${PKG_MODULES} --cflags)
PKG_LIBS = $(shell pkg-config ${PKG_MODULES} --libs)
CFLAGS = -g -Wall -std=gnu99 ${PKG_CFLAGS} -DSHAREDIR=\"${prefix}/share/apk-gtk\"
SOURCES = main.c
OBJECTS = ${SOURCES:.c=.o}

prefix = /usr
sbindir = ${prefix}/sbin
sharedir = ${prefix}/share

%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@

apk-gtk: ${OBJECTS}
	${CC} -o $@ ${OBJECTS} ${PKG_LIBS}

clean:
	rm -f apk-gtk *.o

all: apk-gtk
install: apk-gtk
	install -Dm755 apk-gtk $(DESTDIR)$(sbindir)/apk-gtk
	install -Dm644 apk-gtk.svg $(DESTDIR)$(sharedir)/apk-gtk/apk-gtk.svg
	install -Dm644 apk-gtk.policy $(DESTDIR)$(sharedir)/polkit-1/actions/org.dereferenced.apk-gtk.policy
