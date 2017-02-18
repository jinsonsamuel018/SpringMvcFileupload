package com.upload.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.upload.model.UploadModel;
@Repository("uploadDao")
public class UploadDaoImpl implements UploadDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private int noOfRecords;
	
	@Transactional(rollbackFor = Exception.class)
	public void insertUpload(UploadModel uploadModel) {
		try{
			
			sessionFactory.getCurrentSession().save(uploadModel);
			
		}catch(Exception e){
			e.printStackTrace();			
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@Transactional(rollbackFor = Exception.class)
	public List<UploadModel> viewAll() {
		List<UploadModel> list = new ArrayList<UploadModel>();
		try{
			Session session = sessionFactory.openSession();
			String hql = "FROM UploadModel";
			Query query = session.createQuery(hql);			
			list = query.list();				
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Transactional(rollbackFor = Exception.class)
	public String getData(int id) {
		
		String data = "";
		
		try{
			Session session = sessionFactory.openSession();
			String hql = "SELECT U.image FROM UploadModel U WHERE U.uploadId = :id";
			Query query = session.createQuery(hql);
			query.setParameter("id",id);
			List list = query.list();
			
			Iterator<String> itr = list.iterator();
			while(itr.hasNext()){
				data = itr.next();
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("kk "+data);
		return data;
	}

	public int getNoOfRecords() {
		System.out.println(noOfRecords);
		return noOfRecords;
	}

}
