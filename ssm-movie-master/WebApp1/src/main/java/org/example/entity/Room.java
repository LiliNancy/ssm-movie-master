package org.example.entity;

public class Room {
    int Rid;//信息编号（主键）
    int num;//播放室编号
    String useTime;//占用时间（开始）
    String movieOn;//播放电影
    int price;
    public int getRid() {return Rid;}
    public void setRid(int Rid){this.Rid = Rid;}
    public int getNum(){ return num; }
    public void setNum(int num){ this.num = num; }
    public String getUseTime(){ return useTime; }
    public void setUseTime(String useTime){ this.useTime = useTime; }
    public String getMovieOn(){ return movieOn; }
    public void setMovieOn(String movieOn){ this.movieOn = movieOn; }
    public int getPrice() {return price;}
    public void setPrice(int price) {this.price = price;}

    @Override
    public String toString() {
        return "Room{" +
                "Rid=" + Rid +
                ", num=" + num +
                ", useTime='" + useTime + '\'' +
                ", movieOn='" + movieOn + '\'' +
                ", price=" + price +
                '}';
    }
}
