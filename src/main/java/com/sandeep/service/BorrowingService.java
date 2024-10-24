package com.sandeep.service;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sandeep.model.Book;
import com.sandeep.model.Borrowing;
import com.sandeep.model.User;
import com.sandeep.repositories.BorrowingRepository;
import com.sandeep.service.BookService;
import com.sandeep.service.UserService;

@Service
public class BorrowingService {

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    @Autowired
    private BorrowingRepository borrowingRepository;

    public String borrowBook(Long bookId, Long userId) {
    	// Retrieve the book and user by their IDs
        Book book = bookService.getBookById(bookId);
        User user = userService.getUserById(userId);

        // Check if the book and user exist
        if (book != null && user != null) {
            // Check if the book is available for borrowing
            if (book.getStatus().equals("Available")) {
                // Update the book's status to "borrowed"
                book.setStatus("Borrowed");
                bookService.saveBook(book);

                // Create a new borrowing record
                Borrowing borrowing = new Borrowing();
                borrowing.setBook(book);
                borrowing.setUser(user);
                borrowing.setBorrowDate(new Date());
                borrowingRepository.save(borrowing);
                return "Book borrowed successfully";
            } else {
                return "Book is already borrowed";
            }
        } else {
            return "Book or user not found";
        }
    }

    
    public String returnBook(Long bookId, Long userId) {
        // Retrieve the book and user by their IDs
        Book book = bookService.getBookById(bookId);
        User user = userService.getUserById(userId);

        // Check if the book and user exist
        if (book != null && user != null) {
            // Check if the book is borrowed by the user
            if (book.getStatus().equals("Borrowed")) {
                // Update the book's status to "available"
                book.setStatus("Available");
                bookService.saveBook(book);

                // Retrieve the borrowing record by the book and user
                Borrowing borrowing = borrowingRepository.findByBookAndUser(book, user);

                // Check if the borrowing record exists
                if (borrowing != null) {
                    // Update the return date of the borrowing record
                    borrowing.setReturnDate(new Date());
                    borrowingRepository.save(borrowing);

                    return "Book returned successfully";
                } else {
                    return "Borrowing record not found";
                }
            } else {
                return "Book is not borrowed";
            }
        } else {
            return "Book or user not found";
        }
    }
}