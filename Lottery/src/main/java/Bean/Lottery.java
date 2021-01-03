package Bean;

import java.sql.Date;

public class Lottery {
    private int id;//彩票id
    private int period;//期数
    private String information;//彩票信息
    private Date date;//开奖日期
    private long pool;//奖池
    private String red;//红球
    private String blue;//红球
    private long sale;//销售额
    private Date close;//截止日期
    private String name;//彩种名称

    public Lottery(){}
    public Lottery(int id, int period, String information, Date date, long pool, String red, String blue, long sale, Date close, String name) {
        this.id = id;
        this.period = period;
        this.information = information;
        this.date = date;
        this.pool = pool;
        this.red = red;
        this.blue = blue;
        this.sale = sale;
        this.close = close;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public long getPool() {
        return pool;
    }

    public void setPool(long pool) {
        this.pool = pool;
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

    public long getSale() {
        return sale;
    }

    public void setSale(long sale) {
        this.sale = sale;
    }

    public Date getClose() {
        return close;
    }

    public void setClose(Date close) {
        this.close = close;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Lottery{" +
                "id=" + id +
                ", period=" + period +
                ", information='" + information + '\'' +
                ", date=" + date +
                ", pool=" + pool +
                ", red='" + red + '\'' +
                ", blue='" + blue + '\'' +
                ", sale=" + sale +
                ", close=" + close +
                ", name='" + name + '\'' +
                '}';
    }
}
