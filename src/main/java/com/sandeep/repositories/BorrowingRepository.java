package com.sandeep.repositories;


import com.sandeep.model.Book;
import com.sandeep.model.Borrowing;
import com.sandeep.model.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BorrowingRepository extends JpaRepository<Borrowing, Long> {
    Borrowing findByBookAndUser (Book book, User user);
}