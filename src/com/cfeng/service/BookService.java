package com.cfeng.service;

import com.cfeng.domain.Book;
import com.cfeng.domain.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface BookService {
    public PageBean getPageData(DetachedCriteria detachedCriteria, Integer currPage, int i);
    public void save(Book book);
    public void delete(Book book);
    public Book getById(Book book);
    public void update(Book book);
    public List<Book> getAllBook();
}
