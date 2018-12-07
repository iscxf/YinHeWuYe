package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.TraiReco;
import yh.yhwy.dao.ITraiRecoDao;
import yh.yhwy.service.TraiRecoService;

import java.util.List;

/**
 * @author ljb
 */
@Service("TraiRecoService")
public class TraiRecoServiceImpl implements TraiRecoService {

    @Autowired
    @Qualifier("ITraiRecoDao")
    private ITraiRecoDao iTraiRecoDao;

    public void setiTraiRecoDao(ITraiRecoDao iTraiRecoDao) {
        this.iTraiRecoDao = iTraiRecoDao;
    }

    @Override
    public boolean addTraiReco(TraiReco traiReco) {

        if(iTraiRecoDao.inserTraiReco(traiReco) > 0 ){
            return true;
        }
        return false;
    }

    @Override
    public boolean rmTraiRecoByTId(int traiid) {
        if(iTraiRecoDao.delectTraiRecoByTId(traiid) >  0 ){
            return true;
        }
        return false;
    }

    @Override
    public boolean rmAllraiReco() {
        if (iTraiRecoDao.selectAllTraiReco()  == null){
            return true;
        }else if(iTraiRecoDao.delectAllraiReco() > 0 ){
            return true;
        }
        return false;
    }

    @Override
    public boolean modifyTraiReco(TraiReco traiReco) {
        if(iTraiRecoDao.updateTraiReco(traiReco) > 0){
            return true;
        }
        return false;
    }

    @Override
    public List<TraiReco> findTraiRecoByTId(int traiid) {
        List<TraiReco> traiRecos = iTraiRecoDao.selectTraiRecoByTId(traiid);
        if (traiRecos.size() > 0){
            return traiRecos;
        }
        return null;
    }

    @Override
    public List<TraiReco> findTraiRecoByTD(String traiDire) {
        List<TraiReco> traiRecos = iTraiRecoDao.selectTraiRecoByTD(traiDire);
        if (traiRecos.size() > 0){
            return traiRecos;
        }
        return null;
    }

    @Override
    public List<TraiReco> findTraiRecoByTL(String traiLect) {
        List<TraiReco> traiRecos = iTraiRecoDao.selectTraiRecoByTL(traiLect);
        if (traiRecos.size() > 0){
            return traiRecos;
        }
        return null;
    }

    @Override
    public List<TraiReco> findAllTraiReco() {

        List<TraiReco> traiRecos = iTraiRecoDao.selectAllTraiReco();
        if (traiRecos.size() > 0){
            return traiRecos;
        }
        return null;
    }
}
