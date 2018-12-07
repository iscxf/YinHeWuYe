package yh.yhwy.bean;

public class Park {
    private Integer parkid;
    private String parkName;
    private Double parkSqua;
    private String parkAddr;
    private Integer parkTota;

    public Integer getParkid() {
        return parkid;
    }

    public void setParkid(Integer parkid) {
        this.parkid = parkid;
    }

    public String getParkName() {
        return parkName;
    }

    public void setParkName(String parkName) {
        this.parkName = parkName;
    }

    public Double getParkSqua() {
        return parkSqua;
    }

    public void setParkSqua(Double parkSqua) {
        this.parkSqua = parkSqua;
    }

    public String getParkAddr() {
        return parkAddr;
    }

    public void setParkAddr(String parkAddr) {
        this.parkAddr = parkAddr;
    }

    public Integer getParkTota() {
        return parkTota;
    }

    public void setParkTota(Integer parkTota) {
        this.parkTota = parkTota;
    }

    @Override
    public String toString() {
        return "Park{" +
                "parkid=" + parkid +
                ", parkName='" + parkName + '\'' +
                ", parkSqua=" + parkSqua +
                ", parkAddr='" + parkAddr + '\'' +
                ", parkTota=" + parkTota +
                '}';
    }
}
