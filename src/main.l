
%{
#include <stdio.h>
%}

LETRA [a-zA-Z]
DIGITO [0-9]
LetEdig [a-zA-Z0-9]
ESPECIAL [._-]
VALIDO [a-zA-Z0-9._-]

%%

{ESPECIAL}{VALIDO}+[@]{VALIDO}+ /*identificação de caso inválido: começa com -, . ou _*/

{VALIDO}+[@]{VALIDO}+[.] {int i;
			  while(yytext[i]!='\0')
	   		  	i++;
			  i=i-1;
			  yytext[i]='\0';
			  printf("%s\n", yytext); 
			 } /*identificação de email em fim de frase

{VALIDO}+[@]{VALIDO}+{ESPECIAL} /*identificação de caso inválido: termina com -, . ou _*/

{VALIDO}+{ESPECIAL}[@]{VALIDO}+ /*identificação de caso inválido: nome termina com -, . ou _*/

{VALIDO}+[@]{ESPECIAL}{VALIDO}+ /*identificação de caso inválido: endereço começa com -, . ou _*/


{VALIDO}+[@]{VALIDO}+ { printf("%s\n", yytext); }  /*identificação de casos válidos*/


[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;

%%

int main() {
  yylex();
  return 0;
}
