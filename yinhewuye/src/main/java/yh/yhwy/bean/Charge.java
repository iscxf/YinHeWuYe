package yh.yhwy.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author YQ
 * 收费表
 */
public class Charge {
    //收费编号
    private int charid;
    //房产号
    private String hp_id;
    //物业费
    private double propFree;
    //水电费
    private double waeFee;
    //停车费
//    private double parkFee;
    //收费办理人
    private int staf_id;
    //收费时间
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date CharDate;

    private Staff staff;

    public int getCharid() {
        return charid;
    }

    public void setCharid(int charid) {
        this.charid = charid;
    }

    public String getHp_id() {
        return hp_id;
    }

    public void setHp_id(String hp_id) {
        this.hp_id = hp_id;
    }

    public double getPropFree() {
        return propFree;
    }

    public void setPropFree(double propFree) {
        this.propFree = propFree;
    }

    public double getWaeFee() {
        return waeFee;
    }

    public void setWaeFee(double waeFee) {
        this.waeFee = waeFee;
    }

    public int getStaf_id() {
        return staf_id;
    }

    public void setStaf_id(int staf_id) {
        this.staf_id = staf_id;
    }

    public Date getCharDate() {
        return CharDate;
    }

    public void setCharDate(Date charDate) {
        CharDate = charDate;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    @Override
    public String toString() {
        return "Charge{" +
                "charid=" + charid +
                ", hp_id='" + hp_id + '\'' +
                ", propFree=" + propFree +
                ", waeFee=" + waeFee +
                ", staf_id=" + staf_id +
                ", CharDate=" + CharDate +
                ", staff=" + staff +
                '}';
    }
}
