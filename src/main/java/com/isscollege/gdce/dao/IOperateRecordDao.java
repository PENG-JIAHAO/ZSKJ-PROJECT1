package com.isscollege.gdce.dao;

import com.isscollege.gdce.domain.OperateRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IOperateRecordDao
{
    int addOperateRecord(OperateRecord vr);

    OperateRecord selectOperateRecordByID(@Param("id")int id);

    List<OperateRecord> selectOperateRecordByRecordID(@Param("rid") String rid);

    int getRecordInfoListTotal(@Param("recordId")String recordId,@Param("sort") String sort, @Param("order") String order);

    int deleteOperateRecordByID(@Param("id")int id);

    int deleteOperateRecordByRecordID(@Param("rid")String rid);
}
