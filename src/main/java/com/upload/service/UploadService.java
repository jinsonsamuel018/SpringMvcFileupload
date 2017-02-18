package com.upload.service;

import java.util.List;

import com.upload.model.UploadModel;

public interface UploadService {

	public void insertUpload(UploadModel uploadModel);

	public List<UploadModel> viewAll();

	public String getData(int id);

	public int getNoOfRecords();

}
