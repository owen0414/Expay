package com.rest.demo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rest.demo.entity.Book;
import com.rest.demo.service.BookService;

@RestController
@RequestMapping("/api")
public class BookRestController {
	
	@Autowired
	private BookService bookService;

	@GetMapping("/book")
	public List<Book> getAllBook(HttpServletRequest req) throws Exception{
		
		return bookService.getAllBook(req);
		
	}
	
	@GetMapping("/book/{isbn}")
	public Book getBook(@PathVariable String isbn,HttpServletRequest req) throws Exception{
		
		return bookService.getBook(isbn,req);
		
	}
	
	@PostMapping("/book")
	public Map<String, Object> addBook(@RequestBody Book book,HttpServletRequest req) throws Exception {
		
		return bookService.addBook(book,req);
	}
	
	@PatchMapping("/book/{isbn}")
	public Map<String, Object> editBook(@RequestBody Book book, @PathVariable String isbn,HttpServletRequest req)
			throws Exception {
		
		return bookService.editBook(book,isbn,req);
	}
	
	@DeleteMapping("/book/{isbn}")
	public Map<String, Object> delBook( @PathVariable String isbn,HttpServletRequest req)
			throws Exception {
		
		return bookService.delBook(isbn, req);
	}
	
	
}
