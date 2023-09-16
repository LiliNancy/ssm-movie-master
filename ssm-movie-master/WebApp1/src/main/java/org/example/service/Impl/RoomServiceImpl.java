package org.example.service.Impl;

import org.apache.ibatis.annotations.Param;
import org.example.entity.Room;
import org.example.mapper.BillMapper;
import org.example.mapper.RoomMapper;
import org.example.service.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RoomServiceImpl implements RoomService {
    @Resource
    private RoomMapper roomMapper;
}
