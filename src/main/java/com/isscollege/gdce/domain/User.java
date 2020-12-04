package com.isscollege.gdce.domain;

public class User
{
	// 用户编号
	private long id;
	// 用户姓名
	private String name;
	// 用户密码
	private String password;
	//用户类型 /*0-超管 1-管理员 2-会员*/
	private int level;
	//用户权限
	private String permission;
	//企业机构代码
	private String  companyId ;

	//是否记住密码
	private boolean isRemember;
	// 登录状态
	private boolean loginState = false;
	//管理员姓名
	private String username;
	//管理员部门
	private String department;
	//管理员联系电话
	private String phonenumber;
	//管理员邮箱
	private String email;
	
	public User()
	{
	}

	public User(String name, String password, boolean isRemember)
	{
		this.name = name;
		this.password = password;
		this.isRemember = isRemember;
		
	}
	
	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getDepartment()
	{
		return department;
	}

	public void setDepartment(String department)
	{
		this.department = department;
	}

	public String getPhonenumber()
	{
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber)
	{
		this.phonenumber = phonenumber;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public long getId()
	{
		return this.id;
	}

	public void setId(long id)
	{
		this.id = id;
	}

	public String getName()
	{
		return this.name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPassword()
	{
		return this.password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	
	public boolean isRemember()
	{
		return this.isRemember;
	}

	public void setRemember(boolean isRemember)
	{
		this.isRemember = isRemember;
	}

	public boolean isLoginState()
	{
		return this.loginState;
	}

	public void setLoginState(boolean loginState)
	{
		this.loginState = loginState;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", level=" + level + ", permission="
				+ permission + ", companyId=" + companyId + ", isRemember=" + isRemember + ", loginState=" + loginState
				+", username=" + username +  ", department=" + department + ", phonenumber=" + phonenumber + ", email=" + email + "]";
	}
	
}
