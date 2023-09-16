package org.example.controller;

import org.example.entity.Bill;
import org.example.entity.Movie;
import org.example.entity.User;
import org.example.service.BillService;
import org.example.service.MovieService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class BillController {
    @Resource
    private BillService billService;
    @RequestMapping("/gobill")
    public String checkbill(long bid, Model model, HttpSession session){
        Bill b=billService.FindOne(bid);

        if (b != null) {
            b.getRoom().setMovieOn(billService.findMovieByID(Integer.valueOf(b.getRoom().getMovieOn())));
            model.addAttribute("bill",b);
            session.setAttribute("bill",b);
            return "researchok";
        } else
            return "researchfail";
    }
    @RequestMapping("allbilllist")
    public String billPage( Model model, HttpSession session){
        String phone=((User)session.getAttribute("user")).getTelephone();
        List<Bill> bs=billService.findAll(phone);
        for(int i=0;i<bs.size();i++){
            bs.get(i).getRoom().setMovieOn(billService.findMovieByID(Integer.valueOf(bs.get(i).getRoom().getMovieOn())));
        }
        model.addAttribute("bills",bs);
        session.setAttribute("bills",bs);
        return "allbill";
    }
    @RequestMapping("cancelbill")
    public String cancelBill(int whichone,Model model, HttpSession session) throws ParseException {
        Bill bill=((List<Bill>) session.getAttribute("bills")).get(whichone);
        String time=bill.getRoom().getUseTime();
        Calendar cal=Calendar.getInstance();

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH:mm");
        Date statime = format.parse(time);
        cal.add(Calendar.HOUR,2);
        if(cal.getTime().after(statime)){


            return "refundfail";
        }else{
            billService.delTicket((int) bill.getBid());
            billService.delBill((int) bill.getBid());
            return "refundok";
        }
    }
}
