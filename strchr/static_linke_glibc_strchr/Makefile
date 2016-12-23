all: ver32 ver64
	

ver32:
	gcc -m32 main.c -static -o ver32
	objdump -d -Mintel ver32 >ver32.S 

ver64:
	gcc main.c -static -o ver64
	objdump -d -Mintel ver64 >ver64.S 

clean:
	rm ver*
