package service;

import java.io.*;
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUpload {
	
	@Autowired
	ServletContext application;
	
	public String FileUpload(MultipartFile f) throws Exception {
		
		File dir = new File(application.getRealPath("/images/profile"));
		if(!dir.exists()) {
			dir.mkdirs();
		}
		String image = f.getOriginalFilename();
		
		File dst = new File(dir, image);
		f.transferTo(dst);
		
		return image;
	}
	
}
