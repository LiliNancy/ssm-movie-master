package org.example.service.Impl;

import org.example.entity.Movie;
import org.example.entity.Room;
import org.example.mapper.MovieMapper;
import org.springframework.stereotype.Service;
import org.example.service.MovieService;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class MovieServiceImpl implements MovieService{
    @Resource
    private MovieMapper moviemapper;

    @Override
    public List<Movie> findMovieByName(String str){
        List<Movie> list = moviemapper.findMovieByName(str);
        return list;
    }
    @Override
    public List<Movie> findMovieByType(String str){
        List<Movie> list = moviemapper.findMovieByType(str);
        return list;
    }
    @Override
    public List<Movie> findAllMovie(){
        List<Movie> list = moviemapper.findAllMovie();
        return list;
    }
    @Override
    public Movie findMovieById(int id){
        Movie m = moviemapper.findMovieById(id);
        return m;
    }
    @Override
    public int addBill(int price,String phone,int rid,String paytime){
        return moviemapper.addBill(price, phone,rid,paytime);
    }
    @Override
    public void addTicket(int rid,int sit,int billid){
        moviemapper.addTicket(rid,sit,billid);
    }
    @Override
    public List<Integer> getSeatInfo(int id,int rid){
       List<Integer> ret = moviemapper.getSeatInfo(id,rid);
        return ret;
    }

    @Override
    public List<Room> getRoomInfo(int id){
        List<Room> ret = moviemapper.getRoomInfo(id);
        return ret;
    }

    @Override
    public void updateMovieInfo( int movieid, String moviename, String movieintro, String moviedir,
                                 String moviedactor, String kinds, int moviedtext,String urll){
        moviemapper.updateMovieInfo(movieid,moviename,movieintro,moviedir,moviedactor,
                kinds,moviedtext,urll);
    }
    @Override
    public void AddRoom(String moviestime, int movieplace,int movieprice, int Mid){
        moviemapper.AddRoom(moviestime,movieplace,movieprice,Mid);
    }
    @Override
    public List<Room> CkeckRoom(int movieplace){
        return moviemapper.CkeckRoom(movieplace);
    }
    @Override
    public int AddMovie(Movie movie){
        return moviemapper.AddMovie(movie);
    }
}
