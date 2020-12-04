package com.isscollege.gdce.util;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownload extends HttpServlet
{
	@Value("${uploadPath}")
	private String uploadPath;

	private static final long serialVersionUID = 1L;

	@RequestMapping("/companyQualificationDown")
	private ResponseEntity<byte[]> download(HttpServletRequest request,Model model) throws IOException
	{
		String path = request.getParameter("path");
		String filePath=path.replace("%2F","\\");
		File file = new File(uploadPath, filePath);
		if (file.exists())
		{
			String fileName=file.getName();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentDispositionFormData("attachment",new String(fileName.getBytes("UTF-8"),"ISO-8859-1"));
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
					headers, HttpStatus.CREATED);
			model.addAttribute("message",1);
			return responseEntity;
		}
		model.addAttribute("message",-1);
		return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}
//	@RequestMapping("/urlpatten")
//	public String checkUrl(HttpServletRequest request){
//		String path = request.getParameter("path");
//
//		return "/companyQualificationDown";
//	}
}
