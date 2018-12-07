package yh.yhwy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import yh.yhwy.bean.Inspection;
import yh.yhwy.dao.IInspectionDao;
import yh.yhwy.service.InsperctionService;

import java.util.List;

/**
 * @author ljb
 */
@Service("InsperctionService")
public class InsperctionServiceImpl implements InsperctionService {

    @Autowired
    @Qualifier("IInspectionDao")
    private IInspectionDao iInspectionDao;

    public void setiInspectionDao(IInspectionDao iInspectionDao) {
        this.iInspectionDao = iInspectionDao;
    }

    @Override
    public boolean addInspection(Inspection insp) {
        int i = iInspectionDao.inserInspection(insp);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean rmInspectionByInspid(int inspid) {
        if (iInspectionDao.delectInspectionByInspid(inspid) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean rmInspectionByStaf_id(int staf_id) {
        if (iInspectionDao.delectInspectionByStaf_id(staf_id) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean modifyInspection(Inspection insp) {

        if (iInspectionDao.updateInspection(insp) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<Inspection> findInspectionByInspid(int inspid) {

        List<Inspection> inspection = iInspectionDao.selectInspectionByInspid(inspid);
        if (inspection.size() > 0) {
            return inspection;
        }
        return null;
    }

    @Override
    public List<Inspection> findInspectionByStaf_id(int staf_id) {

        List<Inspection> inspection = iInspectionDao.selectInspectionByStaf_id(staf_id);
        if (inspection.size() > 0) {
            return inspection;
        }
        return null;
    }

    @Override
    public List<Inspection> findInspectionByStafName(String stafName) {
        List<Inspection> inspection = iInspectionDao.selectInspectionByStafName(stafName);
        if (inspection.size() > 0) {
            return inspection;
        }
        return null;
    }

    @Override
    public List<Inspection> findAllInspection() {
        List<Inspection> inspection = iInspectionDao.selectAllInspection();
        if (inspection.size() > 0) {
            return inspection;
        }
        return null;
    }
}
