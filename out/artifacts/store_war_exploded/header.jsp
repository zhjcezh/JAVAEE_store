<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--设置标签图标-->
    <link href="favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="css/qian/header.css">
</head>

<body>

<!--头部-->
<div id="header">
    <!--顶部-->
    <div class="header_top">
        <div class="header_top_center">
            <div class="h_top_left">
                欢迎来到软工商城
            </div>
            <div class="h_top_right">
                <s:if test="%{ #session.curUser.id != null }">
                    欢迎：<s:property value="#session.curUser.username"/>
                    <a href="#">退出</a>
                    <a href="#">购物车</a>
                    <a href="#">我的订单</a>
                    <a href="mgr_index.jsp">后台管理</a>
                </s:if>
                <s:else>
                    <a href="mgr_login.jsp">登录</a>
                    <a href="regist.jsp">免费注册</a>
                </s:else>
            </div>
        </div>
    </div>
    <!--中部搜索-->
    <div class="header_center">
        <div class="h_c_logo">
            <img src="/images/logo.png" alt="">
        </div>

        <div class="h_c_search">
            <form action="#" >
                <input type="text" placeholder="输入一些内容。。。" class="t_input">
                <input type="submit" class="t_button">
            </form>
            <div class="hot">
                <a href="#">心有猛虎 细嗅蔷薇</a>
                <a href="#">活着多好呀</a>
                <a href="#">战争与和平</a>
                <a href="#">罗生门</a>
                <a href="#">三体(1-3)</a>
            </div>
        </div>

        <div class="h_c_code">
            <img src="images/pcode.png" alt="">
        </div>
    </div>
    <!--导航-->
    <div class="nav">
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="/mystore/GoodsServlet">文学</a></li>
            <li><a href="/mystore/GoodsServlet">小说</a></li>
            <li><a href="/mystore/GoodsServlet">传记</a></li>
            <li><a href="/mystore/GoodsServlet">青春动漫</a></li>
            <li><a href="/mystore/GoodsServlet">课本</a></li>
        </ul>
    </div>

</div>
</body>
</html>
