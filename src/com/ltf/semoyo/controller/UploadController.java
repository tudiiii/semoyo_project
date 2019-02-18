package com.ltf.semoyo.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ltf.semoyo.util.FileRenameUtil;
import com.ltf.semoyo.util.ResizeImageUtil;

// 은서 : UploadController 자체 추가
@Controller
public class UploadController {
	private FileRenameUtil fileRenameUtil;
	   
	   public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
	      this.fileRenameUtil = fileRenameUtil;
	   }
	   
	   private ResizeImageUtil resizeImageUtil;
	   
	   public void setResizeImageUtil(ResizeImageUtil resizeImageUtil) {
	      this.resizeImageUtil = resizeImageUtil;
	   }

	   @RequestMapping(value = "/ajax/upload", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String uploadImage(HttpServletRequest request, String type, MultipartFile uploadImg) {

	      ServletContext sc = request.getServletContext();

	      String uploadPath = sc.getRealPath("upload");
	      //자르는 사진 폴더
	      String imgPath = sc.getRealPath("img");

//	      System.out.println(uploadPath);

//	      System.out.println(uploadImg.getOriginalFilename());

	      File file = new File(uploadPath + File.separator + uploadImg.getOriginalFilename());

	      file = fileRenameUtil.rename(file);

	      String src = "/";

	      try {

	         uploadImg.transferTo(file);

	         resizeImageUtil.resize(file.getAbsolutePath(), imgPath + File.separator + file.getName(), 180);

	         src += file.getName();

	         return "{\"src\":\"/img" + src + "\"}";

	      } catch (Exception e) {
	         e.printStackTrace();

	         return "에러";
	      }

	   }
	
	

}
