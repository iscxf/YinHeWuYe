package yh.yhwy.dao;

import org.apache.ibatis.annotations.Param;
import yh.yhwy.bean.Staff;
import yh.yhwy.bean.StaffExample;

import java.util.List;

public interface StaffMapper {
    long countByExample(StaffExample example);

    int deleteByExample(StaffExample example);

    int deleteByPrimaryKey(Integer stafid);

    int insert(Staff record);

    int insertSelective(Staff record);

    List<Staff> selectByExample(StaffExample example);

    List<Staff> selectByExampleWithDept(StaffExample example);

    List<Staff> selectByPrimaryKey(Integer stafid);

    int updateByExampleSelective(@Param("record") Staff record, @Param("example") StaffExample example);

    int updateByExample(@Param("record") Staff record, @Param("example") StaffExample example);

    int updateByPrimaryKeySelective(Staff record);

    int updateByPrimaryKey(Staff record);

    List<Staff> selectByExampleWithDept();
}