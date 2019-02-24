<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<!doctype html>

<html>
<head>
<title>详情页面</title>
<link href="/css/qian/shopdetail.css" rel="stylesheet" type="text/css">

<script src="/js/jquery-1.9.1.min.js"></script>
<script src="/js/common.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,
		  "boxh":550,
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
	 
	 $(function(){

		$('.tabs a').click(function(){
			
			var $this=$(this);
			$('.panel').hide();
			$('.tabs a.active').removeClass('active');
			$this.addClass('active').blur();
			var panel=$this.attr("href");
			$(panel).show();				
			return fasle;  //告诉浏览器  不要纸箱这个链接
			})//end click
			
			
			$(".tabs li:first a").click()   //web 浏览器，单击第一个标签吧
	

		
		})//end ready
		
		$(".centerbox li").click(function(){
			$("li").removeClass("now");
			$(this).addClass("now")
			
			});
		
			
});
	
			
		
		
</script>
</head>

<body>
<!-- 通过jsp的指令导入头部-->
<%@include file="/header.jsp"%>
<!-----header结束------->
<!-----商品详情部分------->
<div class="shopdetails">
	<!-------放大镜-------->
	<div id="leftbox">
	<div id="showbox">
        <img src="/upload/<s:property value="book_pic"/>" width="400" height="550" />
        <img src="/images/goods/goods_002.png" width="400" height="550" />
	</div>
        <!--展示图片盒子-->
    <div id="showsum"></div><!--展示图片里边-->
    <p class="showpage">
     <a href="javascript:void(0);" id="showlast"> < </a>
     <a href="javascript:void(0);" id="shownext"> > </a>
    </p>

    </div>
    <!----中间----->

    <div class="centerbox">
    	<p class="imgname"><s:property value="book_title"/></p>
    	<p class="Aprice">价格：<samp>￥998.00</samp></p>
    	<p class="price">促销价：<samp>￥<s:property value="book_price"/></samp></p>
    	<p class="youhui">店铺优惠：<samp>购物满两件打八折</samp></p>
    	<p class="kefu">客服：</p>
        <div class="clear"></div>
        <p class="buy"><a href="#" id="firstbuy">立即购买</a><a href="#">加入购物车</a></p>
   		<div class="clear"></div>
        <div class="fenx"><a href="#"><img src="/images/shopdetail/tell07.png"></a></div>
        <p class="fuwu">服务承诺：</p>
        <p class="pay">支付方式：</p>
    </div>
 
	<!-----右边------->
   <div class="rightbox">
    	<p class="name">——热卖商品</p>
    	<img src="/images/goods/goods_002.png" width="130" height="180">
		<p>￥30.88元</p>
     
    	<img src="/images/goods/goods_003.png" width="130" height="180">
		<p>￥47.3元</p>
        
        
    	<img src="/images/goods/goods_004.png" width="130" height="180">
		<p>￥18.62元</p>
    </div>
            
</div>
<!-----商品详情部分结束------->
<!-----商品详情评价部分-------> 
<div class="evaluate">

    <div class="tabbedPanels">
    	<ul class="tabs">
        	<li><a href="#panel01">商品详情</a></li>
            <li><a href="#panel02" class="active">累计评价</a></li>
        </ul>
        
     <div class="panelContainer">
       	<div class="panel" id="panel01">
        	<p class="sell">基本信息</p>
            <div class="detail_price">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="bucket">
                            <div id="content">
                                <s:property value="book_content" escapeHtml="false"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <p></p>
        	<div class="clear"></div>
        </div>
        
        <div class="panel" id="panel02">
        	<p class="sell">买家评价</p>
        	<img src="/images/shopdetail/detail101.png">
            <p class="judge">全部评价(20)<span>晒图(13)</span></p>
            
            <div class="judge01">
            <div class="idimg"><img src="/images/shopdetail/detail102.png"></div>
            <div class="write">
            <p class="idname">落***1</p>
            <p>余老的文字仿佛有种独特的魔力，带你越过一幅恬静悠然的山水画，粘稠而意蕴无穷。如果非要选一段来说明这种感觉的话，那么《望乡的牧神》的最后一段，我想是再合适不过了。“那年的秋季特别长，所以说，我一整夜都浮在一首歌上。那些尚未收割的高粱，全失眠了。这么说，你就完全明白了，不是吗？那年的秋天特别长”</p>

            </div>
            </div>
            
            <div class="judge01">
            <div class="idimg"><img src="/images/shopdetail/detail102.png"></div>
            <div class="write">
            <p class="idname">席***2</p>
            <p>看余光中的散文需要凝神静气，若不然，文字便会在浮躁的气息中融化。这字似流水般潺潺，似冰雪般剔透。还记得《听那冷冷的雨》一文是在课文中出现的，让我任觉得回味无穷。余光中的散文、诗歌，就像穿梭在时间隧道中、飞跃在世界每个角落……</p>
            <img src="/images/shopdetail/detail106.jpg" width="40px" height="40px">
            <img src="/images/shopdetail/detail107.jpg" width="40px" height="40px">
            </div>
            </div>
            
            <div class="judge01">
            <div class="idimg"><img src="/images/shopdetail/detail102.png"></div>
            <div class="write">
            <p class="idname">怒***4</p>
            <p>余光中的散文，无论篇幅与文体都不拘一格，语言生动幽默，笔触开阔大气，艺术成就独特且主题丰富：有旅居海外的经历，有个人读书体会，有四个女儿的成长故事，更有对祖国故土和文化的眷恋。</p>
            </div>
            </div>
            
            <div class="judge01">
            <div class="idimg"><img src="/images/shopdetail/detail102.png"></div>
            <div class="write">
            <p class="idname">毛***字</p>
            <p>读这本书里的篇章，我感受到余光中的博学、严谨、才气，也感受到他试图在传统与现代，东方与西方之间突围、建构新文学体系的努力。虽然有时代与地域的相隔，但是真的要感叹，他的文字一点都不隔。</p>
            <img src="/images/shopdetail/detail103.jpg" width="40px" height="40px">
            <img src="/images/shopdetail/detail104.jpg" width="40px" height="40px">
            </div>
            </div>
            
            <div class="judge01">
            <div class="idimg"><img src="/images/shopdetail/detail102.png"></div>
            <div class="write">
            <p class="idname">轻***4</p>
            <p>时而狂放时而沉凝时而唏嘘散文中氤氲着诗意。前尘隔海，古屋犹在。尺素寸心亦是一种态度。或许是因为余光中将散文作为“诗余”，所以他把诗中的情感延续到散文中，如同品酒，余味更葚。</p>
            </div>
            </div>
            
            <div class="judge01">
            <div class="idimg"><img src="/images/shopdetail/detail102.png"></div>
            <div class="write">
            <p class="idname">里***2</p>
            <p>收录了著名作家余光中的大量散文佳作。这些作品风格独特，自成一派，行文流畅，文笔精妙，较好地体现了作者的文学水平与艺术素养。读来令人爱不释手，欲罢不能。</p>

            </div>
            </div>
            
            <div class="judge01">
            <div class="idimg"><img src="/images/shopdetail/detail102.png"></div>
            <div class="write">
            <p class="idname">啥***2</p>
            <p>喜欢余光中，不是因为他的诗，而是他的散文。记得第一次读的是他的《沙田山居》和《听听那冷雨》极度仰慕他的文笔，那是诗化的散文。</p>

            </div>
            </div>
            
            
            
            <div class="judge01">
            <div class="idimg"><img src="/images/shopdetail/detail102.png"></div>
            <div class="write">
            <p class="idname">胡***2</p>
            <p>这次的选本，20万字。从各个角度看都称得上经典。《听听那冷雨》《记忆像铁轨一样长》《山盟》《西湾落日圆》《幽默的境界》《我的四个假想敌》《朋友四型》《凭一张地图》……经典的篇目，雅致的内文版式，喜人的封面，成了一本余光中。</p>
            </div>
            </div>
              <div class="clear"></div>
        </div>

         </div>
    
    </div>

</div>

<!-----商品详情评价部结束分------->

<!-- 通过jsp的指令导入尾部-->
<%@include file="/footer.jsp"%>

</body>
</html>
