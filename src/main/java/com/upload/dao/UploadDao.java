package com.upload.dao;



import java.util.List;

import com.upload.model.UploadModel;

public interface UploadDao {

	public void insertUpload(UploadModel uploadModel);
	public List<UploadModel> viewAll();
	public String getData(int id);
	
	public int getNoOfRecords();
}
