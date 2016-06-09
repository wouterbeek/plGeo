CFLAGS+= -I. -I"/home/wbeek/lib/swipl/include" -g
LD=g++
LDSOFLAGS=-shared
LIBPL=space.pl
LIBS=-lspatialindex -lgeos
OBJ=c/space.o c/globals.o c/Index.o c/Search.o c/Shapes.o c/lock.o c/debug.o
SOBJ=$(PACKSODIR)/space.$(SOEXT)

all:		$(SOBJ)

$(SOBJ):	$(OBJ)
		mkdir -p $(PACKSODIR)
		$(LD) $(ARCH) $(LDSOFLAGS) -o $@ $< $(LIBS) $(SWISOLIB)

c/debug.o:	c/debug.cc c/debug.h
		$(CC) $(ARCH) $(CFLAGS) -c -o $@ c/debug.cc

c/globals.o:	c/globals.cc c/globals.h
		$(CC) $(ARCH) $(CFLAGS) -c -o $@ c/globals.cc

c/Index.o:	c/Index.cc c/Index.h
		$(CC) $(ARCH) $(CFLAGS) -c -o $@ c/Index.cc

c/lock.o:	c/lock.cc c/lock.h
		$(CC) $(ARCH) $(CFLAGS) -c -o $@ c/lock.cc

c/Search.o:	c/Search.cc c/Search.h
		$(CC) $(ARCH) $(CFLAGS) -c -o $@ c/Search.cc

c/Shapes.o:	c/Shapes.cc c/Shapes.h
		$(CC) $(ARCH) $(CFLAGS) -c -o $@ c/Shapes.cc

c/space.o:	c/space.cc
		$(CC) $(ARCH) $(CFLAGS) -c -o $@ c/space.cc

check::
	swipl -q -f test_space.pl -g test_space,halt -t 'halt(1)'

install::

clean:
	rm -f $(OBJ)

distclean:	clean
		rm -f $(SOBJ)
