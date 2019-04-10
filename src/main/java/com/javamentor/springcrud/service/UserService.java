package com.javamentor.springcrud.service;

import com.javamentor.springcrud.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(User user);
    List<User> getAllUsers();
    User getUserById(int id);
    User findByUserLogin(String login);
}
