package dev.mvc.keylist;
/*
keylistno                                NUMBER(2)       NOT NULL       PRIMARY KEY,
keytext                             VARCHAR2(100)       NOT NULL
*/
public class KeylistVO {

    public KeylistVO() {
        
    }
    
    private int keylistno;
    
    public int getKeylistno() {
        return keylistno;
    }

    public void setKeylistno(int keylistno) {
        this.keylistno = keylistno;
    }

    public String getKeytext() {
        return keytext;
    }

    public void setKeytext(String keytext) {
        this.keytext = keytext;
    }

    private String keytext;
}
