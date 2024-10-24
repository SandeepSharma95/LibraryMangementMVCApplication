package com.sandeep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sandeep.model.Book;
import com.sandeep.model.User;
import com.sandeep.repositories.BookRepository;
import com.sandeep.repositories.UserRepository;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    
    public List<User> getAllUsers() {
        List<User> user= userRepository.findAll();
        return user;
    }
    
    public User getUserById(Long id) {
        return userRepository.findById(id).orElseThrow();
    }
    
    public String saveUser (User user) {
        userRepository.save(user);
        return "User added Sucessfully";
    }
    
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}