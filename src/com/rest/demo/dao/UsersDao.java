package com.rest.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.rest.demo.entity.Users;

@Repository
public class UsersDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Users> getAllUser() {
		String sql = "select * from Esuntraining.dbo.BookRest";
		List<Users> lstUsers = jdbcTemplate.query(sql, new BeanPropertyRowMapper(Users.class));
		return lstUsers;
	}
	
}
