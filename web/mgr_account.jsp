<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="js/pageStyle.css">
    <script src="js/jquery.min.js"></script>
    <style>
        #modal_content_account2{
            padding: 30px 20px;
            width: 400px;
            height: 300px;
            background: white;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-left: -200px;
            margin-top: -100px;
            display: none;
        }
        #close2{
            position: absolute;
            right: 10px;
            top: 10px;
        }
    </style>
</head>
<body>

<div class="main_top">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">管理员列表</strong><small></small></div>
    </div>
    <hr>
    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button id="add" class="am-btn am-btn-default">
                        <span class="am-icon-plus"></span> 添加管理员</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="goods_list" id="account_List">
    <ul class="title_ul">
        <li>序号</li>
        <li>用户</li>
        <li>修改密码</li>
        <li>移除管理员</li>
    </ul>

    <s:iterator value="userlist" var="user">
        <ul class="list_goods_ul">
            <li><s:property value="#user.id"/></li>
            <li><s:property value="#user.username"/></li>
            <li>
                <a href="#" class="updatebtn" data-id="<s:property value='#user.id'/>">
                  <img class="img_icon" src="../../images/edit_icon.png" alt="">
                </a>
            </li>
            <li><a href="${pageContext.request.contextPath}/user_delete.action?id=<s:property value='#user.id'/>"> <img class="img_icon" src="../../images/delete_icon.png" alt=""></a></li>
        </ul>
    </s:iterator>

</div>

<div id="modal_view">
</div>

<div id="modal_content_account">
    <div id="close"><img src="../../images/delete_icon.png" alt=""></div>
    <div class="edit_content">

        <div class="item1">
            <div>
                <span>添加管理员：</span>
            </div>
        </div>
        <div class="item1">
            <div>
                <span>用户名：</span>
                <input type="text" class="am-form-field" id="username">&nbsp;&nbsp;
            </div>
        </div>
        <div class="item1">
            <div>
                <span>密码：</span>
                <input type="password" class="am-form-field" id="password">&nbsp;&nbsp;
            </div>
        </div>
        <div class="item1">
            <button class="am-btn am-btn-default" type="button" id="adduser">添加</button>
        </div>
    </div>
</div>

<div id="modal_content_account2">
    <div id="close2"><img src="../../images/delete_icon.png" alt=""></div>
    <div class="edit_content">

        <div class="item1">
            <div>
                <span>修改信息：</span>
            </div>
        </div>
        <div class="item1">
            <div>
                <span>用户名：</span>
                <input type="text" class="am-form-field" id="username2">&nbsp;&nbsp;
            </div>
        </div>
        <div class="item1">
            <div>
                <span>密码：</span>
                <input type="password" class="am-form-field" id="password2">&nbsp;&nbsp;
            </div>
        </div>
        <input type="hidden" id="id2">
        <div class="item1">
            <button class="am-btn am-btn-default" type="button" id="updatebtn">修改</button>
        </div>
    </div>
</div>
<script>
    $(function () {
        $('#add').click(function () {
            $("#modal_view").fadeIn();
            $("#modal_content_account").fadeIn();
        });
        $("#adduser").click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            $(window).attr('location','${pageContext.request.contextPath}/user_add.action?username='+username+'&password='+password);
        });
        $("#close").click(function () {
            $("#modal_view").fadeOut();
            $("#modal_content_account").fadeOut();
        });


        $(".updatebtn").click(function () {
            /*1.当前点的是哪一条数据*/
            var id = $(this).data("id");
            $.post("${pageContext.request.contextPath}/user_updateUI.action",{"id":id},function (data) {
                console.log("-------json------");
                console.log(data);
                /*把json数据展示到文本框 */
                $("#username2").val(data[0].username);
                $("#password2").val(data[0].password);
                $("#id2").val(data[0].id);
                // $("#teamname2").val(data[0].team.team_name);
            },"json");

            /*2.把修改界面弹出*/
            $("#modal_view").fadeIn();
            $("#modal_content_account2").fadeIn();
        });

        $("#close2").click(function () {
            $("#modal_view").fadeOut();
            $("#modal_content_account2").fadeOut();
        });

        $("#updatebtn").click(function () {
            /*1.获取文本框值*/
            var username2 = $("#username2").val();
            var password2 = $("#password2").val();
            var id2 = $("#id2").val();
            $(window).attr('location','${pageContext.request.contextPath}/user_update.action?username='+username2+'&password='+password2+'&id='+id2);
            /*2.发送请求*/


        });
    });
</script>
</body>
</html>