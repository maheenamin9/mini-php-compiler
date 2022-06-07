%{
    #include<stdio.h>
    #include"syntaxpart.tab.h"
%}
%option yylineno
letter[A-Za-z]
digit [0-9]
del [ \t\n]

%%

"<?php"                           {return(PhpStart);}
"?>"                              {return(PhpEnd);}
[Ii][Ff]                          {fprintf(yyout, "<Keyword, %s>\n", yytext);  return(IF);}
[Ee][Ll][Ss][Ee]                  {fprintf(yyout, "<Keyword, %s>\n", yytext);  return(ELSE);}
[Ee][Cc][Hh][Oo]                  {fprintf(yyout, "<Keyword, %s>\n", yytext);  return(ECHO_T);} 
"function"                        {fprintf(yyout, "<Keyword, %s>\n", yytext);  return(FUNC);}
[Ww][Hh][Ii][Ll][Ee]              {fprintf(yyout, "<Keyword, %s>\n", yytext);  return(WHILE);}
{letter}*                         {fprintf(yyout, "<Keyword, %s>\n", yytext);}
"$"_?{letter}({letter}|{digit})*  {fprintf(yyout, "<Identifier, %s>\n", yytext);  return(ID);}
{digit}+                          {fprintf(yyout, "<Integer, %s>\n", yytext);  return(INT);}
{digit}+"."{digit}*               {fprintf(yyout, "<Float, %s>\n", yytext);  return(FLOAT);}
'[^\']'                           {fprintf(yyout, "<Character, %s>\n", yytext);}
\"[^\"]*\"                        {fprintf(yyout, "<String, %s>\n", yytext);  return(STRING);}
"["|"{"|"("|")"|"}"|"]"|";"       {fprintf(yyout, "<PUN, %s>\n", yytext);  return yytext[0];}
("//"|"#").*                      {fprintf(yyout, "<SLC, %s>\n", yytext);}
"/*"(.|\n)*"*/"                        {fprintf(yyout, "<MLC, %s>", yytext);}
"<"|">"|"="|"*"|"+"|"/"|"-"|"%"|"."  {fprintf(yyout, "<Operator, %s>\n", yytext);  return yytext[0];}
"<="                              {fprintf(yyout, "<Operator, %s>\n", yytext);  return(LE);}
">="                              {fprintf(yyout, "<Operator, %s>\n", yytext);  return(GE);}
"=="                              {fprintf(yyout, "<Operator, %s>\n", yytext);  return(ET);}
"!="                              {fprintf(yyout, "<Operator, %s>\n", yytext);  return(NE);}
"**"                              {fprintf(yyout, "<Operator, %s>\n", yytext);  return(POW);}
{del}*                                                

%%
int yywrap(void){}
int main(){

    /*FILE *inputptr,*tokenptr,*identifierptr;
    inputptr = fopen("source.txt", "a");
    tokenptr = fopen("source.txt", "w");
    identifierptr = fopen("source.txt", "w");*/

    /* yyin points to the file input.txt 
    and opens it in read mode*/
    yyin = fopen("source.txt", "r");

    /* yyout points to the file output.txt 
    and opens it in write mode
    tptr = fopen("token.txt", "w");*/
    yyout = fopen("token.txt", "a");
    yyparse();
    
    return 0;
}