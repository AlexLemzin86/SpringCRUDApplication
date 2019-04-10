package com.javamentor.springcrud.dao;


import com.javamentor.springcrud.model.Role;
import com.javamentor.springcrud.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository("roleDao")
public class RoleDAOImpl implements RoleDAO {

   /* private SessionFactory sessionFactory;


    @Autowired
    @Qualifier(value = "sessionFactory")
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }*/

   private EntityManager entityManager;

    public EntityManager getEntityManager() {
        return entityManager;
    }

    @PersistenceContext
    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public Role getRoleName(String name) {
        //Session session = this.sessionFactory.getCurrentSession();
        TypedQuery<Role> query = entityManager.createQuery("from Role where name = :name",Role.class);
        query.setParameter("name",name);
        return query.getSingleResult();
    }

    @Override
    public Set<Role> getAllRole() {
        List<Role> roleList ;
        roleList = entityManager.createQuery("from Role",Role.class).getResultList();
        return new HashSet<>(roleList);
    }
}
