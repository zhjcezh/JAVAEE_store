package com.cfeng.action;

import com.cfeng.domain.User;
import com.cfeng.service.LoginService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User> {
    private User user = new User();
    @Override
    public User getModel() {
        return user;
    }
    private LoginService loginService;

    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    public String login(){
        User resUser = loginService.login(user);
        System.out.println(resUser);
        if (resUser == null){
            this.addActionError("用户名或密码错");
            return LOGIN;
        }else {
            ActionContext.getContext().getSession().put("curUser",resUser);
            return SUCCESS;
        }
    }
}
