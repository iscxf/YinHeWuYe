package yh.yhwy.dao;

import yh.yhwy.bean.CompSuggRepa;

import java.util.List;

public interface ICSRDao {
//    根据类型查询所有记录
    List<CompSuggRepa> selectAllCSR(int csrType);

//    通过类型和用户id查询记录
    List<CompSuggRepa> selectCSRById(int csrType, int user_id);

//    用户增加记录
    int addComplaint(CompSuggRepa csr);
}
