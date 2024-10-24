package com.sandeep.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sandeep.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
