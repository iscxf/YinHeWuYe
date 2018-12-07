package yh.yhwy.bean;

import java.util.Date;

public class History {
    private Integer histid;
    private Integer spot_id;
    private Integer user_id;
    private Date rentStart;
    private Date rentEnd;
    private Double parkFee;
    private User user;

    public Integer getHistid() {
        return histid;
    }

    public void setHistid(Integer histid) {
        this.histid = histid;
    }

    public Integer getSpot_id() {
        return spot_id;
    }

    public void setSpot_id(Integer spot_id) {
        this.spot_id = spot_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Date getRentStart() {
        return rentStart;
    }

    public void setRentStart(Date rentStart) {
        this.rentStart = rentStart;
    }

    public Date getRentEnd() {
        return rentEnd;
    }

    public void setRentEnd(Date rentEnd) {
        this.rentEnd = rentEnd;
    }

    public double getParkFee() {
        return parkFee;
    }

    public void setParkFee(double parkFee) {
        this.parkFee = parkFee;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
