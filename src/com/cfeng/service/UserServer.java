package com.cfeng.service;

import com.cfeng.domain.User;

import java.util.List;

public interface UserServer {
    public List<User> getAllUser();
    public void save(User resUser);
    public User find(User user);
    public User findByName(String username);
    public void update(User user);
    public User findById(User user);
    public void delete(User user);
}
