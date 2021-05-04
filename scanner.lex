%{
#include "parser.tab.hpp"
#include "output.hpp"
using namespace output;
%}

%option yylineno
%option noyywrap
WS ([ \t\r\n])
relop (<|>|<=|>=)
eqop (==|!=)

%%

void {return VOID;}
int {return INT;}
byte {return BYTE;}
b {return B;}
bool {return BOOL;}
and {return AND;}
or {return OR;}
not {return NOT;}
true {return TRUE;}
false {return FALSE;}
return {return RETURN;}
if {return IF;}
else {return ELSE;}
while {return WHILE;}
break {return BREAK;}
continue {return CONTINUE;}
switch {return SWITCH;}
case {return CASE;}
default {return DEFAULT;}
: {return COLON;}
; {return SC;}
, {return COMMA;}
\( {return LPAREN;}
\) {return RPAREN;}
\{ {return LBRACE;}
\} {return RBRACE;}
= {return ASSIGN;}
{relop} {return RELOP;}
{eqop} {return EQOP;}
[\+|\-] {return ADDSUB;}
[\*|/] {return MULDIV;}
0|[1-9][0-9]* {return NUM;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
\"([^\n\r\"\\]|\\[rnt"\\])+\" {return STRING;}
(\/\/[^\r\n]*(\r|\n|\r\n)?) {/*ignore*/}
{WS} { /* ignore */ }
. {errorLex(yylineno); exit(0);}

%%