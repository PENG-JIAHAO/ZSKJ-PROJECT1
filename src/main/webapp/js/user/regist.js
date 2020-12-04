$(function() {

	setInterval("buttonGrey();","100");
	/*
	 * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
	 */
	$(".errorClass").each(function(){
		showError($(this));//遍历每个元素，使用每个元素来调用showError方法
	});
	
	/*
	 * 2. 切换注册按钮的图片
	 */
	$("#submitBtn").hover(
		function() {
			$("#submitBtn").attr("src", "<%=request.getContextPath()%>/imgs/regist2.jpg");
		},
		function() {
			$("#submitBtn").attr("src", "<%=request.getContextPath()%>/imgs/regist1.jpg");
		}
	);
	
	/*
	 * 3. 输入框得到焦点隐藏错误信息
	 */
	$(".inputClass").focus(function() {
		var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id
		$("#" + labelId).text("");//把label的内容清空！
		showError($("#" + labelId));//隐藏没有信息的label
	});
	
	/*
	 * 4. 输入框失去焦点进行校验
	 */
	$(".inputClass").blur(function() {
		var id = "loginname";
		var value = $("#" + id).val();
		if (value !=""){
			var id = $(this).attr("id");//获取当前输入框的id
			var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
			eval(funName);//执行函数调用
		}else {
			return false;
		}

	});

	$(".inputClass").blur(function() {
		var id = "loginpass";
		var value1 = $("#" + id).val();
		if (value1 !=""){
			var id = $(this).attr("id");//获取当前输入框的id
			var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
			eval(funName);//执行函数调用
		}else {
			return false;
		}

	});
	$(".inputClass").blur(function() {
		var id = "reloginpass";
		var value2 = $("#" + id).val();
		if (value2 !=""){
			var id = $(this).attr("id");//获取当前输入框的id
			var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
			eval(funName);//执行函数调用
		}else {
			return false;
		}


	});


	//5. 表单提交时进行校验
	$("#registForm").submit(function() {
		var bool = true;//表示校验通过
		if(!validateLoginname()) {
			bool = false;
		}
		if(!validateLoginpass()) {
			bool = false;
		}
		if(!validateReloginpass()) {
			bool = false;
		}
		if(!validateEmail()) {
			bool = false;
		}
		if(!validateVerifyCode()) {
			bool = false;
		}

		return bool;
	});
});



/*
 * 输入框未输入校验，确认按钮置灰
 */





function buttonGrey(){
	var loginnameid = "loginname";
	var loginpassid = "loginpass";
	var reloginpassid = "reloginpass";
	var verifycodeid = "verifyCode";
	var value1 = $("#" + loginnameid).val();
	var value2 = $("#" + loginpassid).val();
	var value3 = $("#" + reloginpassid).val();
	var value4 = $("#" + verifycodeid).val();
	if(value1 && value2 && value3 && value4){
		$("#submit").attr("disabled",false);
	}else {
		$("#submit").attr("disabled",true);
	}
}

/*
 * 用户、管理员注册登录名校验方法
 */
function validateLoginname() {
	var id = "loginname";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("用户名不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 || value.length > 20) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("用户名长度必须在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		return false;
		
	}
	/*
	 * 3. 非法字符校验
	 */
			var arr = /^\w+$/;
			if(!arr.exec(value))
            {                
                $("#" + id + "Error").text("用户名只能由字母数字和下划线组成！");
        		showError($("#" + id + "Error"));
            }
    return true;

	
	
	/*
	 * 3. 是否注册校验
	 	*/

	$.ajax({
		url:"<%=request.getContextPath()  %>/register",//要请求的servlet
		data:{method:"ajaxValidateLoginname", loginname:value},//给服务器的参数
		type:"POST",
		dataType:"json",
		async:true,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		cache:false,
		success:function(result) {
			if(!result) {//如果校验失败
				$("#" + id + "Error").text("用户名已被注册！");
				showError($("#" + id + "Error"));
				return false;
			}
		}
	});

}	
	
/*
 * 管理员注册密码校验方法
 */
function validatePassword() {
	var id = "password";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 || value.length > 20) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码长度必须在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 3. 非法字符校验
	 */
		var arr = /^\w+$/;
		if(!arr.exec(value))
	    {                
	        $("#" + id + "Error").text("密码只能由字母数字和下划线组成！");
			showError($("#" + id + "Error"));
	    }
		return true;
		/*var arr=/^(?=.*\d)(?=.*[a-zA-Z])(?=.*[+-*#])[\da-zA-Z+-*#]{3,20}$/;
		if(!arr.exec(value))
	    {                
	        $("#" + id + "Error").text("密码只能由字母数字和下划线组成！");
			showError($("#" + id + "Error"));
	    }
		return true;*/
	}

/*
 * 登录密码校验方法
 */
function validateLoginpass() {
	var id = "loginpass";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 3 || value.length > 20) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("密码长度必须在3 ~ 20之间！");
		showError($("#" + id + "Error"));
		false;
	}
	/*
	 * 3. 非法字符校验
	 */
		var arr = /^\w+$/;
		if(!arr.exec(value))
		{                
			$("#" + id + "Error").text("密码只能由字母数字和下划线组成！");
			showError($("#" + id + "Error"));
		}
		return true;	
	}

/*
 * 确认密码校验方法
 */
function validateReloginpass() {
	var id = "reloginpass";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("确认密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 两次输入是否一致校验
	 */
	if(value != $("#loginpass").val())
	{
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("两次输入不一致！");
		showError($("#" + id + "Error"));
		false;
	}
	return true;	
}

/*
 * 企业机构代码校验
 */
function validateCompanyId() {
	var id = "companyId";
	var value = $("#" + id).val();//获取输入框内容
    var reg = /^[A-Za-z0-9]{18}$/;
	
	
	if(reg.test(value)) {
		$("#submit").attr("disabled",false);
	}else{
		$("#" + id + "Error").text("输入18位数字或字符!");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		 return false;
	}
	/*
	 * 1. 非空校验
	 */
	
	
	if(!value) {
		$("#" + id + "Error").text("机构代码不为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	return true;	
}


/*
 * 企业名称校验
 */
function validateCompanyName() {
	var id = "companyName";
	var value = $("#" + id).val();//获取输入框内容
	value1=/^[\u4E00-\u9FA5A-Za-z0-9]{3,20}$/;
	//alert(value);
	/*
	 * 1. 非空校验
	 */
	if(value1.test(value)){
		$("#submit").attr("disabled",false);
		
	}else{
		$("#submit").attr("disabled",true);
		$("#" + id + "Error").text("请输入正确的格式！");
		showError($("#" + id + "Error"));
		return false;
	}
	
	if(value) {
			
			/*
			 * 2. 长度校验
			 */
			if(value.length < 3 || value.length > 20) {
				
				/*
				 * 获取对应的label
				 * 添加错误信息
				 * 显示label
				 */
				$("#" + id + "Error").text("长度必须在3~20之间！");
				showError($("#" + id + "Error"));
				return false;
			}
		}else
			{
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("企业名称不能为空！");
			
			showError($("#" + id + "Error"));
			return false;
			}
	
		return true;	
}

/*
 * 姓名校验
 */
function validateUsername() {
	var id = "username";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(value) {
		
		/*
		 * 2. 长度校验
		 */
		if(value.length < 2 || value.length > 10) {
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("长度必须在2 ~ 10之间！");
			showError($("#" + id + "Error"));
			false;
		}
	}else
		{
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("姓名不能为空！");
		showError($("#" + id + "Error"));
		false;
		}
	
	return true;	
}

//财务电话校验
function validateAccountantName() {
	var id = "accountantName";
	var value = $("#" + id).val();//获取输入框内容
	value6=/^[\u4e00-\u9fa5]{2,10}$/;
	if(value6.test(value)){
		$("#submit").attr("disabled",false);
	}else{
		$("#submit").attr("disabled",true);
		$("#" + id + "Error").text("请输入正确的格式！");
		showError($("#" + id + "Error"));
		 return false;
	}
	if(value) {
		
		/*
		 * 2. 长度校验
		 */
		
		if(value.length < 2 || value.length > 10) {
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("长度必须在2~10之间！");
			showError($("#" + id + "Error"));
			return false;
		}
	}else
		{
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("姓名不能为空！");
		showError($("#" + id + "Error"));
		return false;
		}
	
	return true;	
}


/*
 * 法人校验
 */
function validateLegalPerson() {
	var id = "legalPerson";
	var value = $("#" + id).val();//获取输入框内容
	value2=/^[\u4e00-\u9fa5]{2,10}$/;
	//alert(value);
	/*·
	 * 1. 非空校验
	 */
	if(value2.test(value)){
		$("#submit").attr("disabled",false);
	}else{
		$("#submit").attr("disabled",true);
		$("#" + id + "Error").text("输入正确的格式！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("法人不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length < 2 || value.length > 10) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("长度必须在2 ~ 10之间！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;	
}
 
 //身份证校验
 function validateLegalPersonId() {
		var id = "legalPersonId";
		var value = $("#" + id).val();//获取输入框内容
		var reg = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;

		//alert(value);
		//* 1. 非空校验
		 //*

		if(reg.test(value) === false) {
			$("#" + id + "Error").text("身份证格式错误！");
			$("#submit").attr("disabled",true);
			showError($("#" + id + "Error"));
			return false;
		}else{
			$("#submit").attr("disabled",false);


		}

		// * 1. 非空校验

		if(!value) {

		//	 * 获取对应的label
		//	 * 添加错误信息
		//	 * 显示label

			$("#" + id + "Error").text("身份证不能为空！");
			showError($("#" + id + "Error"));
			return false;
		}

		// * 2. 长度校验

		if(value.length != 18) {

			// * 获取对应的label
			// * 添加错误信息
			 //* 显示label

			$("#" + id + "Error").text("身份证为18位！");
			showError($("#" + id + "Error"));
			false;
		}

		return true;	
	}

/*
 * 联系方式校验
 */
function validatePhoneNumber() {
	var id = "phoneNumber";
	var value = $("#" + id).val();//获取输入框内容
	var reg = /^((0\d{2,3}-\d{7,8})|(\d{8,11}))$/;


	if(reg.test(value)) {
		$("#submit").attr("disabled",false);
	}else{
		$("#" + id + "Error").text("请输入正确的固话或手机");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;

	}
	/*
	 * 1. 非空校验
	 */

	if(!value) {
		$("#" + id + "Error").text("联系方式不能为空");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		false;
	}
	return true;	
}

//财务电话校验
function validatePhone(){
	var id = "phone";
	var value = $("#" + id).val();//获取输入框内容
	var reg = /^\d{7,8}$/;
	if(reg.test(value)) {
		$("#submit").attr("disabled",false);
	}else{
		$("#" + id + "Error").text("请输入正确的座机号码！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 1. 非空校验
	 */
	
	
	if(!value) {
		$("#" + id + "Error").text("联系方式不能为空");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	return true;	
}



/*
 * 银行账户校验
 */
function validateBankAccount(){
	var id = "bankAccount";
	var value = $("#" + id).val();//获取输入框内容
	var reg=/^\d{18}$/;
	/*
	 * 1. 非空校验
	 */
	if(reg.test(value)){
		$("#submit").attr("disabled",false);
	}else{
		$("#" + id + "Error").text("请输入18位数字！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	
	
	if(!value) {
		$("#" + id + "Error").text("银行账户不能为空");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	return true;	
}

/*
 * 开户银行校验
 */
function validateOpenBank(){
	var id = "openBank";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
    */
	var reg=/^[\u4e00-\u9fa5]{2,10}$/;
	if(!value){
		$("#" + id + "Error").text("行开户银不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	if(reg.test(value)){
		$("#submit").attr("disabled",false);
		return true;
	}else{
		$("#" + id + "Error").text("开户银行为汉字");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	return true;	
} 

/*
 * 营业执照ma校验
 */
function validateOpenLicenseId() {
	var id = "openLicenseId";
	var value = $("#" + id).val();//获取输入框内容
	var reg=/^\d{13}$/;
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("营业执照不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	if(reg.test(value)){
		$("#submit").attr("disabled",false);
	}else{
		$("#" + id + "Error").text("营业执照为13位数字！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	
	
	return true;	
}

/*
 * 税务登记号校验
 */

function validateTaxRegisterId() {
	var id = "taxRegisterId";
	var value = $("#" + id).val();//获取输入框内容
	var reg=/^\d{13}$/;
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("税务登记证不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	if(reg.test(value)){
		$("#submit").attr("disabled",false);
	}else{
		$("#" + id + "Error").text("税务登记为13位数字！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	
	return true;	
}

	/*
	 * 公司Email校验方法
	 */

	function validateCompanyEmail()
	{
		var id = "companyEmail";
		var value = $("#" + id).val();//获取输入框内容
		/*
		 * 1. 非空校验
		 */
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if(!value) {
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("Email不能为空！");
			$("#submit").attr("disabled",true);
			showError($("#" + id + "Error"));
			return false;
		}
		if(reg.test(value)){
			$("#submit").attr("disabled",false);
		}else{
			$("#" + id + "Error").text("请输入正确的格式！");
			$("#submit").attr("disabled",true);
			showError($("#" + id + "Error"));
			return false;
		}
		/*
		 * 2. Email格式校验
		 */
		/*if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.text(value)) {
			
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 
			$("#" + id + "Error").text("错误的Email格式！");
			showError($("#" + id + "Error"));
			false;
		}*/
		return true;
	}
	
	/*
	 * Email校验方法
	 */
   function validateEmail()
   {
		var id = "email";
		var value = $("#" + id).val();//获取输入框内容
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		/*
		 * 1. 非空校验
		 */
		if(!value) {
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("Email不能为空！");
			$("#submit").attr("disabled",true);
			showError($("#" + id + "Error"));
			return false;
		}
		if(reg.test(value)){
			$("#submit").attr("disabled",false);
		}else{
			$("#" + id + "Error").text("请输入正确的格式！");
			$("#submit").attr("disabled",true);
			showError($("#" + id + "Error"));
			return false;
		}
		return true;
   }
	/*
	 * 3. 是否注册校验
	 
	$.ajax({
		url:"<%=request.getContextPath()  %>/register",//要请求的servlet
		data:{method:"ajaxValidateEmail", email:value},//给服务器的参数
		type:"POST",
		dataType:"json",
		async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		cache:false,
		success:function(result) {
			if(!result) {//如果校验失败
				$("#" + id + "Error").text("Email已被注册！");
				showError($("#" + id + "Error"));
				return false;
			}
		}
	});
	*/	



/*
* 开户银行校验
*/
function validateAccountName() {
	var id = "accountName";
	var value = $("#" + id).val();//获取输入框内容
	
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("开户银行不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}else{
		$("#submit").attr("disabled",false);
	}
}

/*
* 传真校验
*/
function validateCompanyFax() {
	var id = "companyFax";
	var value = $("#" + id).val();//获取输入框内容
	var reg= /^\d{8}$/;
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("传真不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	if(!reg.test(value)){
		$("#" + id + "Error").text("请输入八位传真号！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;		
	}
	return true;
}

/*
* 邮编校验
*/
function validatePostalCode() 
{
	var id = "postalCode";
	var value = $("#" + id).val();//获取输入框内容
	var reg= /^\d{6}$/;
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("邮编不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
		/*
		 * 2. 长度校验
		 */
		if(!reg.test(value)) 
		{
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("邮政编码为6位数字！");
			$("#submit").attr("disabled",true);
			showError($("#" + id + "Error"));
			return false;
		}
		return true;
}

/*
* 经营许可证校验
*/
function validateBussionLicense()
{
	var id = "bussionLicense";
	var value = $("#" + id).val();//获取输入框内容
	var reg=/^\d{15}$/;

	/*
	 * 1. 非空校验
	 */
	if(!value)
	{
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("经营许可证不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	if(reg.test(value)){
		$("#submit").attr("disabled",false);
	}else{
		$("#" + id + "Error").text("请输入15位数字！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}

/*
 * 公司简介校验
 */
function validateCompanyProfile() {
	var id = "companyProfile";
	var value = $("#" + id).val();//获取输入框内容
	if (value.length<=50 || value.length >= 300)
	{
		$("#" + id + "Error").text("公司简介字数应该在50-300之间！");
		$("#submit").attr("disabled", true);
		showError($("#" + id + "Error"));
		return false;
	}
	$("#submit").attr("disabled", false);
	return true;
}



function validateCompanyAddress() 
{
	var id = "companyAddress";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) 
	{
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("注册地址不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	if(value>=30){
		$("#" + id + "Error").text("注册地址不能超过30位！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;		
	}
	return true;	
}
//注册资金校验

function validateRegisterMoney() 
{
	var id = "registerMoney";
	var value = $("#" + id).val();//获取输入框内容
	var reg = /^([1-9]\d{0,12}|0)(\.\d{1,2})?$/;
	/*
	 * 1. 非空校验
	 */
		
	if(!value) 
	{
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("注册资金不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	else if(!reg.exec(value))
	{
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("资金格式错误！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	
	return true;	
}


/*
* 商品存放地校验
*/
function validateGoodsAddress()
{
	var id = "goodsAddress";
	var value = $("#" + id).val();//获取输入框内容
	if (value.length <=0 || value.length >= 20 ) {
		$("#" + id + "Error").text("煤源字数在1-20之间！");
		$("#submit").attr("disabled", true);
		showError($("#" + id + "Error"));
		return false;
	}
	$("#submit").attr("disabled", false);
	return true;
}


/*
* 运输保障方式校验
*/
function validateTransportStyle() 
{
	var id = "transportStyle";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) 
	{
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("运输方式不能为空！");
		$("#submit").attr("disabled",true);
		showError($("#" + id + "Error"));
		return false;
	}
	return true;	
}

/*
* 运输保障方式校验
*/
// function validateTransportStyle()
// {
// 	var id = "transportStyle";
// 	var value = $("#" + id).val();//获取输入框内容
// 	/*
// 	 * 1. 非空校验
// 	 */
// 	if(!value)
// 	{
// 		/*
// 		 * 获取对应的label
// 		 * 添加错误信息
// 		 * 显示label
// 		 */
// 		$("#" + id + "Error").text("运输方式不能为空！");
// 		$("#submit").attr("disabled",true);
// 		showError($("#" + id + "Error"));
// 		return false;
// 	}
// 	return true;
// }


//营业执照校验
function validateUpLoadFile() {
	var id = "upLoadFile";
	var value = $("#" + id).val();
	if(!value) {
		$("#submit").attr("disabled",false);
		return true;
	}
	return true;
}

 //税务登记证上传校验
function validateTaxRegisterCodePath()
{
	var id = "taxRegisterCodePath";
	var value = $("#" + id).val();
	if(!value) {
		$("#submit").attr("disabled",false);
		return true;
	}
	return true;
}

//组织机构代码证上传校验
function validateCompanyCodePath()
{
	var id = "companyCodePath";
	var value = $("#" + id).val();
	if(!value) {
		$("#submit").attr("disabled",false);

		return true;
	}
	return true;
}

//开户许可证上传校验
function validateBankAccountCodePath()
{
	var id = "bankAccountCodePath";
	var value = $("#" + id).val();
	if(!value) {
		$("#submit").attr("disabled",false);
		return true;
	}
	return true;
}

//法人身份证上传校验
function validateLegalPersonCodePath()
{
	var id = "legalPersonCodePath";
	var value = $("#" + id).val();
	if(!value) {
		$("#submit").attr("disabled",false);
		return true;
	}
	return true;
}

//经营许可证上传校验
function validateBussionLicenseCodePath()
{
	var id = "bussionLicenseCodePath";
	var value = $("#" + id).val();
	if(!value) {
		$("#submit").attr("disabled",false);

		return true;
	}
	return true;
}

/*
 * 验证码校验方法
 */
function validateVerifyCode() {
	var id = "verifyCode";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("验证码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	/*
	 * 2. 长度校验
	 */
	if(value.length != 4) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("错误的验证码！");
		showError($("#" + id + "Error"));
		false;
	}

	// * 3. 是否正确

	$.ajax({
		url:"<%=request.getContextPath()  %>/register",//要请求的servlet
		data:{method:"ajaxValidateVerifyCode", verifyCode:value},//给服务器的参数
		type:"POST",
		dataType:"json",
		async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		cache:false,
		success:function(result) {
			if(!result) {//如果校验失败
				$("#" + id + "Error").text("验证码错误！");
				showError($("#" + id + "Error"));
				return false;
			}
		}

	});

	return true;
}

/*
 * 判断当前元素是否存在内容，如果存在显示，不存在不显示！
 */
function showError(ele) {
	var text = ele.text();//获取元素的内容
	if(!text) {//如果没有内容
		ele.css("display", "none");//隐藏元素
	} else {//如果有内容
		ele.css("display", "");//显示元素
	}
}

/*
 * 换一张验证码
 */
function _hyz() {
	/*
	 * 1. 获取<img>元素
	 * 2. 重新设置它的src
	 * 3. 使用毫秒来添加参数
	 */
	$("#imgVerifyCode").attr("src", "/icollege_gdce/verifyCode?a=" + new Date().getTime());
}

/*
 * 供应数量校验方法
 */
var rsQuantity = true;
function validateInputQuantity() {
	var id = "inputQuantity";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("供应数量不能为空！");
		showError($("#" + id + "Error"));
		rsQuantity = false;
		return ;
	}else{
		rsQuantity = true;
	}
	/*
	 * 2. 长度校验
	 */
	if(value <= 0 ) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("供应数量必须大于0！");
		showError($("#" + id + "Error"));
		rsQuantity = false;
		return ;
	}else{
		rsQuantity = true;
	}

	var arr = /^([0-9]*)$|^([0-9]*)(\.[0-9]*)$/;
	if(!arr.exec(value))
    {
        $("#" + id + "Error").text("供应数量只能由数字组成！");
		showError($("#" + id + "Error"));
		rsQuantity = false;
		return ;
    }else{
		rsQuantity = true;
	}
	var arr=/^0(\.[0-9]{1,2})$|^([1-9][0-9]{0,2})(\.[0-9]{1,2})$|^([1-9][0-9]{0,2})$/;
	if(!arr.exec(value))
    {
        $("#" + id + "Error").text("大于1时不能以0开头并且小数点前不超过3位后不超过2位！");
		showError($("#" + id + "Error"));
		rsQuantity = false;
		return ;
    }else{
		rsQuantity = true;
	}
}

/*
 * 热值校验方法
 */
var rsLowPower = true;
function validateInputLowPower() {
	var id = "inputLowPower";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("热值不能为空！");
		showError($("#" + id + "Error"));
		rsLowPower = false;
		return ;
	}else{
		rsLowPower = true;
	}
	/*
	 * 2. 长度校验
	 */
	if(value<= 0 ) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("热值数量必须大于0！");
		showError($("#" + id + "Error"));
		rsLowPower = false;
	}else{
		rsLowPower = true;
	}
	var arr = /^[1-9][0-9]{0,4}$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("热值数量不能以0开头，只能由正数组成且不超过5位！");
		showError($("#" + id + "Error"));
		rsLowPower = false;
		return ;
    }else{
		rsLowPower = true;
	}
}

/*
* 原煤单价校验方法
*/
var rsPrice = true;
function validateInputPrice()
{
	var id = "inputPrice";
	var value = $("#" + id).val();
	if (!value)
	{
		$("#" + id +"Error").text("原煤单价不能为空！");
		showError($("#" + id + "Error"));
		rsPrice = false;
		return ;
	}else{
		rsPrice = true;
	}
	if (value<=0)
	{
		$("#" + id + "Error").text("原煤单价必须大于0！");
		showError($("#" + id + "Error"));
		rsPrice = false;
		return ;
	}else{
		rsPrice = true;
	}
	var arr = /^([0-9]*)$|^([0-9]*)(\.[0-9]*)$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("原煤单价只能由数字组成！");
		showError($("#" + id + "Error"));
		rsPrice = false;
		return ;
    }else{
		rsPrice = true;
	}
	var arr=/^0(\.[0-9]{1,2})$|^([1-9][0-9]{0,2})(\.[0-9]{1,2})$|^([1-9][0-9]{0,2})$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("大于1时不能以0开头并且小数点前不超过3位后不超过2位！");
		showError($("#" + id + "Error"));
		rsPrice = false;
		return ;
    }else{
		rsPrice = true;
	}
}

/*
 * 全硫校验方法
 */
var rsFullSulfur = true;
function validateInputFullSulfur() {
	var id = "inputFullSulfur";
	var value = $("#" + id).val();//获取输入框内容
	/*
	 * 1. 非空校验
	 */
	if(!value) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("全硫不能为空！");
		showError($("#" + id + "Error"));
		rsFullSulfur = false;
		return ;
	}else{
		rsFullSulfur = true;
	}
	/*
	 * 2. 长度校验
	 */
	if(value <=0 || value>100) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("全硫值必须大于0且不能超过100！");
		showError($("#" + id + "Error"));
		rsFullSulfur = false;
		return ;
	}else{
		rsFullSulfur = true;
	}
	
	var arr = /^([0-9]*)$|^([0-9]*)(\.[0-9]*)$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("全硫值只能由数字组成！");
		showError($("#" + id + "Error"));
		rsFullSulfur = false;
		return ;
    }else{
		rsFullSulfur = true;
	}
	var arr=/^([1-9][0-9]{0,1})$|^0(\.[0-9]{1,2})$|^([1-9][0-9]{0,1})(\.[0-9]{1,2})$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("大于1时不能以0开头并且小数点前不超过2位后不超过2位！");
		showError($("#" + id + "Error"));
		rsFullSulfur = false;
		return ;
    }else{
		rsFullSulfur = true;
	}
    
}

/*
 * 产地校验
 */
var rsSrcAddress = true;
function validateInputSrcAddress()
{
	var id ="inputSrcAddress";
	var value = $("#" + id).val();
	if(!value)
	{
		$("#" + id + "Error").text("产地不能为空！");
		showError($("#" + id + "Error"));
		rsSrcAddress = false;
		return ;
	}else{
		rsSrcAddress = true;
	}
	var arr=/^[\u4e00-\u9fa5A-Za-z]{0,}$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("产地只能由汉字或字母组成！");
		showError($("#" + id + "Error"));
		rsSrcAddress = false;
		return ;
    }else{
		rsSrcAddress = true;
	}
}

/*
 * 运费单价校验
 */
var rsCarriage = true;
function validateInputCarriage()
{
	var id = "inputCarriage";
	var value = $("#" + id).val();
	if (!value)
	{
		$("#" + id +"Error").text("运费单价不能为空！");
		showError($("#" + id + "Error"));
		rsCarriage = false;
		return ;
	}else{
		rsCarriage = true;
	}
	if (value<=0)
	{
		$("#" + id + "Error").text("运费单价必须大于0！");
		showError($("#" + id + "Error"));
		rsCarriage = false;
		return ;
	}else{
		rsCarriage = true;
	}
	var arr = /^([0-9]*)$|^([0-9]*)(\.[0-9]*)$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("运费单价只能由数字组成！");
		showError($("#" + id + "Error"));
		rsCarriage = false;
		return ;
    }else{
		rsCarriage = true;
	}
	var arr=/^0(\.[0-9]{1,2})$|^([1-9][0-9]{0,2})(\.[0-9]{1,2})$|^([1-9][0-9]{0,2})$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("大于1时不能以0开头并且小数点前不超过3位后不超过2位！");
		showError($("#" + id + "Error"));
		rsCarriage = false;
		return ;
    }else{
		rsCarriage = true;
	}
	
}

/*
 * 挥发分校验
 */
var rsVolatiles = true;
function validateInputVolatiles()
{
	var id = "inputVolatiles";
	var value = $("#" + id).val();
	if (!value)
	{
		$("#" + id +"Error").text("挥发分不能为空！");
		showError($("#" + id + "Error"));
		rsVolatiles = false;
		return ;
	}else{
		rsVolatiles = true;
	}
	if(value <=0 || value>100) {
		/*
		 * 获取对应的label
		 * 添加错误信息
		 * 显示label
		 */
		$("#" + id + "Error").text("挥发分必须大于0且不能超过100！");
		showError($("#" + id + "Error"));
		rsVolatiles = false;
		return ;
	}else{
		rsVolatiles = true;
	}
	var arr = /^[1-9][0-9]{0,1}\-[1-9][0-9]{0,1}$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("挥发分格式为30-40！");
		showError($("#" + id + "Error"));
		rsVolatiles = false;
		return ;
    }
	var ar=value.split("-");
	if(ar[0]>ar[1]){
		$("#" + id + "Error").text("挥发分“-”前面的数必须小于等于“-”后面的数！");
		showError($("#" + id + "Error"));
		rsVolatiles = false;
		return ;
	}else{
		rsVolatiles = true;
	}
	var ar=value.split("-");
	var intAr=[];
	ar.forEach(function(data,index,arr){
		intAr.push(+data);
	});
	if(intAr[0]>intAr[1]){
		$("#" + id + "Error").text("挥发分“-”前面的数必须小于等于“-”后面的数！");
		showError($("#" + id + "Error"));
		rsVolatiles = false;
		return ;
	}else{
		rsVolatiles = true;
	}
}

/*
 * 发货港口校验
 */
var rsPortAddress = true;
function validateInputPortAddress()
{
	var id = "inputPortAddress";
	var value = $("#" + id).val();
	if (!value)
	{
		$("#" + id +"Error").text("发货港口不能为空！");
		showError($("#" + id + "Error"));
		rsPortAddress = false;
		return ;
	}else{
		rsPortAddress = true;
	}
	var arr=/^[\u4e00-\u9fa5A-Za-z]{0,}$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("发货港口只能由汉字或字母组成！");
		showError($("#" + id + "Error"));
		rsPortAddress = false;
		return ;
    }else{
		rsPortAddress = true;
	}
}

/*
 * 空干基灰分校验
 */
var rsDryPowder = true;
function validateInputDryPowder()
{
	var id = "inputDryPowder";
	var value = $("#" + id).val();
	if (!value)
	{
		$("#" + id +"Error").text("空干基灰分不能为空！");
		showError($("#" + id + "Error"));
		rsDryPowder = false;
		return ;
	}else{
		rsDryPowder = true;
	}
	if (value<=0)
	{
		$("#" + id + "Error").text("空干基灰分必须大于0！");
		showError($("#" + id + "Error"));
		rsDryPowder = false;
		return ;
	}else{
		rsDryPowder = true;
	}
	var arr = /^([0-9]*)$|^([0-9]*)(\.[0-9]*)$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("空干基灰分只能由数字组成！");
		showError($("#" + id + "Error"));
		rsDryPowder = false;
		return ;
    }else{
    	rsDryPowder = true;
	}
	var arr=/^0(\.[0-9]{1,2})$|^([1-9][0-9]{0,2})(\.[0-9]{1,2})$|^([1-9][0-9]{0,2})$/;
	if(!arr.exec(value))
    {                
        $("#" + id + "Error").text("大于1时不能以0开头并且小数点前不超过3位后不超过2位！");
		showError($("#" + id + "Error"));
		rsDryPowder = false;
		return ;
    }else{
    	rsDryPowder = true;
	}
}

	/*
	 * 全水分校验
	 */
var rsFullMoisture = true;
	function validateInputFullMoisture()
	{
		var id = "inputFullMoisture";
		var value = $("#" + id).val();
		if (!value)
		{
			$("#" + id +"Error").text("全水分不能为空！");
			showError($("#" + id + "Error"));
			rsFullMoisture = false;
			return ;
		}else{
			rsFullMoisture = true;
		}
		if(value <=0 || value>100) {
			/*
			 * 获取对应的label
			 * 添加错误信息
			 * 显示label
			 */
			$("#" + id + "Error").text("全水分必须大于0且不能超过100！");
			showError($("#" + id + "Error"));
			rsFullMoisture = false;
			return ;
		}else{
			rsFullMoisture = true;
		}
		var arr = /^([0-9]*)$|^([0-9]*)(\.[0-9]*)$/;
		if(!arr.exec(value))
	    {                
	        $("#" + id + "Error").text("全水分只能由数字组成！");
			showError($("#" + id + "Error"));
			rsFullMoisture = false;
			return ;
	    }else{
			rsFullMoisture = true;
		}
		var arr=/^([1-9][0-9]{0,1})$|^0(\.[0-9]{1,2})$|^([1-9][0-9]{0,1})(\.[0-9]{1,2})$/;
		if(!arr.exec(value))
	    {                
	        $("#" + id + "Error").text("大于1时不能以0开头并且小数点前不超过2位后不超过2位！");
			showError($("#" + id + "Error"));
			rsFullMoisture = false;
			return ;
	    }else{
			rsFullMoisture = true;
		}
	}
		
	function validProduct()
	{
		alert("发布商品成功");
		return true;
	}

	

