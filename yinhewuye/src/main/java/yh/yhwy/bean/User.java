package yh.yhwy.bean;

public class User {

    private int userid;

    private String userName;

    private String userPass;

    private String hp_id;

    private String phonenum;

    private String mail;

    private char statu;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getHp_id() {
        return hp_id;
    }

    public void setHp_id(String hp_id) {
        this.hp_id = hp_id;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public char getStatu() {
        return statu;
    }

    public void setStatu(char statu) {
        this.statu = statu;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", userName='" + userName + '\'' +
                ", userPass='" + userPass + '\'' +
                ", hp_id='" + hp_id + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", mail='" + mail + '\'' +
                ", statu=" + statu +
                '}';
    }
}
