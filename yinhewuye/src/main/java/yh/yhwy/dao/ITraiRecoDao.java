package yh.yhwy.dao;

import yh.yhwy.bean.Inspection;
import yh.yhwy.bean.TraiReco;

import java.util.List;

/**
 * @author ljb
 */
public interface ITraiRecoDao {

    //    新增培训记录
    int inserTraiReco(TraiReco traiReco);

    //    通过培训表编号删除培训记录
    int delectTraiRecoByTId(int traiid);

    //    删除全部培训记录
    int delectAllraiReco();

    //    更新培训记录
    int updateTraiReco(TraiReco traiReco);

    //    通过培训表编码查询培训记录
    List<TraiReco> selectTraiRecoByTId(int traiid);
    //    通过培训方向查询培训记录
    List<TraiReco> selectTraiRecoByTD(String traiDire);
    //    通过培训讲师查询培训记录
    List<TraiReco> selectTraiRecoByTL(String traiLect);
    //    查询全部培训记录
    List<TraiReco> selectAllTraiReco();
}
