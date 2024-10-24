package com.sandeep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sandeep.model.Book;
import com.sandeep.repositories.BookRepository;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepository;
    
    public String saveBook(Book book) {
       bookRepository.save(book);
       return "Book Added Sucessfully";
    }
    
    public List<Book> getAllBooks() {
        List<Book> book=bookRepository.findAll();
        return book;
    }
    
    public Book getBookById(Long id) {
        return bookRepository.findById(id).orElseThrow();
    }
    
   
    public void deleteBook(Long id) {
        bookRepository.deleteById(id);
    }
    
    public List<Book> searchBook(String  title) {
       return  bookRepository.findByTitleContainingIgnoreCase(title);
    }
}
