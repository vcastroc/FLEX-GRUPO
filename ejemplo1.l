%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%%
[ \t]+   ; // Ignorar espacios en blanco y tabulaciones

[0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)? {
    printf("NUMERO: %s\n", yytext);
}

[[:alnum:]][[:alnum:]_]* {
    
    if (strcasecmp(yytext, "SELECT") == 0) {
        printf("PC: %s\n", yytext);
    } else if (strcasecmp(yytext, "FROM") == 0) {
        printf("PC: %s\n", yytext);
    } else if (strcasecmp(yytext, "WHERE") == 0) {
        printf("PC: %s\n", yytext);
    } else {
        printf("ID: %s\n", yytext);
    }
}

"<"   { printf("OPREL: %s\n", yytext); }
">"   { printf("OPREL: %s\n", yytext); }
"<="  { printf("OPREL: %s\n", yytext); }
">="  { printf("OPREL: %s\n", yytext); }
"="   { printf("OPREL: %s\n", yytext); }
","   { printf("SIGNO: %s\n", yytext); }

.     { printf("Caracter no reconocido: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
