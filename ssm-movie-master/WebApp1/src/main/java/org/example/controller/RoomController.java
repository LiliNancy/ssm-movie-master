package org.example.controller;

import org.example.service.BillService;
import org.example.service.RoomService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

public class RoomController {
    @Resource
    private RoomService roomService;

}
