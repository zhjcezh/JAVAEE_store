package com.cfeng.dao.impl;

import com.cfeng.dao.BookDao;
import com.cfeng.domain.Book;
import com.cfeng.domain.User;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class BookDaoImpl extends HibernateDaoSupport implements BookDao {

    @Override
    public Integer getTotalCount(DetachedCriteria detachedCriteria) {
        detachedCriteria.setProjection(Projections.rowCount());
        List<Long> list = (List<Long>)this.getHibernateTemplate().findByCriteria(detachedCriteria);
        System.out.println(list);
        if(list.size() > 0){
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<Book> getPageData(DetachedCriteria detachedCriteria, Integer index, Integer pageSize) {
        detachedCriteria.setProjection(null);
        List<Book> list = (List<Book>)this.getHibernateTemplate().findByCriteria
                (detachedCriteria,
                        index,
                        pageSize);
        return list;
    }

    @Override
    public void save(Book book) {
        this.getHibernateTemplate().save(book);
    }

    @Override
    public void delete(Book book) {
        this.getHibernateTemplate().delete(book);
    }

    @Override
    public Book getById(Book book) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Book.class);
        detachedCriteria.add(Restrictions.eq("book_id",book.getBook_id()));
        List<Book> list = (List<Book>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
//        System.out.println(list);
        if (list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public void update(Book book) {
        this.getHibernateTemplate().update(book);
    }

    @Override
    public List<Book> getAllBook() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Book.class);
        List<Book> list = (List<Book>)this.getHibernateTemplate().findByCriteria(detachedCriteria);
        return list;
    }
}
