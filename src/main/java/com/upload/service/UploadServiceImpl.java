package com.upload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.upload.dao.UploadDao;
import com.upload.model.UploadModel;

@Service("uploadService")
public class UploadServiceImpl implements UploadService{

	@Autowired UploadDao uploadDao;

	public void insertUpload(UploadModel uploadModel) {
		
		uploadDao.insertUpload(uploadModel);
	}

	public List<UploadModel> viewAll() {
		
		return uploadDao.viewAll();
	}

	public String getData(int id) {
		
		return uploadDao.getData(id);
	}

	public int getNoOfRecords() {
		
		return uploadDao.getNoOfRecords();
	}

}
