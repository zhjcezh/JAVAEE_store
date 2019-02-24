package com.cfeng.action;

import com.cfeng.domain.Book;
import com.cfeng.domain.Category;
import com.cfeng.domain.PageBean;
import com.cfeng.domain.User;
import com.cfeng.service.BookService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Setter;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class BookAction  extends ActionSupport implements ModelDriven<Book> {
    private Book book = new Book();
    @Setter
    private BookService bookService;
    @Setter
    private Integer currPage = 1;
    @Override
    public Book getModel() {
        return book;
    }
    public String pageList(){
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Book.class);
        //调用业务层
        PageBean pageBean = bookService.getPageData(detachedCriteria,currPage,5);
        //数据存到值栈当中
        ActionContext.getContext().getValueStack().push(pageBean);
        return "list";
    }
    @Setter
    private String uploadFileName; // 文件名称
    @Setter
    private File upload; // 上传文件
    @Setter
    private String uploadContentType; // 文件类型
    public String add() throws IOException {
        if(upload != null){
            int index = uploadFileName.lastIndexOf(".");
            String etx = uploadFileName.substring(index);
            String uuid = UUID.randomUUID().toString();
            String uuidFileName = uuid.replace("-", "") + etx;
            System.out.println(uuidFileName);

            String path = ServletActionContext.getServletContext().getRealPath("/upload");
            File file = new File(path);
            if(!file.exists()){
                file.mkdirs();
            }
            File desFile = new File(path + "/" + uuidFileName);
            FileUtils.copyFile(upload,desFile);
            book.setBook_pic(uuidFileName);
        }
//            System.out.println(article);
        bookService.save(book);
        return "listAction";
    }
    public String delete(){
        bookService.delete(book);
        return "listAction";
    }
    public String edit(){
        System.out.println(book);
        //从数据库当中获取当前的文章
        Book resbook = bookService.getById(book);
        System.out.println(resbook);
        //把查询的数据存放到值栈
        ActionContext.getContext().getValueStack().push(resbook);
        //跳转到编辑界面
        return  "edit";
    }
    public String update() throws IOException {
        System.out.println(book);
        //判断有没有新上传的图片
        if(upload != null){
            //确定上传的路径
            String path = ServletActionContext.getServletContext().getRealPath("/upload");
            //获取图片名称
            String picname = book.getBook_pic();
            //删除原有的图片
            if(picname != null || "".equals(picname)){
                File file = new File(path + picname);
                file.delete();
            }
            //上传文件
            //随机生成文件名称
            //1.获取文件扩展名  ssh.jpg
            int index = uploadFileName.lastIndexOf(".");
            String etx = uploadFileName.substring(index);
            //2.随机生成文件名  拼接扩展名
            String uuid = UUID.randomUUID().toString();
            String uuidFileName = uuid.replace("-", "") + etx;
            File file = new File(path);
            if(!file.exists()){
                file.mkdirs();
            }
            //拼接新文件路径
            File desFile = new File(path + "/" + uuidFileName);
            //文件上传
            FileUtils.copyFile(upload,desFile);
            //设置图片
            book.setBook_pic(uuidFileName);
        }
        //调用业务更新文章
        bookService.update(book);

        return "listAction";
    }
    public String all(){
//        System.out.println("list---------------");
        List<Book> allBook = bookService.getAllBook(); System.out.println(allBook);
//        System.out.println(allArticle);
        ActionContext.getContext().getValueStack().set("allBook",allBook);

        return "alllist";
    }
    public String detail(){
        Book book1=bookService.getById(book);
        ActionContext.getContext().getValueStack().push(book1);
        return "detail";
    }
}
