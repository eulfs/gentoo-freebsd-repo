PREFIX?= /usr/local
CFLAGS?= -O2 -pipe

.if !empty(USE:Mdebug)
CFLAGS+= -DDEBUG
.endif

all: hello

hello: main.c
	# MUST BE A REAL TAB CHARACTER HERE:
	${CC} ${CFLAGS} main.c -o hello

install:
	# MUST BE A REAL TAB CHARACTER HERE:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp hello ${DESTDIR}${PREFIX}/bin/hello

clean:
	rm -f hello
