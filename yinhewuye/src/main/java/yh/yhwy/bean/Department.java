package yh.yhwy.bean;

/**
 * @author ljb
 */
public class Department {

    //部门编号
    private int partid;
    //    部门名称
    private String partName;
    //    部门职责
    private String partDuty;


    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public String getPartDuty() {
        return partDuty;
    }

    public void setPartDuty(String partDuty) {
        this.partDuty = partDuty;
    }

    public int getPartid() {
        return partid;
    }

    public void setPartid(int partid) {
        this.partid = partid;
    }

    @Override
    public String toString() {
        return "Department{" +
                "partid=" + partid +
                ", partName='" + partName + '\'' +
                ", partDuty='" + partDuty + '\'' +
                '}';
    }
}
