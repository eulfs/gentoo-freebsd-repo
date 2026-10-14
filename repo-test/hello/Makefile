# MUST HAVE INSTALL, CLEAN AND HELLO TARGETS.
# HOPEFULLY YOU CAN READ THIS, AS THIS IS WHAT ALL THE PKGS WILL LOOK LIKE.

PREFIX?= /usr/local
CFLAGS?= -O2 -pipe

.if !empty(USE:Mdebug)
CFLAGS+= -DDEBUG
.endif

all: hello

hello: main.c
	${CC} ${CFLAGS} main.c -o hello

install:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp hello ${DESTDIR}${PREFIX}/bin/hello

clean:
	rm -f hello
