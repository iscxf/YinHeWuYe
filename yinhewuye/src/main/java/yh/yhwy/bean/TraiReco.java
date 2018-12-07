package yh.yhwy.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author ljb
 */
public class TraiReco {

    //    培训表编号
    private int traiid;
    //    培训日期
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date traiDate;
    //    培训地点
    private String traiAddr;
    //    培训讲师
    private String traiLect;
    //    培训方向（课程）
    private String traiDire;
    //    培训内容
    private String traiText;
    //    效果评估
    private String effeAppr;

    public int getTraiid() {
        return traiid;
    }

    public void setTraiid(int traiid) {
        this.traiid = traiid;
    }

    public Date getTraiDate() {
        return traiDate;
    }

    public void setTraiDate(Date traiDate) {
        this.traiDate = traiDate;
    }

    public String getTraiAddr() {
        return traiAddr;
    }

    public void setTraiAddr(String traiAddr) {
        this.traiAddr = traiAddr;
    }

    public String getTraiLect() {
        return traiLect;
    }

    public void setTraiLect(String traiLect) {
        this.traiLect = traiLect;
    }

    public String getTraiDire() {
        return traiDire;
    }

    public void setTraiDire(String traiDire) {
        this.traiDire = traiDire;
    }

    public String getTraiText() {
        return traiText;
    }

    public void setTraiText(String traiText) {
        this.traiText = traiText;
    }

    public String getEffeAppr() {
        return effeAppr;
    }

    public void setEffeAppr(String effeAppr) {
        this.effeAppr = effeAppr;
    }

    @Override
    public String toString() {
        return "TraiReco{" +
                "traiid=" + traiid +
                ", traiDate=" + traiDate +
                ", traiAddr='" + traiAddr + '\'' +
                ", traiLect='" + traiLect + '\'' +
                ", traiDire='" + traiDire + '\'' +
                ", traiText='" + traiText + '\'' +
                ", effeAppr='" + effeAppr + '\'' +
                '}';
    }
}
