package yh.yhwy.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author YQ
 * 房屋交接表
 */
public class HousTran {
    //交接编号
    private int htid;
    //房产号
    private String hp_id;
    //买家姓名
    private String buyName;
    //买家身份证
    private String buyIden;
    //卖家姓名
    private String sellName;
    //卖家身份证
    private String sellIden;
    //交接日期
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date tranDate;

    public HousTran() {
    }

    public int getHtid() {
        return htid;
    }

    public void setHtid(int htid) {
        this.htid = htid;
    }

    public String getHp_id() {
        return hp_id;
    }

    public void setHp_id(String hp_id) {
        this.hp_id = hp_id;
    }

    public String getBuyName() {
        return buyName;
    }

    public void setBuyName(String buyName) {
        this.buyName = buyName;
    }

    public String getBuyIden() {
        return buyIden;
    }

    public void setBuyIden(String buyIden) {
        this.buyIden = buyIden;
    }

    public String getSellName() {
        return sellName;
    }

    public void setSellName(String sellName) {
        this.sellName = sellName;
    }

    public String getSellIden() {
        return sellIden;
    }

    public void setSellIden(String sellIden) {
        this.sellIden = sellIden;
    }

    public Date getTranDate() {
        return tranDate;
    }

    public void setTranDate(Date tranDate) {
        this.tranDate = tranDate;
    }

    @Override
    public String toString() {
        return "HousTran{" +
                "htid=" + htid +
                ", hp_id='" + hp_id + '\'' +
                ", buyName='" + buyName + '\'' +
                ", buyIden='" + buyIden + '\'' +
                ", sellName='" + sellName + '\'' +
                ", sellIden='" + sellIden + '\'' +
                ", tranDate=" + tranDate +
                '}';
    }
}
