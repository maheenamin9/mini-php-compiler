# Mini_PHP_Compiler

 The following project construct the compiler for “Mini PHP” language similar to the PHP but with fewer constructs.

- [lexicalpart.l](lexicalpart.l) contains the code for Lexical Phase. 
- [syntaxpart.y](syntaxpart.y) contains the code for Syntax Phase.
- [source.txt](source.txt) contains the input passed to the Program for validation purposes.
- [token.txt](token.txt) contains the tokens in <TokenType, Lemexe> format.

Following Commands are used to run above files:
```
flex lexicalpart.l               # This command will generate 'lex.yy.c' file.
bison -d syntaxpart.y            # This command will produce 'syntaxpart.tab.c' and 'syntaxpart.tab.h' file.
gcc lex.yy.c syntaxpart.tab.c    # This command will produce 'a' executable file. 
a                                # This command will print the tokens in 'token.txt' file as <TokenType, Lemexe> format.
```

Important Note:

> This Project only completes the follwings:
> - Implementation of Lexical Analysis Phase.
> - Implementation of Syntax Analysis Phase

> This Project does not completes the follwings:
> - Implementation of Symbol table manager(Register variables)
> - Applying Semantic actions to evaluate expressions.
> - Error report
