package com.isscollege.gdce.domain;

public class equipment {
    //id
    private  int id;
    //设备编号
    private String equipment_id;
    //设备序列号
    private String equipment_serialnum;
    //设备大类编码
    private String equipment_typecode;
    //设备组别
    private String equipment_major;
    //组别负责人名称
    private String person_name;
    //组别负责人电话
    private String person_phone;
    //店铺编号
    private String shop_id;
    //公司（经销商）编号
    private String company_Id;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEquipment_id() {
        return equipment_id;
    }

    public void setEquipment_id(String equipment_id) {
        this.equipment_id = equipment_id;
    }

    public String getEquipment_serialnum() {
        return equipment_serialnum;
    }

    public void setEquipment_serialnum(String equipment_serialnum) {
        this.equipment_serialnum = equipment_serialnum;
    }

    public String getEquipment_typecode() {
        return equipment_typecode;
    }

    public void setEquipment_typecode(String equipment_typecode) {
        this.equipment_typecode = equipment_typecode;
    }

    public String getEquipment_major() {
        return equipment_major;
    }

    public void setEquipment_major(String equipment_major) {
        this.equipment_major = equipment_major;
    }

    public String getPerson_name() {
        return person_name;
    }

    public void setPerson_name(String person_name) {
        this.person_name = person_name;
    }

    public String getPerson_phone() {
        return person_phone;
    }

    public void setPerson_phone(String person_phone) {
        this.person_phone = person_phone;
    }

    public String getShop_id() {
        return shop_id;
    }

    public void setShop_id(String shop_id) {
        this.shop_id = shop_id;
    }

    public String getCompany_Id() {
        return company_Id;
    }

    public void setCompany_Id(String company_Id) {
        this.company_Id = company_Id;
    }
}
