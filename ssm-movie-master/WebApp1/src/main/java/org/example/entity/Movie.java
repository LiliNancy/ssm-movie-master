package org.example.entity;

import java.util.List;

public class Movie {
    int movieid;
    String mname;
    String introduction;
    String type;
    int duration;
    String director;
    String performer;
    String url;
    List<Room> roomList;

    public List<Room> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<Room> roomList) {
        this.roomList = roomList;
    }

    public void setMovieid(int m){this.movieid=m;}
    public int getMovieid(){ return this.movieid;}
    public void setMname(String m){ this.mname=m;}
    public String getMname(){return this.mname;}
    public void setDuration(int d){this.duration = d;}
    public int getDuration(){ return this.duration;}
    public String getDirector(){ return this.director;}
    public void setDirector(String d){ this.director = d;}
    public String getPerformer(){ return this.performer;}
    public void setPerformer(String s){ this.performer=s;}
    public String getType(){ return this.type;}
    public void setType(String t){this.type = t;}
    public String getIntroduction(){ return introduction; }
    public void setIntroduction(String introduction){ this.introduction = introduction; }

    public String getUrl(){ return url;}
    public void setUrl(String url) {this.url = url;}

    @Override
    public String toString() {
        return "Movie{" +
                "movieid=" + movieid +
                ", mname='" + mname + '\'' +
                ", introduction='" + introduction + '\'' +
                ", type='" + type + '\'' +
                ", duration=" + duration +
                ", director='" + director + '\'' +
                ", performer='" + performer + '\'' +
                ", url='" + url + '\'' +
                ", roomList=" + roomList +
                '}';
    }
}
