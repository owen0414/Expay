package com.rest.demo.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.rest.demo.entity.Book;

@Repository
public class BookDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Book> getAllBook() throws Exception{
		String sql = "SELECT [isbn],[name],[author],[publish_year] from Esuntraining.dbo.BookRest";
		
		List<Book> book = new ArrayList<Book>();
		
		book = jdbcTemplate.query(sql, new BeanPropertyRowMapper(Book.class));
		
		return book;
	}

	public boolean chkBook(String isbn) throws Exception{
		
		String sql = "SELECT COUNT([isbn]) FROM Esuntraining.dbo.BookRest WHERE isbn = ?";
		
		if(jdbcTemplate.queryForObject(sql, Integer.class, isbn) == 0) {
			return false;
		}else {
			return true;
		}
	}
	
	public Book getBook(String isbn) throws Exception {
		String sql = "SELECT [isbn],[name],[author],[publish_year] FROM Esuntraining.dbo.BookRest WHERE isbn = ?";
		
		Book book = (Book)jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper(Book.class),isbn);
		
		return book;
	}

	public void addBook(String isbn, String name, String author, int publish_year, String create_time) {
		
		jdbcTemplate.update(
				"INSERT INTO EsunTraining.dbo.BookRest ([isbn],[name],[author],[publish_year],[create_time]) VALUES (?,?,?,?,?)",
				isbn, name, author, publish_year,create_time);
	}

	public boolean updBook(Book book,String isbn) throws Exception {
		
		String sql = "UPDATE [EsunTraining].[dbo].[BookRest] SET [name]=?,[author]=?,[publish_year]=? WHERE [isbn]=?";

		if (jdbcTemplate.update(sql, book.getName(), book.getAuthor(), book.getPublish_year(),
				isbn) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delBook(String isbn) throws Exception{
		String sql = "DELETE FROM [EsunTraining].[dbo].[BookRest] WHERE [isbn] = ? ";

		if (jdbcTemplate.update(sql, isbn) == 1) {
			return true;
		} else {
			return false;
		}
		
	}
	


}
