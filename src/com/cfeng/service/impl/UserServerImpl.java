package com.cfeng.service.impl;

import com.cfeng.dao.UserDao;
import com.cfeng.domain.User;
import com.cfeng.service.UserServer;
import lombok.Setter;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class UserServerImpl implements UserServer {
    @Setter
    private UserDao userDao;

    @Override
    public List<User> getAllUser() {
        List<User> list = userDao.getAllUser();
        return list;
    }

    @Override
    public void save(User resUser) {
        userDao.save(resUser);
    }

    @Override
    public User find(User user) {
        User user1 = userDao.findById(user);
        return user1;
    }

    @Override
    public User findByName(String username) {
        User user1 = userDao.findByName(username);
        return user1;
    }
    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public User findById(User user) {
        user = userDao.findById(user);
        return user;
    }

    @Override
    public void delete(User user) {
        userDao.delete(user);
    }


}
