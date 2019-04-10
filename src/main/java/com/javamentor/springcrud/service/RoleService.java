package com.javamentor.springcrud.service;

import com.javamentor.springcrud.model.Role;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public interface RoleService {
    Role getRoleName(String name);
    Set<Role> getAllRoll();
}
