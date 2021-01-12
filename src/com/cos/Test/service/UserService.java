package com.cos.Test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.cos.Test.config.DB;
import com.cos.Test.domain.user.User;
import com.cos.Test.domain.user.UserDao;
import com.cos.Test.domain.user.dto.JoinReqDto;
import com.cos.Test.domain.user.dto.LoginReqDto;
import com.mysql.cj.xdevapi.PreparableStatement;

public class UserService {

	private UserDao userDao;

	public UserService() {
		userDao = new UserDao();
	}

	public int 회원가입(JoinReqDto dto) {
		int result = userDao.save(dto);
		return result;
	}

	public User 로그인(LoginReqDto dto) {
		return userDao.findByUsernameAndPassword(dto);
	}

	public int 유저네임중복체크(String username) {
		int result = userDao.findByUsername(username);
		return result;
	}
	
	public List<User> 글목록보기(int page){
		return userDao.findAll(page);
	}
	
	public int 글개수() {
		return userDao.count();
	}
	
	public int 회원삭제(int id) {
		return userDao.deleteById(id);
	}
}
