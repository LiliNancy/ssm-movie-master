package org.example.controller;

import org.example.entity.Manager;
import org.example.entity.Movie;
import org.example.entity.User;
import org.example.mapper.MovieMapper;
import org.example.service.MovieService;
import org.example.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    MovieService movieService;
    @RequestMapping("/golog")
    public String log(User user, Model model, HttpSession session) {
        User u = userService.findOne(user);
        model.addAttribute("user", u);
        session.setAttribute("user",u);

        if (u != null) {

            List<Movie> list=movieService.findAllMovie();
            model.addAttribute("mlist",list);
            session.setAttribute("allmovie",list);
            return "logok";
        } else
            return "logno";
    }


    @RequestMapping("/goreg")
    public String reg(User user) {
        User u = userService.checkReg(user.getTelephone());

        if (u == null) {
            userService.addOne(user);
            return "regok";
        }
        return "regno";
    }
    @RequestMapping("/secuser")
    public String secChu(String pwd, Model model, HttpSession session){
        User user=(User) session.getAttribute("user");
        userService.secChangeuser(pwd,user.getTelephone());
        session.removeAttribute("user");
        return "log";
    }

}