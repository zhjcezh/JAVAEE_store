<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${ctx }/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${ctx }/css/amazeui.min.css" />
    <script type="text/javascript" charset="utf-8" src="${ctx }/js/umedit/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx }/js/umedit/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${ctx }/js/umedit/lang/zh-cn/zh-cn.js"></script>
    <script src="${ctx }/js/jquery.min.js"></script>
    <style>
        .update_pic{
            margin-bottom: 150px;
        }
        #imageview{
            width: 300px;
            height: 180px;
        }
    </style>
</head>
<body>


<div class="main_top">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">修改商品
        </strong><small></small></div>
    </div>
    <hr>
    <form id="blog_form" action="${ctx}/book_update.action" method="post" enctype="multipart/form-data">
        <div class="edit_content">
            <div class="item1">
                <div>
                    <span>商品标题：</span>
                    <input type="text" class="am-form-field" name="book_title" style="width: 300px"
                    value="<s:property value="book_title"/> "
                    >&nbsp;&nbsp;
                </div>
            </div>
            <div class="item1">
                <div>
                    <span>商品价格：</span>
                    <input type="text" class="am-form-field" name="book_price" style="width: 300px"
                           value="<s:property value="book_price"/> "
                    >&nbsp;&nbsp;
                </div>
            </div>
            <div class="item1">
                <div>
                    <span>商品数量：</span>
                    <input type="text" class="am-form-field" name="book_num" style="width: 300px"
                           value="<s:property value="book_num"/> "
                    >&nbsp;&nbsp;
                </div>
            </div>


            <div class="item1">
                <span>所属分类：</span>
                <select id="category_select" name="category.cid" style="width: 150px">&nbsp;&nbsp;

                </select>

            </div>

            <div class="item1 update_pic" >
                <span>摘要图片：</span>
                <img src="${ctx}/upload/<s:property value="book_pic"/>" id="imageview" class="item1_img">
                <label for="fileupload" id="label_file">上传文件</label>
                <input type="file" name="upload" id="fileupload"/>
            </div>

            <div id="editor" name="book_content" style="width:900px;height:400px;"></div>
            <input type="hidden" id="resContent" value="<s:property value="book_content"/>">
            <input type="hidden" name="book_id"  value="<s:property value="book_id"/>">
            <input type="hidden" name="book_pic" value="<s:property value="book_pic"/>">
            <button class="am-btn am-btn-default" type="button" id="send" style="margin-top: 10px;">
                修改
            </button>
        </div>
    </form>

</div>
<script>
    $(function () {

        //发送请求获取分类的数据
        $.post("${pageContext.request.contextPath}/category_getCategory.action",function (data) {
            console.log(data);
            //遍历
            $(data).each(function (i,obj) {
                console.log(obj.cname);
                $("#category_select").append("<option value="+obj.cid+">"+obj.cname+"</option>");
            });
            //设置默认分类
            $("#category_select option[value=<s:property value="category.cid"/>]").prop("selected",true);
        },"json");


        /*原理是把本地图片路径："D(盘符):/image/..."转为"http://..."格式路径来进行显示图片*/
        $("#fileupload").change(function() {
            var $file = $(this);
            var objUrl = $file[0].files[0];
            //获得一个http格式的url路径:mozilla(firefox)||webkit or chrome
            var windowURL = window.URL || window.webkitURL;
            //createObjectURL创建一个指向该参数对象(图片)的URL
            var dataURL;
            dataURL = windowURL.createObjectURL(objUrl);
            $("#imageview").attr("src",dataURL);
            console.log($('#imageview').attr('style'));
            if($('#imageview').attr('style') === 'display: none;'){
                $('#imageview').attr('style','inline');
                $('#imageview').width("300px");
                $('#imageview').height("180px");
                $('.update_pic').attr('style', 'margin-bottom: 150px;');
            }
        });
        //初始化富文本编程器
        var ue = UE.getEditor('editor');
        ue.ready(function () {
            ue.execCommand("inserthtml",$("#resContent").val());
        });

        $("#send").click(function () {
            //设置文本的描述
            //获取富文本正文
            var text = ue.getContentTxt();
            text = text.substring(0,150)+"...";
            //设置描述
            $("#book_desc").val(text);
            //提交表单
            $("#blog_form").submit();
        });
    });
</script>
</body>
</html>