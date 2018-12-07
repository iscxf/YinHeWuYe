package yh.yhwy.bean;

public class Secuinfo {
    private Integer stafId;

    private String secutime;

    private Staff staff;

    public Secuinfo() {
    }

    public Secuinfo(Integer stafId, String secutime, Staff staff) {
        this.stafId = stafId;
        this.secutime = secutime;
        this.staff = staff;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public Integer getStafId() {
        return stafId;
    }

    public void setStafId(Integer stafId) {
        this.stafId = stafId;
    }

    public String getSecutime() {
        return secutime;
    }

    public void setSecutime(String secutime) {
        this.secutime = secutime == null ? null : secutime.trim();
    }
}