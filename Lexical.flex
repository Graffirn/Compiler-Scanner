%%

%class Scanner
%standalone
%unicode
%line
%column

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

WhiteSpace = {LineTerminator} | [ \t\f]

Comments = {TraditionalComment} | {EndOfLineComment}

TraditionalComment = "/*" ~ "*/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
Letter = [A-Za-z_]
Digit = [0-9]
Identifiers = {Letter}({Letter}|{Digit})*
Keywords = boolean|break|continue|else|for|float|if|int|return|void|while

ArithmeticOperators = \+|\-|\*|\/
RelationalOperators = \<|\<=|\>|\>=
EqualityOperators = "=="|"!="
LogicalOperators = \|\||\&\&|\!
AssignmentOperator = "="
Separators = \{|\}|\(|\)|\[|\]|\;|\,

Integers = {Digit}({Digit})*

Fraction = \.{Digit}+
Exponent = (E|e)(\+|\-)?{Digit}+
Floats = {Digit}* {Fraction} {Exponent}? | {Digit}+\. | {Digit}+ \.? {Exponent}

Booleans = "true"|"false"

EscapeSequences = \b|\f|\n|\r|\t|\'|\"|\\
Strings = \"([^\r\n\"\\]*)\"

%{
  public void printToken(String tokenType, String spelling, int row, int col){
    System.out.println("Type: " + tokenType);
    System.out.println("Spelling: " + spelling.trim());
    System.out.println("Row: " + row);
    System.out.println("Col: " + col);
    System.out.println();
  }
%}

%%
{Keywords} {
  printToken("Keyword", yytext(), yyline, yycolumn);
}
{ArithmeticOperators} {
  printToken("Arithmetic Operator", yytext(), yyline, yycolumn);
}
{RelationalOperators} {
  printToken("Relational Operator", yytext(), yyline, yycolumn);
}
{EqualityOperators} {
  printToken("Equality Operator", yytext(), yyline, yycolumn);
}
{LogicalOperators} {
  printToken("Logical Operator", yytext(), yyline, yycolumn);
}
{AssignmentOperator} {
  printToken("Assignment Operator", yytext(), yyline, yycolumn);
}
{Separators} {
  printToken("Separator", yytext(), yyline, yycolumn);
}
{Integers} {
  printToken("Integer", yytext(), yyline, yycolumn);
}
{Floats} {
  printToken("Float", yytext(), yyline, yycolumn);
}
{Booleans} {
  printToken("Boolean", yytext(), yyline, yycolumn);
}
{Strings} {
  printToken("String", yytext(), yyline, yycolumn);
}
{Identifiers} {
  printToken("Identifier", yytext(), yyline, yycolumn);
}
{Comments} {
  printToken("Comment", yytext(), yyline, yycolumn);
}
{WhiteSpace} {
  /* ignore */
}
{EscapeSequences} {
  /* ignore */
}