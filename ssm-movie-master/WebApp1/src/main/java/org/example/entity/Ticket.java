package org.example.entity;

public class Ticket {
    int num;//电影票编号
    int room;//对应的播放室、时间和电影名
    int site;//座位
    int getNum(){ return num; }
    void setNum(int num){ this.num = num; }
    int getRoom(){ return room; }
    void setRoom(int room){ this.room = room; }
    int getSite(){return site; }
    void setSite(int site){ this.site = site; }
}
