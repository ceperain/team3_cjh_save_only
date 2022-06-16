package dev.mvc.keylist;

public enum KeyListEnum {
    A(1, "가성비 좋아요~!", "btn-outline-danger", "btn-danger"),
    B(2, "친절해요~!", "btn-outline-warning", "btn-warning"),
    C(3, "분위기가 좋아요~!", "btn-outline-info", "btn-info"),
    D(4, "재료가 신선해요~!", "btn-outline-primary", "btn-primary"),
    E(5, "청결해요~!", "btn-outline-secondary", "btn-secondary"),
    F(6, "주차하기 좋아요~!", "btn-outline-success", "btn-success");
    
    private final int value;
    private final String text;
    private final String normalStyle;
    private final String checkedStyle;
    


    public int getValue() {
        return value;
    }

    public String getText() {
        return text;
    }

    public String getNormalStyle() {
        return normalStyle;
    }

    public String getCheckedStyle() {
        return checkedStyle;
    }

    KeyListEnum(int value, String text, String ns, String cs) {
        this.value = value;
        this.text = text;
        this.normalStyle = ns;
        this.checkedStyle = cs;
        // TODO Auto-generated constructor stub
    }
    
}
