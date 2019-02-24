<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--设置标签图标-->
    <link rel="stylesheet" href="css/qian/index.css">
</head>

<body>
<!-- 通过jsp的指令导入头部-->
<%@include file="/header.jsp"%>
<!--广告-->
<div id="ad">
    <img src="/images/goods/ad.jpg" alt="">
</div>
<!--秒杀-->
<div id="ms">
    <div class="ms_top">
        <span>软工秒杀</span>
        <span>总有你想不到的低价</span>
    </div>
    <div class="ms_body">
        <ul>
            <li>
                <a href="shopdetail.jsp">
                    <img src="/images/goods/goods_001.png" alt="">
                    <p>心有猛虎 细嗅蔷薇:余光中散文精选</p>
                    <i class="yuan">￥</i><span class="price">23.33</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_002.png" alt="">
                    <p>活着多好呀</p>
                    <i class="yuan">￥</i><span class="price">30.88</span>
                </a>
            </li>
            <li>
                <a href="detail.html">
                    <img src="/images/goods/goods_003.png" alt="">
                    <p>世界十大文学名著:战争与和平(套装共4册)</p>
                    <i class="yuan">￥</i><span class="price">47.3</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_004.png" alt="">
                    <p>罗生门</p>
                    <i class="yuan">￥</i><span class="price">18.62</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_005.png" alt="">
                    <p>三体(1-3)(套装共3册)</p>
                    <i class="yuan">￥</i><span class="price">50</span>
                </a>
            </li>
        </ul>
    </div>

</div>
<!--热卖-->
<div id="hot_goods">
    <h3><a href="${pageContext.request.contextPath}/book_all.action">热卖商品</a></h3>
    <div class="hot_goods_body">
        <ul>
            <li>
                <a href="">
                    <img src="/images/goods/goods_006.png" alt="">
                    <p>金庸作品集:笑傲江湖(套装共4册) </p>
                    <i class="yuan">￥</i><span class="price">80</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_007.png" alt="">
                    <p>宋徽宗</p>
                    <i class="yuan">￥</i><span class="price">70</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_008.png" alt="">
                    <p>知行合一王阳明(1472-1529)</p>
                    <i class="yuan">￥</i><span class="price">17</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_009.png" alt="">
                    <p>我的世界观</p>
                    <i class="yuan">￥</i><span class="price">20.99</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_10.png" alt="">
                    <p>偷影子的人(附"青春初吻"纪念明信片)</p>
                    <i class="yuan">￥</i><span class="price">14</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_11.png" alt="">
                    <p>镖人3</p>
                    <i class="yuan">￥</i><span class="price">998</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_12.png" alt="">
                    <p>疯了！桂宝.20，有志卷</p>
                    <i class="yuan">￥</i><span class="price">233</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_13.png" alt="">
                    <p>汉字魔方:一套学习汉字的科学方法(套装共7册) </p>
                    <i class="yuan">￥</i><span class="price">599</span>
                </a>
            </li>
            <li>
                <a href="">
                    <img src="/images/goods/goods_14.png" alt="">
                    <p>牛津实用英汉双解词典(全新修订版)</p>
                    <i class="yuan">￥</i><span class="price">9999</span>
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- 通过jsp的指令导入尾部-->
<%@include file="/footer.jsp"%>


</body>
</html>