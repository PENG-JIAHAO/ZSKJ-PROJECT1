package com.isscollege.gdce.domain;

public class OperateRecord
{
    //记录ID
    private int id=0;
    //操作ID
    private String recordID;
    //操作者用户名
    private String userName;
    //操作类型
    private int operateType;
    //日期
    private String createDate;
    //意见
    private String comment;

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getRecordID() { return recordID; }

    public void setRecordID(String recordID) { this.recordID = recordID; }

    public String getUserName() { return userName; }

    public void setUserName(String userName) { this.userName = userName; }

    public int getOperateType() { return operateType; }

    public void setOperateType(int operateType) { this.operateType = operateType; }

    public String getCreateDate() { return createDate; }

    public void setCreateDate(String createDate) { this.createDate = createDate; }

    public String getComment() { return comment; }

    public void setComment(String comment) {this.comment = comment; }
}
