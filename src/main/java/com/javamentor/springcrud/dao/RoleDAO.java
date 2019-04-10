package com.javamentor.springcrud.dao;

import com.javamentor.springcrud.model.Role;

import java.util.List;
import java.util.Set;

public interface RoleDAO {
    Role getRoleName(String name);
    Set<Role> getAllRole();
}
