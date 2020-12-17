package com.isscollege.gdce.domain;

public class Shop {
    //id
    private  int id;
    // 店铺编号
    private String shop_id;
    // 店铺名称
    private String shop_name;
    // 店铺地址
    private String shop_address;
    // 联系人姓名
    private String person_name;
    // 联系人电话
    private String person_phone;
    // 联系人邮箱
    private String person_email;
    // 分组
    private int groupNum = 0;
    // 自动催缴状态
    private boolean auto_urged_state = false;
    // 自动锁机状态
    private boolean auto_lock_state = false;
    // 自动催缴设置多少次提示
    private int auto_urged_times = 0;
    // 自动锁机设置多少次锁机
    private int auto_lock_times = 0;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShop_id() {
        return shop_id;
    }

    public void setShop_id(String shop_id) {
        this.shop_id = shop_id;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public String getShop_address() {
        return shop_address;
    }

    public void setShop_address(String shop_address) {
        this.shop_address = shop_address;
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

    public String getPerson_email() {
        return person_email;
    }

    public void setPerson_email(String person_email) {
        this.person_email = person_email;
    }

    public int getGroupNum() {
        return groupNum;
    }

    public void setGroupNum(int groupNum) {
        this.groupNum = groupNum;
    }

    public boolean isAuto_urged_state() {
        return auto_urged_state;
    }

    public void setAuto_urged_state(boolean auto_urged_state) {
        this.auto_urged_state = auto_urged_state;
    }

    public boolean isAuto_lock_state() {
        return auto_lock_state;
    }

    public void setAuto_lock_state(boolean auto_lock_state) {
        this.auto_lock_state = auto_lock_state;
    }

    public int getAuto_urged_times() {
        return auto_urged_times;
    }

    public void setAuto_urged_times(int auto_urged_times) {
        this.auto_urged_times = auto_urged_times;
    }

    public int getAuto_lock_times() {
        return auto_lock_times;
    }

    public void setAuto_lock_times(int auto_lock_times) {
        this.auto_lock_times = auto_lock_times;
    }
}
