<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录页面</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/all/data/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/all/data/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/all/data/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/all/data/css/login_regist.css">
    <style>
        *{margin: 0; padding: 0;}
        #login {width: 500px;margin-top: 120px;margin-right: auto;margin-left: auto;text-align: center;background-color: rgba(255,255,255,0.5);}
        #logo {height: 100px;width: 100px; margin-top: 5px;}
        .id_number {height: 35px;width: 240px;background-color: rgba(255,255,255,0.4);border: 1px solid rgba(255,255,255,0.5); margin-top: 10px;}
        #password_number {height: 35px;width: 240px;background-color: rgba(255,255,255,0.4);border: 1px solid rgba(255,255,255,0.5);}
        #login_submit {width:  242px;height: 35px;font-size: 16px;background: #FF7F50;border: none;margin-top: 22px;}
        #span_for {margin-left:-70px; margin-top: 15px;}
        a{text-decoration: none; color: black;}
        #code{margin-left: -10px; width: 128px;}
        input{padding: 5px;}    
    </style>
    <script type="text/javascript">
        //刷新验证码的函数
	     function refreshCode() {
	         //获取图片对象
	         var vcode_img = document.getElementById("vcode_img");
	         vcode_img.onclick = function() {
	             //获取时间戳
	             var time = new Date().getTime();
	             vcode_img.src = "${pageContext.request.contextPath}/VerificationCodeServlet?time="+time;
	         }
	     }
    </script>
</head>
<body>
    <div class="slideshow">
        <img src="${pageContext.request.contextPath}/all/bg/1.jpg" alt="1" class="slideshow-image">
        <img src="${pageContext.request.contextPath}/all/bg/2.jpg" alt="2" class="slideshow-image">
        <img src="${pageContext.request.contextPath}/all/bg/3.jpg" alt="3" class="slideshow-image">
        <img src="${pageContext.request.contextPath}/all/bg/4.jpg" alt="4" class="slideshow-image">
        <div id="login">
            <span style="font-size: 30px; color: #FF8150;">登 录</span>
            <br>
            <img alt="logo" src="${pageContext.request.contextPath}/all/book/logo.png" id="logo">
            <form action="${pageContext.request.contextPath }/LoginServlet" method="post">
                <input type="text" class="id_number" placeholder="请输入账号" maxlength="16" style="font-size: 18px;" name="uaccount" required>
                <br><br>
                <input type="password" id="password_number" placeholder="请输入密码" maxlength="16" style="font-size: 18px;" name="upwd" required>
                <br>
                <input type="text" id="code" class="id_number" placeholder="请输入验证码" maxlength="6" style="font-size: 18px;" name="vcode" required>
                <!-- 这是一个图片链接，点击图片后执行refreshCode()函数更换图片 -->
                <a href="javascript:refreshCode();"><img src="${pageContext.request.contextPath}/VerificationCodeServlet" title="看不清点击刷新" id="vcode_img"/></a>
                <div>
                    <input type="submit" id="login_submit" value="登录">
                </div>
                <div id="span_for">
                    <span style="font-size: 18px;">还没有账号?马上<a href="${pageContext.request.contextPath  }/jsp/regist.jsp"><b>注册</b></a></span>
                </div>
                <br>
                <!-- 出错显示的信息框 -->
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" >
                      <span>&times;</span>
                    </button>
                    <strong>
                        <c:if test="${loginMsg==nul }">
                                                            您还未登录，请登录!
                        </c:if>
                        <c:if test="${loginMsg!=nul }">
                          ${loginMsg }
                        </c:if>
                    </strong>
                </div>
            </form>
        </div>
    </div>
</body>
</html>