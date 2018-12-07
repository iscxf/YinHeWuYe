package yh.yhwy.dao;

import yh.yhwy.bean.Dailsecu;
import yh.yhwy.bean.DailsecuExample;

import java.util.List;

public interface DailsecuMapper {
//    long countByExample(DailsecuExample example);
//
//    int deleteByExample(DailsecuExample example);

    int deleteByPrimaryKeyWithStaf(Integer id);

    int insert(Dailsecu record);


    List<Dailsecu> selectByExample(DailsecuExample example);

    List<Dailsecu> selectByPrimaryKeyWithName(String name);

    List<Dailsecu> selectByExampleWithStaf(DailsecuExample example);

    int updateByPrimaryKeyWithStaf(Dailsecu record);

    int updateByPrimaryKey(Dailsecu record);
}