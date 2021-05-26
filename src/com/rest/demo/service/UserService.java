package com.rest.demo.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.demo.dao.UsersDao;
import com.rest.demo.entity.Users;


@Service
public class UserService {
	
	@Autowired
	private UsersDao usersDao;
	
	public List<Users> getAllUser(HttpServletRequest req) throws Exception {
		
		List<Users> user = usersDao.getAllUser();
		
		return user;
	}

	public Users getUser(int id,HttpServletRequest req) throws Exception {
		
		Users user = new Users();
		
		int exist = usersDao.chkUser(id);

		if(exist == 1){
			user = usersDao.getUser(id);
			return user;
		}
		
		return user;

		
	}
	
}
