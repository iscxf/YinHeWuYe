package yh.yhwy.service;

import yh.yhwy.bean.CompSuggRepa;

import java.util.List;

public interface ICSRService {

    List<CompSuggRepa> selectAllCSR(int csrType);

    List<CompSuggRepa> selectCSRById(int csrType, int user_id);

    int addComplaint(CompSuggRepa csr);
}
