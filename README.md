# CS155-LexicalAnalyzer

This is a submission for Problem Set 2 (Lexical Analyzer using Flex) in CS 155.

To use the lexical analyzer, enter the following in the command prompt (the file must be in the current directory):
flex cs155_lexical.l
gcc lex.yy.c -o output
output [file with EASY language]

alternatively
./output [file with EASY language]

note that the lexical analyzer does NOT tokenize comments
note as well that the lexical analyzer IGNORES whitespaces

the lexical analyzer should include the following TOKEN classifications:
RES - reserved words
BOOL - reserved words for boolean (true/false)
LOG_OP - logical operators
MISC - miscellaneous mathematical notations
STR_LIT - string literals
ID - identifer
INT - integers (positive or 0)
FLOAT - float
DELIMIT - delimiters
AR_OP - arithmetic operators
REL_OP - relational operators
ASSIGN - assignment
OPEN_BRACK - open bracket
OPEN_PAREN - open parenthesis
CLOSE_PAREN - close parenthesis
CLOSE_BRACKET - close bracket
