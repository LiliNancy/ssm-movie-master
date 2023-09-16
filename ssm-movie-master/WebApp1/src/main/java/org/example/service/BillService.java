package org.example.service;

import org.example.entity.Bill;

import java.util.List;

public interface BillService {
    //订单查询
    Bill FindOne(long bid);
    String findMovieByID(int mid);
    List<Bill> findAll(String phone);
    void delBill(int bid);
    void delTicket(int bid);
}
