package com.rest.demo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.demo.dao.UsersDao;
import com.rest.demo.entity.Users;

@Service
public class UserService {
	
	@Autowired
	private UsersDao usersDao;
	
	public List<Users> getAllUser() {
		return usersDao.getAllUser();
	}
	
}
