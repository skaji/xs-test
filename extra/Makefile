object: add.o subst.o

libcalc.a: object
	ar rsv libcalc.a add.o subst.o

add.o:
	gcc -c -o add.o add.c

subst.o:
	gcc -c -o subst.o subst.c

clean:
	rm -f *.o libcalc.a
