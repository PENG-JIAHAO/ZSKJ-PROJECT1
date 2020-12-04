package com.isscollege.gdce.util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.image.BufferedImage;

/**
 * Servlet implementation class VerifyCodeController
 */
@WebServlet("/verifyCode")
public class VerifyCodeUtil extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		VerifyCode vc = new VerifyCode();
		// 获取一次性验证码图片
		BufferedImage image = vc.getImage();
		// 把图片写到指定流中
		VerifyCode.output(image, response.getOutputStream());
		// 把文本保存到session中，为LoginServlet验证做准备
		request.getSession().setAttribute("vCode", vc.getText());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}
}
