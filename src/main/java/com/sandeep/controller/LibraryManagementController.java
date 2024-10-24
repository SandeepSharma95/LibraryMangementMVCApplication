package com.sandeep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sandeep.model.Book;
import com.sandeep.model.User;
import com.sandeep.service.BookService;
import com.sandeep.service.BorrowingService;
import com.sandeep.service.UserService;

import ch.qos.logback.core.model.Model;

@Controller

public class LibraryManagementController {
    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;
    @Autowired
    private BorrowingService borrowingService;
    
    @RequestMapping(value= {"/"})
    public String homePage() {
    	return"Home.jsp";
    }
    
    @PostMapping("/addbooks")
    public String addBook(@ModelAttribute Book book ,ModelMap m) {
        String result= bookService.saveBook(book);
         m.addAttribute("res",result);
         return "addBook.jsp";
    }
    
    @GetMapping("/getbooks")
    public String getAllBooks(ModelMap m) {
         List<Book> allbooks=bookService.getAllBooks();
         m.addAttribute("books",allbooks);
         return "Viewbooks.jsp";
    }
    
    @PostMapping("/addUser")
    public String addUser(@ModelAttribute User user,ModelMap m) {
        String msg=userService.saveUser (user);
        m.addAttribute("result",msg);
        m.addAttribute("name",user.getName());

        return "Home.jsp";
    }
    @GetMapping("/users")
    public String getAllUsers(ModelMap m) {
        List<User> allUser= userService.getAllUsers();	
        m.addAttribute("user",allUser);
        return "AllUsers.jsp";
        
    }
    @PostMapping("/borrow/{bookId}")
    public String borrowBook(@PathVariable Long bookId, @RequestParam Long userId,ModelMap m) {
    	System.out.println(bookId+"and"+userId);
    	String response =borrowingService.borrowBook(bookId, userId);
        m.addAttribute("response",response);
     	return "redirect:/getbooks";
//    	return ResponseEntity.ok(response);
    }
    
    @PostMapping("/return/{bookId}")
    public String returnBook(@PathVariable Long bookId, @RequestParam Long userId,ModelMap m) {
    	String response =borrowingService.returnBook(bookId, userId);
    	  m.addAttribute("response",response);
       	return "redirect:/getbooks";
//       m.addAttribute("response",response);
//    	return "Viewbooks.jsp";

    }
    @GetMapping("/searchBook")
	public String searchBook(@RequestParam String title,ModelMap m) {
    	List<Book> book= bookService.searchBook(title);
		m.addAttribute("book",book);
		return "SearchPage.jsp";
	}
	
}