package com.Patrick.service.implement;

import com.Patrick.dao.Staff;
import com.Patrick.mapper.WebMapper;
import com.Patrick.service.WebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WebServiceImpl implements WebService {
    @Autowired
    WebMapper webMapper;


    @Override
    public List<Staff> login(String staff_name, String staff_password) {
        return webMapper.login(staff_name, staff_password);
    }
}
