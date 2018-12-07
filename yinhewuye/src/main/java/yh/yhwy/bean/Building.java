package yh.yhwy.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author YQ
 * 楼宇表
 */
public class Building {
    //楼号
    private int builid;
    //楼宇布局
    private String layout;
    //建造公司
    private String builComp;
    //工期
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date builDate;

    public Building() {
    }

    public int getBuilid() {
        return builid;
    }

    public void setBuilid(int builid) {
        this.builid = builid;
    }

    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
    }

    public String getBuilComp() {
        return builComp;
    }

    public void setBuilComp(String builComp) {
        this.builComp = builComp;
    }

    public Date getBuilDate() {
        return builDate;
    }

    public void setBuilDate(Date builDate) {
        this.builDate = builDate;
    }

    @Override
    public String toString() {
        return "Building{" +
                "builid=" + builid +
                ", layout='" + layout + '\'' +
                ", builComp='" + builComp + '\'' +
                ", builDate=" + builDate +
                '}';
    }
}
