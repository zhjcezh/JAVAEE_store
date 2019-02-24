<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--设置标签图标-->
    <link rel="stylesheet" href="/css/qian/common.css">
    <link rel="stylesheet" href="/css/qian/header.css">
    <link rel="stylesheet" href="/css/qian/goods_list.css">
    <link rel="stylesheet" href="/css/qian/pageStyle.css">
</head>
<body>
<!-- 通过jsp的指令导入头部-->
<%@include file="/header.jsp"%>

<!--热卖-->
<div id="hot_goods">
    <h3>热卖商品</h3>
    <div class="hot_goods_body">
        <ul>
            <s:iterator value="allBook" var="book">
                <li>
                    <a href="${ctx}/book_detail.action?book_id=<s:property value='#book.book_id'/>">
                        <img src="${ctx}/upload/<s:property value="#book.book_pic"/>" alt="" class="img-rounded">
                        <p><s:property value="#book.book_title"/></p>
                        <i class='yuan'>￥</i><span class='price'><s:property value="#book.book_price"/></span>
                    </a>
                </li>
            </s:iterator>
        </ul>
        <!--分页-->
        <div id="page" class="page_div"></div>
    </div>

</div>

<div id="page" class="page_div"></div>
<!-- 通过jsp的指令导入尾部-->
<%@include file="/footer.jsp"%>



<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script>
    //分页
    //分页
    $("#page").paging({
        pageNo:1,
        totalPage: 3,
        totalSize: 18,
        callback: function(num) {
            //获取搜索关键字
            var keyWord = $("#input_search").val();
            $(window).attr('location','/book_pageList.action?currPage='+num+"&keyWord="+keyWord);
        }
    });
</script>
</body>
</html>

<!--
1.把css引入到项目 当中
2.把分页的代码写到对应的位置  <div id="page" class="page_div"></div>
3.引入js   在尾部引入js

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script>
    //分页
    $("#page").paging({
        pageNo:3,  /*当前选中的是哪一页*/
        totalPage: 15, /*共多少页*/
        totalSize: 300,/*共多少条记录*/
        callback: function(num) {
           console.log(num);
        }
    })
</script>

-->