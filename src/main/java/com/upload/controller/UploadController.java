package com.upload.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.upload.model.UploadModel;
import com.upload.service.UploadService;

@Controller
public class UploadController {
	/*
	@Autowired
	private UploadService uploadService; */
	
		/* Function for viewing the page */
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView viewUploadPage(Map model){
		UploadModel uploadModel = new UploadModel();
		model.put("uploadModel", uploadModel);
		return new ModelAndView("upload");
	}
	
	
	private static final Logger logger = LoggerFactory
			.getLogger(UploadController.class);
	
	/* Function for validating the view page */
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/uploadValidation", method = RequestMethod.POST)
	public ModelAndView validatingUpload(@RequestParam("title") String title,
			@RequestParam("description") String description,
			@RequestParam("image") MultipartFile file,HttpServletRequest request ){
		
		Map model = new HashMap();
		if(title.length() == 0 || description.length() == 0 || file.getSize()<0 || file.isEmpty() || file.getSize()>1048000){
			model.put("errorTitle", "please insert the field");
			model.put("errorDescription", "please insert the field");
			model.put("errorUpload", "File needed");
			model.put("errorUpload", "Exceed size");
			
			return new ModelAndView("upload",model);
		}
		UploadModel uploadModel = new UploadModel();
		uploadModel.setTitle(title);
		uploadModel.setDescription(description);
		uploadModel.setImage(file.getOriginalFilename());
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String context = request.getServletContext().getRealPath("");
				String rootPath = context;
			
				System.out.println(rootPath);
				
				//String test = request.getContextPath();
				
				
				
				File dir = new File(rootPath+File.separator+"download");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + file.getOriginalFilename());
				
				System.out.println(serverFile);
				
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());
				
				//uploadService.insertUpload(uploadModel);
				
			} catch (Exception e) {
				model.put("errorFailed", "failed to upload ");
			}
		} 				
		return new ModelAndView("redirect:/upload.html");
		
	}
	/*
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView viewAll(Map model,HttpServletRequest request) throws ServletException, IOException{
		
		List<UploadModel> list = new ArrayList<UploadModel>();
		
        list = uploadService.viewAll();    
		model.put("uploadList", list);	
		
		return new ModelAndView("viewAll",model);
	}
	
	@RequestMapping(value = "/download")
	public ModelAndView viewDownload(@RequestParam("id") int id,HttpServletRequest request,
			HttpServletResponse response){
		
		String Datas = uploadService.getData(id);
		
		try{
			*//**
			 * Size of a byte buffer to read/write file
			 *//*
			
			 final int BUFFER_SIZE = 4096;
					
			*//**
			 * Path of the file to be downloaded, relative to application's directory
			 *//*
			
			//String Datas = uploadService.getData(id);			
			String filePath = "download/"+Datas;
			
			// get absolute path of the application
			ServletContext context = request.getServletContext();
			String appPath = context.getRealPath("");
			
			
			// construct the complete absolute path of the file
			String fullPath = appPath + filePath;		
			File downloadFile = new File(fullPath);
			FileInputStream inputStream = new FileInputStream(downloadFile);
			System.out.println("fullPath = " + fullPath);
			
			// get MIME type of the file
			String mimeType = context.getMimeType(fullPath);
			if (mimeType == null) {
				// set to binary type if MIME mapping not found
				mimeType = "application/octet-stream";
			}
			System.out.println("MIME type: " + mimeType);

			// set content attributes for the response
			response.setContentType(mimeType);
			response.setContentLength((int) downloadFile.length());

			// set headers for the response
			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"",
					downloadFile.getName());
			response.setHeader(headerKey, headerValue);

			// get output stream of the response
			OutputStream outStream = response.getOutputStream();

			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = -1;

			// write bytes read from the input stream into the output stream
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}

			inputStream.close();
			outStream.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return null;
		
	}*/
		
	
}
