package com.javamentor.springcrud.service;

import com.javamentor.springcrud.dao.RoleDAO;
import com.javamentor.springcrud.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;

import javax.transaction.Transactional;
import java.util.Set;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    @Override
    @Transactional
    public Role getRoleName(String name) {
        return roleDAO.getRoleName(name);
    }

    @Override
    @Transactional
    public Set<Role> getAllRoll() {
        return roleDAO.getAllRole();
    }
}
