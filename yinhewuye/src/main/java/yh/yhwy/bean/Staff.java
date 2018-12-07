package yh.yhwy.bean;

/**
 * @author ljb
 */
public class Staff {

    //    员工号
    private int stafid;
    //员工名字
    private String stafName;
    //    员工性别
    private String stafSex;
    //    员工年龄
    private int stafAge;
    //    所属部门 id
    private int dapa_id;

    private Department department;

    public int getStafid() {
        return stafid;
    }

    public void setStafid(int stafid) {
        this.stafid = stafid;
    }

    public String getStafName() {
        return stafName;
    }

    public void setStafName(String stafName) {
        this.stafName = stafName;
    }

    public String getStafSex() {
        return stafSex;
    }

    public void setStafSex(String stafSex) {
        this.stafSex = stafSex;
    }

    public int getStafAge() {
        return stafAge;
    }

    public void setStafAge(int stafAge) {
        this.stafAge = stafAge;
    }

    public int getDapa_id() {
        return dapa_id;
    }

    public void setDapa_id(int dapa_id) {
        this.dapa_id = dapa_id;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "stafid=" + stafid +
                ", stafName='" + stafName + '\'' +
                ", stafSex='" + stafSex + '\'' +
                ", stafAge=" + stafAge +
                ", dapa_id=" + dapa_id +
                ", department=" + department +
                '}';
    }
}
