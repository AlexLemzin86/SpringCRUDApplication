package com.javamentor.springcrud.dao;

import com.javamentor.springcrud.model.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.TransactionalException;
import java.util.List;

@Repository("UserDAO")
public class UserDAOImpl implements UserDAO {

    //private SessionFactory sessionFactory;
    private EntityManager entityManager;

    public EntityManager getEntityManager() {
        return entityManager;
    }

    @PersistenceContext
    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    /* @Autowired
        @Qualifier(value = "sessionFactory")
        public void setSessionFactory(SessionFactory sessionFactory) {
            this.sessionFactory = sessionFactory;
        }
    */
    @Override
    public void addUser(final User user) {
       /* Session session = this.sessionFactory.getCurrentSession();
        session.save(user);*/
        this.entityManager.persist(user);
    }

    @Override
    public void updateUser(final User user) {
       /* Session session = this.sessionFactory.getCurrentSession();
            session.update(user);*/
        this.entityManager.refresh(user);
    }

    @Override
    public void deleteUser(User user) {
       /* Session session = this.sessionFactory.getCurrentSession();
        session.delete(user);*/
            this.entityManager.remove(user);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> getAllUsers() {
        //Session session = this.sessionFactory.getCurrentSession();
        return this.entityManager.createQuery("from User", User.class).getResultList()/* session.createQuery("from User", User.class).list()*/;
    }

    @Override
    public User getUserById(int id) {
        //Session session = this.sessionFactory.getCurrentSession();
        return this.entityManager.find(User.class, id) /*session.get(User.class, id)*/;
    }

    @Override
    public User findByUserLogin(String login) {
        //Session session = this.sessionFactory.getCurrentSession();
        TypedQuery<User> query = this.entityManager.createQuery("from User where login = :login",User.class); /*session.createQuery("from User where login = :login",User.class);*/
        query.setParameter("login",login);
        return query.getSingleResult();/*.uniqueResult();*/
    }
}
