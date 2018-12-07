package yh.yhwy.service;

import yh.yhwy.bean.TraiReco;

import java.util.List;

/**
 * @author ljb
 */
public interface TraiRecoService {

    //    新增培训记录
    boolean addTraiReco(TraiReco traiReco);

    //    通过培训表编号删除培训记录
    boolean rmTraiRecoByTId(int traiid);

    //    删除全部培训记录
    boolean rmAllraiReco();

    //    更新培训记录
    boolean modifyTraiReco(TraiReco traiReco);

    //    通过培训表编码查询培训记录
    List<TraiReco> findTraiRecoByTId(int traiid);
    //    通过培训方向查询培训记录
    List<TraiReco> findTraiRecoByTD(String traiDire);
    //    通过培训讲师查询培训记录
    List<TraiReco> findTraiRecoByTL(String traiLect);
    //    查询全部培训记录
    List<TraiReco> findAllTraiReco();
}
