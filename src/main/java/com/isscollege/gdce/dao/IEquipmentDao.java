package com.isscollege.gdce.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.isscollege.gdce.domain.equipment;


public interface IEquipmentDao {

    //浏览经销商设备表
    List<equipment> getCompanyEquipment(@Param("company_Id")String company_Id, @Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
    //浏览经销商表设备总数
    int getCompanyEquipmentListTotal(@Param("company_Id")String company_Id,@Param("sort")String sort,@Param("order")String order);
    //浏览所有设备表
    List<equipment> getAllEquipment(@Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
    //浏览所有设备总数
    int getAllEquipmentListTotal(@Param("sort")String sort,@Param("order")String order);

    //浏览设备使用商设备表
    List<equipment> getShopEquipment(@Param("shop_id")String shop_id, @Param("offset") int offset, @Param("limit") int limit, @Param("sort") String sort, @Param("order") String order);
    //浏览设备使用商表设备总数
    int getShopEquipmentListTotal(@Param("shop_id")String shop_id,@Param("sort")String sort,@Param("order")String order);
}
