package Bean;

import java.sql.Date;

public class Order {
    private int o_id;
    private Date date;
    private String period;
    private float payment;
    private int u_id;
    private int l_id;
    private String red;
    private String blue;

    public Order(){}
    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public float getPayment() {
        return payment;
    }

    public void setPayment(float payment) {
        this.payment = payment;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public int getL_id() {
        return l_id;
    }

    public void setL_id(int l_id) {
        this.l_id = l_id;
    }

    public String getRed() {
        return red;
    }

    public void setRed(String red) {
        this.red = red;
    }

    public String getBlue() {
        return blue;
    }

    public void setBlue(String blue) {
        this.blue = blue;
    }

    @Override
    public String toString() {
        return "Order{" +
                "o_id=" + o_id +
                ", date=" + date +
                ", period='" + period + '\'' +
                ", payment=" + payment +
                ", u_id=" + u_id +
                ", l_id=" + l_id +
                ", red='" + red + '\'' +
                ", blue='" + blue + '\'' +
                '}';
    }
}
