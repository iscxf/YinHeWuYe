package yh.yhwy.bean;

/**
 * @author YQ
 * 住户表
 */
public class Resident {
    //住户编号
    private int resid;
    //房产号
    private String hp_id;
    //户主名字
    private String resiName;
    //户主身份证
    private String resiIden;
    //家庭常住人口
    private int resiTota;

    public Resident() {
    }

    public Resident(String hp_id, String resiName, String resiIden, int resiTota) {
        this.hp_id = hp_id;
        this.resiName = resiName;
        this.resiIden = resiIden;
        this.resiTota = resiTota;
    }

    public int getResid() {
        return resid;
    }

    public void setResid(int resid) {
        this.resid = resid;
    }

    public String getHp_id() {
        return hp_id;
    }

    public void setHp_id(String hp_id) {
        this.hp_id = hp_id;
    }

    public String getResiName() {
        return resiName;
    }

    public void setResiName(String resiName) {
        this.resiName = resiName;
    }

    public String getResiIden() {
        return resiIden;
    }

    public void setResiIden(String resiIden) {
        this.resiIden = resiIden;
    }

    public int getResiTota() {
        return resiTota;
    }

    public void setResiTota(int resiTota) {
        this.resiTota = resiTota;
    }

    @Override
    public String toString() {
        return "Resident{" +
                "resid=" + resid +
                ", hp_id='" + hp_id + '\'' +
                ", resiName='" + resiName + '\'' +
                ", resiIden='" + resiIden + '\'' +
                ", resiTota=" + resiTota +
                '}';
    }
}
