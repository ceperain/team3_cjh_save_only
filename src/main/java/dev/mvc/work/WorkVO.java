package dev.mvc.work;

public class WorkVO {
    
    private int workno;
    private int storeno;
    private String day;
    private String starttime;
    private String endtime;
    
    public WorkVO() {
        
    }

    public int getWorkno() {
        return workno;
    }

    public void setWorkno(int workno) {
        this.workno = workno;
    }

    public int getStoreno() {
        return storeno;
    }

    public void setStoreno(int storeno) {
        this.storeno = storeno;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }
    
}
