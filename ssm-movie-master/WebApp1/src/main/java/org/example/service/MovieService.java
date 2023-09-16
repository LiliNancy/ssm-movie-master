package org.example.service;

import org.apache.ibatis.annotations.Param;
import org.example.entity.Movie;
import org.example.entity.Room;

import java.util.ArrayList;
import java.util.List;

public interface MovieService {
    public List<Movie> findMovieByName(String name);
    public List<Movie> findAllMovie();
    public List<Movie> findMovieByType(String str);
    public Movie findMovieById(int id);
    public List<Integer> getSeatInfo(int id,int rid);
    public List<Room> getRoomInfo(int id);
    public int addBill(int price,String phone,int rid,String paytime);
    public void addTicket(int rid,int sit,int billid);
    //订单查询电影名
    public void updateMovieInfo( int movieid, String moviename, String movieintro, String moviedir,
                                 String moviedactor, String kinds, int moviedtext,String urll);
    public void AddRoom(String moviestime, int movieplace,int movieprice, int Mid);
    List<Room> CkeckRoom(int movieplace);
    public int AddMovie(Movie movie);
}
