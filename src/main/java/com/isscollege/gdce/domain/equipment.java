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
    //设备在线状态
    private int login_state;
    //设备锁机状态
    private int lock_state;
    //设备未结算次数
    private int equipment_notpay_number;
    //已结算次数
    private int equipment_hadpay_number;
    //未结算单价
    private int equipment_notpay_price;
    //已结算单价
    private int equipment_hadpay_price;
    //未结算总额
    private int equipment_notpay_allprice;
    //已结算总额
    private int equipment_hadpay_allprice;
    //未结算加已结算的总额
    private int equipment_allprice;
    //累计使用次数
    private int equipment_usetime;

    public int getEquipment_notpay_number() {
        return equipment_notpay_number;
    }

    public void setEquipment_notpay_number(int equipment_notpay_number) {
        this.equipment_notpay_number = equipment_notpay_number;
    }

    public int getEquipment_hadpay_number() {
        return equipment_hadpay_number;
    }

    public void setEquipment_hadpay_number(int equipment_hadpay_number) {
        this.equipment_hadpay_number = equipment_hadpay_number;
    }

    public int getEquipment_notpay_price() {
        return equipment_notpay_price;
    }

    public void setEquipment_notpay_price(int equipment_notpay_price) {
        this.equipment_notpay_price = equipment_notpay_price;
    }

    public int getEquipment_hadpay_price() {
        return equipment_hadpay_price;
    }

    public void setEquipment_hadpay_price(int equipment_hadpay_price) {
        this.equipment_hadpay_price = equipment_hadpay_price;
    }

    public int getEquipment_notpay_allprice() {
        return equipment_notpay_allprice;
    }

    public void setEquipment_notpay_allprice(int equipment_notpay_allprice) {
        this.equipment_notpay_allprice = equipment_notpay_allprice;
    }

    public int getEquipment_hadpay_allprice() {
        return equipment_hadpay_allprice;
    }

    public void setEquipment_hadpay_allprice(int equipment_hadpay_allprice) {
        this.equipment_hadpay_allprice = equipment_hadpay_allprice;
    }

    public int getEquipment_allprice() {
        return equipment_allprice;
    }

    public void setEquipment_allprice(int equipment_allprice) {
        this.equipment_allprice = equipment_allprice;
    }

    public int getEquipment_usetime() {
        return equipment_usetime;
    }

    public void setEquipment_usetime(int equipment_usetime) {
        this.equipment_usetime = equipment_usetime;
    }

    public int getLogin_state() {
        return login_state;
    }

    public void setLogin_state(int login_state) {
        this.login_state = login_state;
    }

    public int getLock_state() {
        return lock_state;
    }

    public void setLock_state(int lock_state) {
        this.lock_state = lock_state;
    }

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
