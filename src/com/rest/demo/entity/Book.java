package com.rest.demo.entity;

public class Book {
	
	private String isbn;
	private String name;
	private String author;
	private int publish_year;
	

	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getPublish_year() {
		return publish_year;
	}
	public void setPublish_year(int publish_year) {
		this.publish_year = publish_year;
	}

}
