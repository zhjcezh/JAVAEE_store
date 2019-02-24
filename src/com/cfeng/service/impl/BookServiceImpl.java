package com.cfeng.service.impl;

import com.cfeng.dao.BookDao;
import com.cfeng.domain.Book;
import com.cfeng.domain.PageBean;
import com.cfeng.service.BookService;
import lombok.Setter;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
public class BookServiceImpl implements BookService {
    @Setter
    private BookDao bookDao;
    @Override
    public PageBean getPageData(DetachedCriteria detachedCriteria, Integer currPage, int pageSize) {
        PageBean<Book> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currPage);
        //设置当前一页有多少条数据
        pageBean.setPageSize(pageSize);
        //获取总记录数
        //从数据库当中查询总记录
        Integer totalCount = bookDao.getTotalCount(detachedCriteria);
        System.out.println(totalCount+"--------------------------");
        pageBean.setTotalCount(totalCount);
        //设置总页数
        pageBean.setTotalPage(pageBean.getTotalPage());
        //设置数据当前页数据
        //查询数据库
        List<Book> list =  bookDao.getPageData(detachedCriteria,pageBean.getIndex(),pageBean.getPageSize());
        //计算
        pageBean.setList(list);
        System.out.println(pageBean);
        return pageBean;
    }

    @Override
    public void save(Book book) {
        bookDao.save(book);
    }

    @Override
    public void delete(Book book) {
        bookDao.delete(book);
    }

    @Override
    public Book getById(Book book) {
        Book book1 = bookDao.getById(book);
        return book1;
    }

    @Override
    public void update(Book book) {
        bookDao.update(book);
    }

    @Override
    public List<Book> getAllBook() {
        List<Book> bookList = bookDao.getAllBook();
        return bookList;
    }
}
