package yh.yhwy.bean;

/**
 * @author YQ
 * 房产表
 */
public class HousProp {
    private int id;
    //房产号
    private String hpid;
    //楼号
    private int buil_id;
    //单元号
    private String unit;
    //门牌号
    private String doorplate;
    //住户
    private Resident resident;
    //房屋交接
    //private List<HousTran> housTrans;
    //收费记录
    //private List<Charge> charges;
    //楼宇信息
    //private Building building;

    public HousProp() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHpid() {
        return hpid;
    }

    public void setHpid(String hpid) {
        this.hpid = hpid;
    }

    public int getBuil_id() {
        return buil_id;
    }

    public void setBuil_id(int buil_id) {
        this.buil_id = buil_id;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getDoorplate() {
        return doorplate;
    }

    public void setDoorplate(String doorplate) {
        this.doorplate = doorplate;
    }

    public Resident getResident() {
        return resident;
    }

    public void setResident(Resident resident) {
        this.resident = resident;
    }

    @Override
    public String toString() {
        return "HousProp{" +
                "id=" + id +
                ", hpid='" + hpid + '\'' +
                ", buil_id=" + buil_id +
                ", unit='" + unit + '\'' +
                ", doorplate='" + doorplate + '\'' +
                ", resident=" + resident +
                '}';
    }
}
