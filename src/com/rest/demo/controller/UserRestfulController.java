package com.rest.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.rest.demo.dao.UsersDao;
import com.rest.demo.entity.Users;
import com.rest.demo.service.UserService;


@RestController
@RequestMapping("/api")
public class UserRestfulController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/users")
	public List<Users> getusers(HttpServletRequest req) throws Exception{
		
		return userService.getAllUser(req);
		
	}
	
	@GetMapping("/users/{id}")
	public Users getuser(@PathVariable int id,HttpServletRequest req) throws Exception{
		
		return userService.getUser(id,req);
		
	}
	
}
