package com.cfeng.action;

import com.cfeng.domain.User;
import com.cfeng.service.LoginService;
import com.cfeng.service.UserServer;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import lombok.Setter;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.util.List;

public class UserAction extends ActionSupport implements ModelDriven<User> {
    @Setter
    private UserServer userServer;
    private User user = new User();
    @Override
    public User getModel() {
        return user;
    }

    public String list() {
//        System.out.println(user+"---------------------------------");
        user = userServer.find(user);
        List<User> list = null;
        list = userServer.getAllUser();
        System.out.println(list);
        ActionContext.getContext().getValueStack().set("userlist", list);
        return "list";
    }
    public String add() {
        User resUser = userServer.find(user);
        if (resUser == null) {
            userServer.save(user);
        }else{
            this.addActionError("创建相同用户");
            return ERROR;
        }
        return "listAction";
    }
    public String updateUI() throws IOException {
        User user1 = userServer.find(user);
        System.out.println(user1);
        JSONArray jsonArray = JSONArray.fromObject(user1, new JsonConfig());
        ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().println(jsonArray.toString());
        return null;
    }
    public String update(){
        System.out.println("-----------------------------------------------------");
        User user1 = userServer.findById(user);
        user1.setPassword(user.getPassword());
        user1.setUsername(user.getUsername());
        userServer.update(user1);
        return "listAction";
    }
    public String delete(){
        user = userServer.findById(user);
        userServer.delete(user);
        return "listAction";
    }
}
