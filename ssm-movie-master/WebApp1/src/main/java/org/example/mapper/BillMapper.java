package org.example.mapper;
import org.example.entity.Bill;

import java.util.List;

public interface BillMapper {
    Bill FindOne(long bid);
    String findMovieByID(int mid);
    List<Bill> findAll(String phone);
    void delBill(int bid);
    void delTicket(int bid);
}
