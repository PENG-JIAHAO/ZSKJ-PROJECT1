package com.isscollege.gdce.domain;

public class News {

	//用户名称
	private String name;
	//资讯标题
	private String title;
	//资讯类型(宏观政策:hgzc、市场分析:scfx、电力行业:dlhy、煤炭价格:mtjg)
	private String type;
	//审核状态(0-待审核、1-审核通过、2-审核不通过)
	private int reviewState;
	//资讯发布时间
	private String createDate;
	//资讯内容
	private String content;
	//资讯id
	private int id;
    //提交审核时间
    private String submitDate;
    //记录编号
	private String recordID;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public News()
	{
		super();
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public int getReviewState()
	{
		return reviewState;
	}

	public void setReviewState(int reviewState)
	{
		this.reviewState = reviewState;
	}

	public String getCreateDate()
	{
		return createDate;
	}

	public void setCreateDate(String createDate)
	{
		this.createDate = createDate;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

    public void setSubmitDate(String submitDate) { this.submitDate = submitDate; }

	public void setRecordID(String recordID) { this.recordID = recordID; }

	public String getRecordID() { return recordID; }
}
