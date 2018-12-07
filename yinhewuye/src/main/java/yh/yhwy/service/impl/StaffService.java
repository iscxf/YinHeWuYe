package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Staff;
import yh.yhwy.dao.StaffMapper;

import java.util.List;

@Service
public class StaffService {
    @Autowired
    private StaffMapper staffMapper;

    public List<Staff> getAll() {
        // TODO Auto-generated method stub
        return staffMapper.selectByExampleWithDept();
    }
}
