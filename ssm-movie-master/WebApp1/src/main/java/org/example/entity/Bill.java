package org.example.entity;

import java.util.List;

public class Bill {
    long bid;//订单编号
    int money;//花费总金额
    List<Ticket> tickets;//购买的票
    User user;//购买的用户
    Room room;//电影票的播放室、电影名和播放时间
    String paytime;//支付时间,格式请严格按照xxxx-xx-xx-xx:xx
    public long getBid(){ return bid; }
    public void setBid(long bid){ this.bid = bid; }
    public int getMoney(){ return money;}
    public void setMoney(int money){ this.money = money; }
    public List<Ticket> getTickets(){ return tickets; }
    public void setTickets(List<Ticket> tickets){ this.tickets = tickets; }
    public User getUser(){ return user; }
    public void setUser(User user){ this.user = user; }
    public Room getRoom(){ return room; }
    public void setRoom(Room room){ this.room = room; }
    public String getPaytime(){ return paytime; }
    public void setPaytime(String paytime){ this.paytime = paytime; }
}
