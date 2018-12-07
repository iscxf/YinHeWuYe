package yh.yhwy.dao;

import org.apache.ibatis.annotations.Param;
import yh.yhwy.bean.Secuinfo;
import yh.yhwy.bean.SecuinfoExample;

import java.util.List;

public interface SecuinfoMapper {
    long countByExample(SecuinfoExample example);

    int deleteByExample(SecuinfoExample example);

    int deleteByPrimaryKeyWithName(Integer stafId);

    int insert(Secuinfo record);

    int insertSelective(Secuinfo record);

    List<Secuinfo> selectByExampleWithName(SecuinfoExample example);

    List<Secuinfo> selectByName(String stafname);

    List<Secuinfo> selectByTime(String secutime);

    List<Secuinfo> selectByExample(SecuinfoExample example);

    Secuinfo selectByPrimaryKeyWithName(Integer stafId);

    int updateByExampleSelective(@Param("record") Secuinfo record, @Param("example") SecuinfoExample example);

    int updateByExampleWithBLOBs(@Param("record") Secuinfo record, @Param("example") SecuinfoExample example);

    int updateByPrimaryKeyWithName(Secuinfo record);

    int updateByExample(@Param("record") Secuinfo record, @Param("example") SecuinfoExample example);

    int updateByPrimaryKeySelective(Secuinfo record);

    int updateByPrimaryKeyWithBLOBs(Secuinfo record);
}