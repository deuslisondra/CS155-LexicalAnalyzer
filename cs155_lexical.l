%{

%}

%%

[ \s\n\t\r]+            {}
("go to"|"exit"|"if"|"then"|"else"|"case"|"endcase"|"while"|"do"|"endwhile"|"repeat"|"until"|"loop"|"forever"|"for"|"to"|"by"|"endfor"|"input"|"output"|"array"|"node"|"call"|"return"|"stop"|"end"|"procedure") {printf("<%s, RES>\n", yytext);}
("true"|"false")        {printf("<%s, BOOL>\n", yytext);}
("and"|"or"|"not")      {printf("<%s, LOG_OP>\n", yytext);}
("mod"|"log")           {printf("<%s, MISC>\n", yytext);}

'([^'\\]|\\.)*'         {printf("<%s, STR_LIT>\n", yytext);}
[a-zA-Z][a-zA-Z0-9_]*   {printf("<%s, ID>\n", yytext);}
(0|[1-9][0-9]*)         {printf("<%s, INT>\n", yytext);}
[0-9]+.[0-9]+           {printf("<%s, FLOAT>\n", yytext);}

(,|:|;)                 {printf("<%s, DELIMIT>\n", yytext);}
("*"|"/"|"+"|"-")       {printf("<%s, AR_OP>\n", yytext);}
(<=|<|==|!=|>=|>)       {printf("<%s, REL_OP>\n", yytext);}


"="                     {printf("<%s, ASSIGN>\n", yytext);}
"["                     {printf("<%s, OPEN_BRACKET>\n", yytext);}
"("                     {printf("<%s, OPEN_PAREN>\n", yytext);}
")"                     {printf("<%s, CLOSE_PAREN>\n", yytext);}
"]"                     {printf("<%s, CLOSE_BRACKET>\n", yytext);}

.                       {printf("nope\n");}
<<EOF>>                 {return 0;}

%%

yywrap() {}

int main(int argc, char** argv) {
    FILE* file = fopen(argv[1], "r");
    char line[256];
    while (fgets(line, sizeof(line), file)) {
        yy_scan_string(line);
        yylex();
    }
    fclose(file);
    return 0;
}