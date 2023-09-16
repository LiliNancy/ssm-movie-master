package org.example.controller;

import org.example.entity.Manager;
import org.example.service.ManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class ManagerController {
    @Resource
    private ManagerService managerService;
    @RequestMapping("/gologM")
    public String log(Manager user, Model model, HttpSession session) {
        Manager u = managerService.findOne(user);
        model.addAttribute("manager", u);
        session.setAttribute("manager",u);

        if (u != null) {
            return "logokM";
        } else
            return "logno";
    }


    @RequestMapping("/goregM")
    public String reg(Manager user) {
        Manager u = managerService.checkReg(user.getUserid());
        System.out.println(user.toString());
        if (u == null) {
            managerService.addOne(user);
            return "regok";
        }
        return "regno";
    }
    @RequestMapping("/secchange")
    public String secCh(String pwd, Model model, HttpSession session){
        Manager user=(Manager) session.getAttribute("manager");
        managerService.secChange(pwd,user.getAdminid());
        session.removeAttribute("manager");
        return "log";
    }

}