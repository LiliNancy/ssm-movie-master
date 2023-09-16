package org.example.service.Impl;

import org.example.entity.Bill;
import org.example.mapper.BillMapper;
import org.example.service.BillService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class BillServiceImpl implements BillService {
    @Resource
    private BillMapper billMapper;
    @Override
    public Bill FindOne(long bid){ return billMapper.FindOne(bid);}
    @Override
    public String findMovieByID(int mid){
        String nm=billMapper.findMovieByID(mid);
        return nm;
    }
    @Override
    public List<Bill> findAll(String phone){
        List<Bill> bills=billMapper.findAll(phone);
        return bills;
    }
    @Override
    public void delBill(int bid){
        billMapper.delBill(bid);
    }
    @Override
    public void delTicket(int bid){billMapper.delTicket(bid);}
}
