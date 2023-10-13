package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Files;
import com.naver.myhome.mybatis.mapper.FileMapper;

@Service
public class FileServiceImpl implements FileService{
	
	private FileMapper mapper;
	
	@Autowired
	public FileServiceImpl(FileMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public List<Files> uploadFile(List<Files> files) {
		return mapper.uploadFile(files);
	}
	
	@Override
	public List<Files> getFileList(int num) {
		return mapper.getFileList(num);
	}

	@Override
	public void deleteFile(int fileId) {
		mapper.deleteFile(fileId);
		
	}

	
}