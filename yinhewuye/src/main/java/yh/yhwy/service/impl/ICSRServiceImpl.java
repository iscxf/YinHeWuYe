package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.CompSuggRepa;
import yh.yhwy.dao.ICSRDao;
import yh.yhwy.service.ICSRService;

import java.util.List;

@Service("csrService")
public class ICSRServiceImpl implements ICSRService {
    @Autowired
    @Qualifier("ICSRDao")
    private ICSRDao dao;

    @Override
    public List<CompSuggRepa> selectAllCSR(int csrType) {
        List<CompSuggRepa> count = dao.selectAllCSR(csrType);
        return count;
    }

    @Override
    public List<CompSuggRepa> selectCSRById(int csrType, int user_id) {
        List<CompSuggRepa> count = dao.selectCSRById(csrType,user_id);
        return count;
    }

    @Override
    public int addComplaint(CompSuggRepa csr) {
        int count = dao.addComplaint(csr);
        if (count > 0) {
            return 1;
        }
        return  0;
    }
}
