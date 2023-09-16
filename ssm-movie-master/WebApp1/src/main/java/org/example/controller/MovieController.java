package org.example.controller;

import org.apache.ibatis.annotations.Param;
import org.example.entity.Movie;
import org.example.entity.Room;
import org.example.entity.User;
import org.example.service.MovieService;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Controller
public class MovieController {
    @Resource
    private MovieService movieService;
    @RequestMapping("allmovielist")
    public String moviePage(Model model, HttpSession session){
        List<Movie> list=movieService.findAllMovie();
        model.addAttribute("mlist",list);
        session.setAttribute("allmovie",list);
        return "choosefilm";
    }
    @RequestMapping("searchmovie")
    public String searchMovie(String str,Model model) throws UnsupportedEncodingException {
        str = new String((str).getBytes("iso-8859-1"),"utf-8");

        List<Movie> list = movieService.findMovieByName(str);
        model.addAttribute("mlist",list);
        return "choosefilm";
    }
    @RequestMapping("ticketByid")
    public String toBuy(HttpServletRequest request,Model model) throws ParseException {
        int id = Integer.parseInt(request.getParameter("movieid"));
        int roo = Integer.parseInt(request.getParameter("rid"));
        Movie m = movieService.findMovieById(id);
        HashMap<Integer,List<Integer>> sl = new HashMap<>();

        List<Room> trl = movieService.getRoomInfo(id);//电影排片列表
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd-HH:mm");
        Date curtime = new Date();

        List<Room> rl = new ArrayList<>();
        for(int i = 0;i<trl.size();i++){//只有为上映的排片才会出现
            if(curtime.before(simpleDateFormat.parse(trl.get(i).getUseTime()))){
                rl.add(trl.get(i));
            }
        }
        for(int i =  0;i<rl.size();i++){
            int rid = rl.get(i).getRid();
            sl.put(rid,movieService.getSeatInfo(id,rid));//电影所有排片的座位列表。一行对应一个排片，对应于rl的一个元素
        }

        model.addAttribute("movie",m);
        model.addAttribute("slist",sl);
        model.addAttribute("rlist",rl);
        model.addAttribute("rid",roo);
        return "buyticket";
    }
    @RequestMapping("searchbytype")
    public String searchbytype(HttpServletRequest request,Model model){
        List<String> types = Arrays.asList("爱情","动作","喜剧","恐怖","科幻","其他");
        String str = types.get(Integer.parseInt(request.getParameter("type"))-1);
        List<Movie> list = movieService.findMovieByType(str);
        model.addAttribute("mlist",list);
        return "choosefilm";
    }
    @RequestMapping("havebuy")
    public String havebuyticket(int price, int rid, String seats,Model model,HttpSession session){
        System.out.println("test1 buy succ");
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd-HH:mm");
        String paytime = simpleDateFormat.format(new Date());
        String phone =((User) session.getAttribute("user")).getTelephone();
        List<Integer> numList = new ArrayList<>();
        System.out.println("test2 buy succ");
        Pattern p = Pattern.compile("\\d{1,}");
        Matcher m = p.matcher(seats);
        while(m.find()) {
            numList.add(Integer.parseInt(m.group()));
        }
//        movieService.addBill(price,phone,rid,paytime);
        System.out.println("test3 buy succ");
        int billid = movieService.addBill(price,phone,rid,paytime);
        for(int i = 0;i<numList.size();i++){
            int sid = numList.get(i);
            movieService.addTicket(rid,sid,billid);
        }
        model.addAttribute("sum",price);
        return "payok";
    }
    //下面是新加的
    @RequestMapping("allmoviechange")
    public String movieChan(Model model, HttpSession session){
        List<Movie> list=movieService.findAllMovie();
        model.addAttribute("mlist",list);
        session.setAttribute("allmovie",list);
        return "Removie";
    }
    @RequestMapping("ChangePage1")
    public String goWhere1(int gowhere,Model model,HttpSession session){
        List<Movie> mlist=(List<Movie>)session.getAttribute("allmovie");
        session.setAttribute("ChooseOne",mlist.get(gowhere));
        return "remp";
    }
    @RequestMapping("ChangePage2")
    public String goWhere2(int gowhere,Model model,HttpSession session){
        List<Movie> mlist=(List<Movie>)session.getAttribute("allmovie");
        session.setAttribute("ChooseOne",mlist.get(gowhere));
        return "refm";
    }
    @RequestMapping("ChangeMovieInfo")
    public String updateMovieInfo(String moviename, String movieintro, String moviedir,
                                  String moviedactor, String kinds, int moviedtext,String urll, HttpSession session) throws UnsupportedEncodingException {
        moviename = new String((moviename).getBytes("iso-8859-1"),"utf-8");
        movieintro= new String((movieintro).getBytes("iso-8859-1"),"utf-8");
        moviedir = new String((moviedir).getBytes("iso-8859-1"),"utf-8");
        moviedactor= new String((moviedactor).getBytes("iso-8859-1"),"utf-8");
        kinds= new String((kinds).getBytes("iso-8859-1"),"utf-8");
        Movie mo=(Movie) session.getAttribute("ChooseOne");
        movieService.updateMovieInfo(mo.getMovieid(),moviename,movieintro,moviedir,moviedactor,kinds,moviedtext,urll);
        session.removeAttribute("ChooseOne");
        return "MovieSucc";
    }
    //注意！注意！
    //以下函数进行了修改！
    @RequestMapping("AddMovieInfo")
    public String AddMovieInfos(String moviedate,String moviestime,int movieplace,int movieprice,int Mid,int Duration) throws ParseException {
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd-HH:mm");
        String time=moviedate+"-"+moviestime;
        Date date0=null;
        try{
            date0=simpleDateFormat.parse(time);
        }catch (ParseException e){
            return "Wrong";
        }
        List<Room> rooms=movieService.CkeckRoom(movieplace);
        boolean right=true;
        for(int i=0;i<rooms.size();i++){
            String stTime=rooms.get(i).getUseTime();
            Date date1=simpleDateFormat.parse(stTime);
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(date1);
            rightNow.add(Calendar.MINUTE,Duration);
            Date date2=rightNow.getTime();
            if(date0.getTime()>=date1.getTime()&&date0.getTime()<=date2.getTime()){
                right=false;
                break;
            }
        }
        if(right==true){
            movieService.AddRoom(time,movieplace,movieprice,Mid);
            return "MovieSucc";
        }
        else{
            return "Wrong";
        }
    }
    @RequestMapping("addMovie")
    public String addMovie(Movie movie) throws UnsupportedEncodingException {
//        System.out.println(movie.toString());
        movie.setDirector(new String((movie.getDirector()).getBytes("iso-8859-1"),"utf-8"));
        movie.setMname(new String((movie.getMname()).getBytes("iso-8859-1"),"utf-8"));
        movie.setIntroduction(new String((movie.getIntroduction()).getBytes("iso-8859-1"),"utf-8"));
        movie.setType(new String((movie.getType()).getBytes("iso-8859-1"),"utf-8"));
        movie.setPerformer(new String((movie.getPerformer()).getBytes("iso-8859-1"),"utf-8"));
        System.out.println(movie.toString());
        int mid = movieService.AddMovie(movie);
        for(int i = 0;i<movie.getRoomList().size();i++){
            Room tmp = movie.getRoomList().get(i);
            movieService.AddRoom(tmp.getUseTime(),tmp.getNum(),tmp.getPrice(),mid);
        }

        return "MovieSucc";
    }
}
