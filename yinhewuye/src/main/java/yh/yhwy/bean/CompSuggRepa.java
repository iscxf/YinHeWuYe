package yh.yhwy.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class CompSuggRepa {
    private Integer csrid;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date csrDate;
    private Integer user_id;
    private String csrName;
    private String csrType;
    private String csrText;
    private String csrPhone;

    public Integer getCsrid() {
        return csrid;
    }

    public void setCsrid(Integer csrid) {
        this.csrid = csrid;
    }

    public Date getCsrDate() {
        return csrDate;
    }

    public void setCsrDate(Date csrDate) {
        this.csrDate = csrDate;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getCsrName() {
        return csrName;
    }

    public void setCsrName(String csrName) {
        this.csrName = csrName;
    }

    public String getCsrType() {
        return csrType;
    }

    public void setCsrType(String csrType) {
        this.csrType = csrType;
    }

    public String getCsrText() {
        return csrText;
    }

    public void setCsrText(String csrText) {
        this.csrText = csrText;
    }

    public String getCsrPhone() {
        return csrPhone;
    }

    public void setCsrPhone(String csrPhone) {
        this.csrPhone = csrPhone;
    }

    @Override
    public String toString() {
        return "CompSuggRepa{" +
                "csrid=" + csrid +
                ", csrDate=" + csrDate +
                ", user_id=" + user_id +
                ", csrName='" + csrName + '\'' +
                ", csrType='" + csrType + '\'' +
                ", csrText='" + csrText + '\'' +
                ", csrPhone='" + csrPhone + '\'' +
                '}';
    }
}
