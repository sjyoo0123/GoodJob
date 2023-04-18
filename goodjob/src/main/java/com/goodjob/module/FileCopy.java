package com.goodjob.module;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileCopy {
	public void copyInto(String category, MultipartFile file,HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("/"+category);
		try {
			byte bytes[] = file.getBytes();
			File outfile = new File(path+"/" + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(outfile);
			fos.write(bytes);// 복사
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
