import java.util.List;

/**
 * Type class and its subclasses: 
 * ErrorType, IntType, BoolType, VoidType, StringType, FnType, StructType,
 */
abstract public class Type {

	public final static int DEFAULT_LINE_NUM = 0;
	public final static int DEFAULT_CHAR_NUM = 0;
	
    /**
     * default constructor
     */
    public Type() {
    }

    /**
     * every subclass must provide a toString method and an equals method
     */
    abstract public String toString();
    abstract public boolean equals(Type t);
    
    //Added for error reporting
    int charNum;
    int lineNum;

    /**
     * default methods for "isXXXType"
     */
    public Type(int lineNum, int charNum)
    {
        this.lineNum = lineNum;
        this.charNum = charNum;
    }
    
    public boolean isErrorType() {
        return false;
    }

    public boolean isIntType() {
        return false;
    }

    public boolean isBoolType() {
        return false;
    }

    public boolean isVoidType() {
        return false;
    }
    
    public boolean isStringType() {
        return false;
    }

    public boolean isFnType() {
        return false;
    }

    public boolean isStructType() {
        return false;
    }
    
    public boolean isStructDefType() {
        return false;
    }

    public int charNum()
    {
        return this.charNum;
    }

    public int lineNum()
    {
        return this.lineNum;
    }

    public void setCharNum(int charNum)
    {
        this.charNum = charNum;
    }
    
    public void setLineNum(int lineNum)
    {
        this.lineNum = lineNum;
    }
}

// **********************************************************************
// ErrorType
// **********************************************************************
class ErrorType extends Type {

    public boolean isErrorType() {
        return true;
    }

    public boolean equals(Type t) {
        return t.isErrorType();
    }

    public String toString() {
        return "error";
    }
    
    public ErrorType(){ 
    	super(DEFAULT_LINE_NUM, DEFAULT_CHAR_NUM); 
    }

    public ErrorType(int lineNum, int charNum)
    {
        super(lineNum, charNum);
    }
}

// **********************************************************************
// IntType
// **********************************************************************
class IntType extends Type {

    public boolean isIntType() {
        return true;
    }

    public boolean equals(Type t) {
        return t.isIntType();
    }

    public String toString() {
        return "int";
    }
    
    public IntType(){ 
    	super(DEFAULT_LINE_NUM, DEFAULT_CHAR_NUM); 
    }

    public IntType(int lineNum, int charNum)
    {
        super(lineNum, charNum);
    }
}

// **********************************************************************
// BoolType
// **********************************************************************
class BoolType extends Type {

    public boolean isBoolType() {
        return true;
    }

    public boolean equals(Type t) {
        return t.isBoolType();
    }

    public String toString() {
        return "bool";
    }
    
    public BoolType(){ 
    	super(DEFAULT_LINE_NUM, DEFAULT_CHAR_NUM); 
    }

    public BoolType(int lineNum, int charNum)
    {
        super(lineNum, charNum);
    }
}

// **********************************************************************
// VoidType
// **********************************************************************
class VoidType extends Type {

    public boolean isVoidType() {
        return true;
    }

    public boolean equals(Type t) {
        return t.isVoidType();
    }

    public String toString() {
        return "void";
    }
    
    public VoidType(){ 
    	super(DEFAULT_LINE_NUM, DEFAULT_CHAR_NUM); 
    }

    public VoidType(int lineNum, int charNum)
    {
        super(lineNum, charNum);
    }
}

// **********************************************************************
// StringType
// **********************************************************************
class StringType extends Type {

    public boolean isStringType() {
        return true;
    }

    public boolean equals(Type t) {
        return t.isStringType();
    }

    public String toString() {
        return "String";
    }
    
    public StringType(){ 
    	super(DEFAULT_LINE_NUM, DEFAULT_CHAR_NUM); 
    }

    public StringType(int lineNum, int charNum)
    {
        super(lineNum, charNum);
    }
}

// **********************************************************************
// FnType
// **********************************************************************
class FnType extends Type {
	 private int numParams;
	 private List<Type> paramTypes;
	 private Type returnType;
	
	
    public boolean isFnType() {
        return true;
    }

    public boolean equals(Type t) {
        return t.isFnType();
    }

    public String toString() {
        return "function";
    }
    
    public FnType(){ 
    	super(DEFAULT_LINE_NUM, DEFAULT_CHAR_NUM); 
    }

    public FnType(int lineNum, int charNum)
    {
        super(lineNum, charNum);
    }
    
    public void setReturnType(Type t)
    {
        returnType = t;
    }

    public Type getReturnType()
    {
        return returnType;
    }

    public void setNumParams(int n)
    {
        numParams = n;
    }

    public int getNumParams()
    {
        return numParams;
    }

    public void setParamList(List<Type> p)
    {
    	paramTypes = p;
    }

    public List<Type> getParamList()
    {
        return paramTypes;
    }
}

// **********************************************************************
// StructType
// **********************************************************************
class StructType extends Type {
    private IdNode myId;
    
    public StructType(IdNode id) {
        myId = id;
    }
    
    public boolean isStructType() {
        return true;
    }

    public boolean equals(Type t) {
        return t.isStructType();
    }

    public String toString() {
        return myId.name();
    }
    
    public StructType(){ 
    	super(DEFAULT_LINE_NUM, DEFAULT_CHAR_NUM); 
    }

    public StructType(int lineNum, int charNum)
    {
        super(lineNum, charNum);
    }
}

// **********************************************************************
// StructDefType
// **********************************************************************
class StructDefType extends Type {

    public boolean isStructDefType() {
        return true;
    }

    public boolean equals(Type t) {
        return t.isStructDefType();
    }

    public String toString() {
        return "struct";
    }
    
    public StructDefType(){ 
    	super(DEFAULT_LINE_NUM, DEFAULT_CHAR_NUM); 
    }

    public StructDefType(int lineNum, int charNum)
    {
        super(lineNum, charNum);
    }
}
