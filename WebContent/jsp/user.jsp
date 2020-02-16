<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <!-- 指定字符集 -->
  <meta charset="utf-8">
  <!-- 使用Edge最新的浏览器的渲染方式 -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>用户详情页</title>
  <!-- 1. 导入CSS的全局样式 -->
  <link href="${pageContext.request.contextPath}/all/data/css/bootstrap.min.css" rel="stylesheet">
  <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
  <script src="${pageContext.request.contextPath}/all/data/jquery-2.1.0.min.js"></script>
  <!-- 3. 导入bootstrap的js文件 -->
  <script src="${pageContext.request.contextPath}/all/data/js/bootstrap.min.js"></script>  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/all/data/css/personal.css">
  <style>
      body,html{background-color: #F5F5F5;display: flex;min-height: 100vh;flex-direction: column;}
      *{margin: 0;padding: 0;}
      .mag_top{margin-top: 10px;}
      .author{border-radius: 50%; border: 2px solid #FF8D7B;background-color: #FF8D7B;}
      .second{font-weight: 700; color: black;font-size: 18px;}
      header{background: #ffffff;}
      .footer_span{height: 40px;;text-align: center;line-height: 40px;}
      footer{min-height: 80px;background-color: #434343;}
      #footer{background-color: #434343;}
      .book_img{width: 100px;height: 130px;}
      #center{flex: 1;}
      a:hover{text-decoration: none;}
      .choose{color: red;}
  </style>
  <script>
    var uage;
    var uemail;

    var uageMsg = "";
    var uemailMsg = "";
    window.onload = function() {
        uage = document.getElementById("uage");
        uemail = document.getElementById("email");
        
    }
    function checkForm() {          //验证表单
        var checkage = checkAge();
        var checkemail = checkEmail();
        return checkage && checkemail ;    //return false后, 事件将被取消
    }
    function checkAge() {       //验证用户年龄
        var regex = /^([1-9]|[1-9][0-9]?|1[01][0-9]|120)$/;
        var value = uage.value;
        
        if (!regex.test(value)) {
          uageMsg = "年龄不合法";
          uage.value = uageMsg;
        }
        // uageMsg.innerHTML = msg;
        return uageMsg == "";
    }
    function checkEmail() {         // 验证邮箱
        var regex = /^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,4}$/;
        var value =uemail.value;

        if (!value) {
          uemailMsg = "邮箱必须填写";
          uemail.value = uemailMsg;
        }
        if (!regex.test(value)) {
          uemailMsg = "邮箱格式不合法";
          uemail.value = uemailMsg;
        }
        
        // uemailMsg.innerHTML = msg;
        return uemailMsg == "";
    }
  </script>
</head>

<body>
  <header class="container">
    <div class="row">
      <div class="col-md-8">
        <img src="${pageContext.request.contextPath}/all/book/logo.jpg" alt="logo" id="logo">
      </div>
      <div class="col-md-4">
           <div class="top1" style="margin-top: 12px; margin-left: 0px; height: 48px;">
               <button class="btn btn-default author" type="button">欢迎您来到书酷</button>
               <a class="btn" href="javascript:void(0);" role="button"><span style="font-weight: 700;font-size: 20px;">${user.getUaccount() }</span></a>
               <a class="btn" href="${pageContext.request.contextPath}/LoginOutServlet" role="button"><span style="font-weight: 700;font-size: 20px;">注销</span></a>
           </div>
      </div>
    </div>
    <div class="row second">
      <nav class="navbar navbar-default" style="background-color: #ffffff;">
        <div class="container-fluid">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/index2.jsp"><span>首页</span></a>
          </div>
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet">书库</a></li>
              <li><a href="${pageContext.request.contextPath}/BookRankingServlet">排行</a></li>
              <li><a href="${pageContext.request.contextPath}/QueryBookShelfByPageServlet">书架</a></li>
              <li class="active"><a href="${pageContext.request.contextPath}/QueryUserServlet">个人信息</a></li>
              <li><a href="#">留言</a></li>
              <c:if test="${user.getUaccount() == 'admin'}">
                  <li>
                      <a href="${pageContext.request.contextPath}/QueryUserByPageServlet">管理员界面</a>
                  </li>
              </c:if>
            </ul>
            <!-- 搜索框 -->
            <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/QueryBooksByPageServlet" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="关键词、书名、作者名" name="fparam" value="${fparam }">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
    </div>
  </header>

  <div class="container" style="background-color: #FAFAFA;font-size: 17px;" id="center">
    <form action="${pageContext.request.contextPath }/UpdateUserServlet" method="post" onsubmit="return checkForm();">
      <div class="col-xs-4 col-md-5 col-center-block">
        <div class="same">
          <label for="um">账号</label>
          <input id="um" name="uaccount" type="text" value="${u.getUaccount() }" readonly>
        </div>
        <div class="same">
          <label for="email">邮箱</label>
          <input id="email" class="border" type="email" name="uemail" value="${u.getUemail() }">
        </div>
        <div class="same">
          <label for="">账号类型</label>
          <input id="utype" type="text" value="${u.getRole() }" readonly name="urole">
        </div>
        <div class="same">
          <label for="meal">性别</label>
          <c:if test="${u.getUsex() =='男'}">
            <input id="male" type="radio" name="usex" value="男" checked="checked"><label for="male" class="label_1">男</label>
            <input id="female" type="radio" name="usex" value="女"><label for="female" class="label_1">女</label>
          </c:if>
          <c:if test="${u.getUsex() =='女'}">
            <input id="male" type="radio" name="usex" value="男"><label for="male" class="label_1">男</label>
            <input id="female" type="radio" name="usex" value="女" checked="checked"><label for="female" class="label_1">女</label>
          </c:if>
        </div>
        <div class="same">
          <label for="">年龄</label>
          <input id="uage" type="text" value="${u.getUage() }" name="uage">
        </div>
        <div class="same">
          <label for="phone">手机号码</label>
          <input type="phone" id="phone" value="${u.getUtel() }" name="utel">
        </div>
        <div class="same">
          <label for="">住址</label>
          <input type="text" id="address" value="${u.getUaddress() }" name="uaddress">
        </div>
        <div class="info_1">
          <label for="info">自我介绍</label>
          <textarea class="form-control" rows="3" name="uintroduction">${u.getUintroduction() }</textarea>
        </div>
        <div class="mag_top">
          <button type="submit" class="btn btn-default" style="margin-left: 180px;background-color: turquoise;">提交</button>
        </div>
      </div>
    </form>
  </div>

  <footer class="mag_top">
    <div class="container">
      <div class="row">
        <div class="footer_span">
          <span style="font-size: 14px;color: #B1DFF6;">书酷小说版权所有，未经许可不得转载 宜ICP证10086号
            宜ICP备1008611号-5《网络文化经营许可证》文网文[2019]11/21号</span>
        </div>
        <div class="footer_span">
          <span style="font-size: 14px;color: #B1DFF6;">违法和不良信息举报电话： 1008611转4 举报邮箱：1533968491@qq.com</span>
        </div>
      </div>
    </div>
  </footer>
</body>

</html>