package com.cfeng.dao;

import com.cfeng.domain.User;

import java.util.List;

public interface UserDao {
    public User getUser(User user);
    public List<User> getAllUser();
    public void save(User resUser);
    public User find(User user);
    public User findByName(String username);
    public void update(User user);
    public User findById(User user);
    public void delete(User user);
}
