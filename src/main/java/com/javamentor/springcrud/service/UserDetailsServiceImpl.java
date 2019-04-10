package com.javamentor.springcrud.service;

import com.javamentor.springcrud.dao.UserDAO;
import com.javamentor.springcrud.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
//import org.springframework.transaction.annotation.Transactional;


@Service("userDetails")
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional/*(readOnly = true)*/
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        User user = userDAO.findByUserLogin(login);

        if (user == null){
            throw  new UsernameNotFoundException(login);
        }
        return new org.springframework.security.core.userdetails.User(user.getLogin(),user.getPassword(),user.getRoles());
    }
}
