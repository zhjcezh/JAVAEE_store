package com.cfeng.dao;

import com.cfeng.domain.Book;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface BookDao {
    public Integer getTotalCount(DetachedCriteria detachedCriteria);
    public List<Book> getPageData(DetachedCriteria detachedCriteria, Integer index, Integer pageSize);
    public void save(Book book);
    public void delete(Book book);
    public Book getById(Book book);
    public void update(Book book);
    public List<Book> getAllBook();
}
