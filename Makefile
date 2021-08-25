go: ./a.out
	./a.out example.h

./a.out: lex.yy.c
	gcc lex.yy.c -ll

lex.yy.c: Lexer.l
	lex Lexer.l


y.tab.h y.tab.c: yac.y
	yacc -d Parser.y
