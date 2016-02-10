import java.util.*;

public class SymTable {
    private List<HashMap<String, SemSym>> list;
    private int offset = 0;
    private boolean global = true;
    
    public SymTable() {
        list = new LinkedList<HashMap<String, SemSym>>();
        list.add(new HashMap<String, SemSym>());
    }
    
    public void setCurrentOffset(int offset)
    {
    	this.offset = offset;
    }

    public int getCurrentOffset()
    {
        return offset;
    }

    public void setCurrentGlobal(boolean global)
    {
    	this.global = global;
    }

    public boolean getCurrentGlobal()
    {
        return global;
    }
    
    public void addDecl(String name, SemSym sym) 
    throws DuplicateSymException, EmptySymTableException {
        if (name == null || sym == null)
            throw new NullPointerException();
        
        if (list.isEmpty())
            throw new EmptySymTableException();
        
        HashMap<String, SemSym> symTab = list.get(0);
        if (symTab.containsKey(name))
            throw new DuplicateSymException();
        
        sym.setOffset(offset);
        sym.setGlobal(global);
        
        symTab.put(name, sym);
    }
    
    public void addScope() {
        list.add(0, new HashMap<String, SemSym>());
    }
    
    public SemSym lookupLocal(String name) {
        if (list.isEmpty())
            return null;
        
        HashMap<String, SemSym> symTab = list.get(0); 
        return symTab.get(name);
    }
    
    public SemSym lookupGlobal(String name) {
        if (list.isEmpty())
            return null;
        
        for (HashMap<String, SemSym> symTab : list) {
            SemSym sym = symTab.get(name);
            if (sym != null)
                return sym;
        }
        return null;
    }
    
    public void removeScope() throws EmptySymTableException {
        if (list.isEmpty())
            throw new EmptySymTableException();
        list.remove(0);
    }
    
    public void print() {
        System.out.print("\nSym Table\n");
        for (HashMap<String, SemSym> symTab : list) {
            System.out.println(symTab.toString());
        }
        System.out.println();
    }
}
