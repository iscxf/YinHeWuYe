package yh.yhwy.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class SpotMana {
    private Integer id;
    private Integer spotid;
    private Integer park_id;
    private String isRent;
    private Integer user_id;
    private String user_name;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date rentStart;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date rentEnd;
    private Double parkFee;
    private Park park;
    private User user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSpotid() {
        return spotid;
    }

    public void setSpotid(Integer spotid) {
        this.spotid = spotid;
    }

    public Integer getPark_id() {
        return park_id;
    }

    public void setPark_id(Integer park_id) {
        this.park_id = park_id;
    }

    public String getIsRent() {
        return isRent;
    }

    public void setIsRent(String isRent) {
        this.isRent = isRent;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
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

    public Double getParkFee() {
        return parkFee;
    }

    public void setParkFee(Double parkFee) {
        this.parkFee = parkFee;
    }

    public Park getPark() {
        return park;
    }

    public void setPark(Park park) {
        this.park = park;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "SpotMana{" +
                "id=" + id +
                ", spotid=" + spotid +
                ", park_id=" + park_id +
                ", isRent='" + isRent + '\'' +
                ", user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", rentStart=" + rentStart +
                ", rentEnd=" + rentEnd +
                ", parkFee=" + parkFee +
                ", park=" + park +
                ", user=" + user +
                '}';
    }
}
