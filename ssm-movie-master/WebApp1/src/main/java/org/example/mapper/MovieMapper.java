package org.example.mapper;
import org.apache.ibatis.annotations.Param;
import org.example.entity.Movie;
import org.example.entity.Room;

import java.util.ArrayList;
import java.util.List;

public interface MovieMapper {
    public List<Movie> findMovieByName(String name);
    public List<Movie> findAllMovie();
    public List<Movie> findMovieByType(String str);
    public Movie findMovieById(int id);
    public List<Integer> getSeatInfo(@Param("id") int id,@Param("rid") int rid);
    public List<Room> getRoomInfo(int id);
    public void addTicket(@Param("rid")int rid,@Param("sit") int sit,@Param("billid") int billid);
    public int addBill(@Param("money") int price,@Param("phone") String phone,@Param("rid") int rid,
                        @Param("paytime") String paytime);

    public void updateMovieInfo(@Param("movieid")int movieid,@Param("moviename")String moviename,
                                @Param("movieintro")String movieintro,@Param("moviedir")String moviedir,
                                @Param("moviedactor")String moviedactor,@Param("kinds")String kinds,
                                @Param("moviedtext")int moviedtext,@Param("urll")String urll);
    void AddRoom(@Param("moviestime")String moviestime,
                 @Param("movieplace")int movieplace,@Param("movieprice")int movieprice,
                 @Param("Mid")int Mid);
    List<Room> CkeckRoom(@Param("movieplace")int movieplace);
    public int AddMovie(Movie movie);
}
