package yh.yhwy.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author ljb
 */
public class Inspection {
    //考核编码
    private int inspid;
    //员工号
    private int staf_id;
    //考核内容
    private String inspText;
    //考核结果
    private String inspResu;
    //考核时间
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date inspDate;
    //员工类
    private Staff staff;

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public int getInspid() {
        return inspid;
    }

    public void setInspid(int inspid) {
        this.inspid = inspid;
    }

    public int getStaf_id() {
        return staf_id;
    }

    public void setStaf_id(int staf_id) {
        this.staf_id = staf_id;
    }

    public String getInspText() {
        return inspText;
    }

    public void setInspText(String inspText) {
        this.inspText = inspText;
    }

    public String getInspResu() {
        return inspResu;
    }

    public void setInspResu(String inspResu) {
        this.inspResu = inspResu;
    }

    public Date getInspDate() {
        return inspDate;
    }

    public void setInspDate(Date inspDate) {
        this.inspDate = inspDate;
    }

    @Override
    public String toString() {
        return "Inspection{" +
                "inspid=" + inspid +
                ", staf_id=" + staf_id +
                ", inspText='" + inspText + '\'' +
                ", inspResu='" + inspResu + '\'' +
                ", inspDate=" + inspDate +
                ", staff=" + staff +
                '}';
    }
}
