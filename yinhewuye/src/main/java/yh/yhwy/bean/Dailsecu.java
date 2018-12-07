package yh.yhwy.bean;

import java.util.Date;

public class Dailsecu {
    private Integer id;
//    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date tooldate;

    private String tooldeta;

    private String secudeta;

    private String stafName;

    private Staff staff;

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public Dailsecu() {
        super();
    }


    public Dailsecu(Integer id, Integer stafId, Date tooldate, String tooldeta, String secudeta, String stafName) {
        this.id = id;
        this.tooldate = tooldate;
        this.tooldeta = tooldeta;
        this.secudeta = secudeta;
        this.stafName = stafName;
    }


    public String getstafName() {
        return stafName;
    }

    public void setstafName(String stafName) {
        this.stafName = stafName;
    }


    public String getTooldeta() {
        return tooldeta;
    }

    public void setTooldeta(String tooldeta) {
        this.tooldeta = tooldeta == null ? null : tooldeta.trim();
    }

    public String getSecudeta() {
        return secudeta;
    }

    public void setSecudeta(String secudeta) {
        this.secudeta = secudeta == null ? null : secudeta.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Date getTooldate() {
        return tooldate;
    }

    public void setTooldate(Date tooldate) {
        this.tooldate = tooldate;
    }
}