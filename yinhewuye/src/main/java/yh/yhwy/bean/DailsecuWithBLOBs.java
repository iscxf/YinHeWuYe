package yh.yhwy.bean;

public class DailsecuWithBLOBs extends Dailsecu {
    private String tooldeta;

    private String secudeta;

    public String getTooldeta() {
        return tooldeta;
    }

    public void setTooldeta(String tooldeta) {
        this.tooldeta = tooldeta == null ? null : tooldeta.trim();
    }

    public String getSecudeta() {
        return secudeta;
    }

    public void setSecudeta(String secudeta) {
        this.secudeta = secudeta == null ? null : secudeta.trim();
    }
}