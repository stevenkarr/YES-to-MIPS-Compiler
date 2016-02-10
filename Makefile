###
# This Makefile can be used to make a parser for the CFlat language
# (parser.class) and to make a program (P6.class) that tests the parser and
# the unparse methods in ast.java.
#
# make clean removes all generated files.
#
###

JC = javac
CP = /u/c/s/cs536-1/public/tools/deps:.

P6.class: P6.java parser.class Yylex.class ASTnode.class
	$(JC) -g -cp $(CP) P6.java

parser.class: parser.java ASTnode.class Yylex.class ErrMsg.class
	$(JC) -cp $(CP) parser.java

parser.java: CFlat.cup
	java -cp $(CP) java_cup.Main < CFlat.cup

Yylex.class: CFlat.jlex.java sym.class ErrMsg.class
	$(JC) -cp $(CP) CFlat.jlex.java

ASTnode.class: ast.java Type.java Codegen.java
	$(JC) -g -cp $(CP) ast.java

CFlat.jlex.java: CFlat.jlex sym.class
	java -cp $(CP) JLex.Main CFlat.jlex

sym.class: sym.java
	$(JC) -g -cp $(CP) sym.java

sym.java: CFlat.cup
	java -cp $(CP) java_cup.Main < CFlat.cup

ErrMsg.class: ErrMsg.java
	$(JC) -cp $(CP) ErrMsg.java

Sym.class: Sym.java Type.java ast.java
	$(JC) -g Sym.java
	
SymTable.class: SymTable.java Sym.java DuplicateSymException.java EmptySymTableException.java
	$(JC) -g SymTable.java

Type.class: Type.java
	$(JC) -g Type.java

DuplicateSymException.class: DuplicateSymException.java
	$(JC) -g DuplicateSymException.java
	
EmptySymTableException.class: EmptySymTableException.java
	$(JC) -g EmptySymTableException.java

test:
	java -cp $(CP) P6 test.cf test.s

###
# clean
###
clean:
	rm -f *~ *.class parser.java CFlat.jlex.java sym.java
