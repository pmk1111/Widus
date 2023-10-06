package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.User;
import com.naver.myhome.mybatis.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	private UserMapper dao;
	
	@Autowired
	public UserServiceImpl(UserMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<User> finduser(String company_id) {
		// TODO Auto-generated method stub
		return dao.finduser(company_id);
	}

//	@Override
//	public int isId(String id, String pass) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int insert(User user) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int isId(String id) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public User user_info(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void delete(String id) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public int update(User m) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<User> getSearchList(int index, String search_word, int page, int limit) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int getSearchListCount(int index, String search_word) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
