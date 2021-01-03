package Util;

public class MathUtil {
    public static Integer getN_R(Integer n,Integer r){//n个里面选r个
        Integer nr=1,rr=1;
        for(int i=1;i<=n;i++)//n! 分子
            nr*=i;
        for(int i=1;i<=r;i++)
            rr*=i;
        for(int i=1;i<=n-r;i++)
            rr*=i;
        return nr/rr;
    }
}
