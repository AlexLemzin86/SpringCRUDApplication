package com.javamentor.springcrud.dao;

import com.javamentor.springcrud.model.User;

import java.util.List;

public interface UserDAO {
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(User user);
    List<User> getAllUsers();
    User getUserById(int id);
    User findByUserLogin(String login);
}
