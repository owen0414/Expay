package com.rest.demo.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.demo.dao.BookDao;
import com.rest.demo.entity.Book;

@Service
public class BookService {
	
	@Autowired
	private BookDao bookDao;

	public List<Book> getAllBook(HttpServletRequest req) throws Exception{
	
		List<Book> book = bookDao.getAllBook();
		
		return book;
	}

	public Book getBook(String isbn, HttpServletRequest req) throws Exception{
		
		Book book = new Book();
		
		boolean bookexist = bookDao.chkBook(isbn);

		if(bookexist){
			book = bookDao.getBook(isbn);
		}
		
		return book;
	}

	public Map<String, Object> addBook(Book book,HttpServletRequest req) throws Exception {
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = df.format(new Date());
		
		String isbn = book.getIsbn();
		String name = book.getName();
		String author = book.getAuthor();
		int publish_year = book.getPublish_year();
		
		boolean bookexist = bookDao.chkBook(isbn);
		
		if(!bookexist) {
			bookDao.addBook(isbn, name, author, publish_year, date);
			// response 
			map.put("status", 200);
			map.put("message", "SUCCESS");
		}else {
			map.put("status", 400);
			map.put("message", "此本書已存在");
		}
		
		map.put("timestamp", System.currentTimeMillis());
		
		return map;
		
	}

	public Map<String, Object> editBook(Book book, HttpServletRequest req) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean bookexist = bookDao.chkBook(book.getIsbn());

		if(bookexist && bookDao.updBook(book)){
			map.put("status", 200);
			map.put("message", "SUCCESS");
		}else {
			map.put("status", 400);
			map.put("message", "修改失敗");
		}
		
		map.put("timestamp", System.currentTimeMillis());
		
		return map;
		
		
	}

	public Map<String, Object> delBook(String isbn, HttpServletRequest req) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(bookDao.delBook(isbn)) {
			map.put("status", 200);
			map.put("message", "SUCCESS");
		}else {
			map.put("status", 400);
			map.put("message", "刪除失敗");
		}
		
		map.put("timestamp", System.currentTimeMillis());
		
		return map;
	}


}
