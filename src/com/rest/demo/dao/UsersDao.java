package com.rest.demo.dao;

import java.util.ArrayList;
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
	
	public List<Users> getAllUser() throws Exception{
		String sql = "SELECT [id],[name],[age] from Esuntraining.dbo.BookRest";
		
		List<Users> users = new ArrayList<Users>();
		
		users = jdbcTemplate.query(sql, new BeanPropertyRowMapper(Users.class));
		
		return users;
	}

	public int chkUser(int id) throws Exception{
		
		String sql = "SELECT COUNT([id]) FROM Esuntraining.dbo.BookRest WHERE id = ?";
		
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}
	
	public Users getUser(int id) throws Exception {
		String sql = "SELECT [id],[name],[age] FROM Esuntraining.dbo.BookRest WHERE id = ?";
		
		Users user = (Users)jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper(Users.class),id);
		
		return user;
	}
	
}
