%{
#include "parser.tab.hpp"
#include "output.hpp"
using namespace output;
%}

%option yylineno
%option noyywrap
WS ([ \t\r\n])
STRING ()

%%

void {yylval = new Void(yytext) return VOID;}
int {yylval = new Int(yytext) return INT;}
byte {yylval = new Byte(yytext) return BYTE;}
b {yylval = new B(yytext)return B;}
bool {yylval = new Bool(yytext) return BOOL;}
and {yylval = new And(yytext) return AND;}
or {yylval = new Or(yytext) return OR;}
not {yylval = new Not(yytext) return NOT;}
true {yylval = new True(yytext) return TRUE;}
false {yylval = new False(yytext) return FALSE;}
return {yylval = new Return(yytext) return RETURN;}
if {yylval = new If(yytext) return IF;}
else {yylval = new Else(yytext) return ELSE;}
while {yylval = new While(yytext) return WHILE;}
break {yylval = new Break(yytext) return BREAK;}
continue {yylval = new Continue(yytext) return CONTINUE;}
switch {yylval = new Switch(yytext) return SWITCH;}
case {yylval = new Case(yytext) return CASE;}
default {yylval = new Default(yytext) return DEFAULT;}
: {yylval = new Colon(yytext) return COLON;}
; {yylval = new Sc(yytext) return SC;}
, {yylval = new Comma(yytext) return COMMA;}
\( {yylval = new Lparen(yytext) return LPAREN;}
\) {yylval = new Rparen(yytext) return RPAREN;}
\{ {yylval = new Lbrace(yytext) return LBRACE;}
\} {yylval = new Rbrace(yytext) return RBRACE;}
= {yylval = new Assign(yytext) return ASSIGN;}
[(==)|(!=)|(<)|(>)|(<=)|(>=)] {yylval = new Relop(yytext) return RELOP;}
[\+|\-|\*|/] {yylval = new Binop(yytext) return BINOP;}
0|[1-9][0-9]* {yylval = new Num(yytext) return NUM;}
[a-zA-Z][a-zA-Z0-9]* {yylval = new Id(yytext) return ID;}
\"([^\n\r\"\\]|\\[rnt"\\])+\" {yylval = new String(yytext) return STRING;}
{WS} { /* ignore */ }
. {errorLex(yylineno);}

%%