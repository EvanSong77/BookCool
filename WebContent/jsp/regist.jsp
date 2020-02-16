<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册页面</title>
    <style>
        *{margin: 0;padding: 0;}
        #bg_img{position: fixed; right: 0; bottom: 0; min-width: 100%; min-height: 100%;z-index: -100;}
        #regist {width: 650px; height: 680px;margin: auto;margin-top: 10px; background-color: rgba(255,255,255,0.7);}
        #regist h1 {font-size: 30px;color: #FF8150;margin-left: 170px;}
        #logo {height: 100px;width: 100px;}
        .id_number {height: 35px;width: 240px;background-color: rgba(255,255,255,0.3);border: 1px solid rgba(255,255,255,0.5);}
        .password_number {height: 35px;width: 240px;background-color: rgba(255,255,255,0.3);border: 1px solid rgba(255,255,255,0.5);}
        #write{width: 240px; height: 100px;border: 1px solid rgba(255,255,255,0.5);background-color: rgba(255,255,255,0.3);margin-top: 10px;}
        #regist_submit {font-size: 16px;background: #FF7F50;width:  240px;height: 35px;border: none;margin-top: 5px;}
        #register {font-size: 15px;margin-left: 100px; margin-top: 15px;}
        input{margin-top: 10px;}
        a{text-decoration: none; color: black;}
        form{margin-left: 100px;}
        input{padding: 5px;}
    </style>
    <script>
        var uaccount;
        var upwd;
        var reupwd;
        var uage;
        var uemail;

        var uaccountMsg;
        var upwdMsg;
        var reupwdMsg;
        var uageMsg;
        var uemailMsg;
        window.onload = function() {
            uaccount = document.getElementById("uaccount");
            upwd = document.getElementById("upwd");
            reupwd = document.getElementById("reupwd");
            uage = document.getElementById("uage");
            uemail = document.getElementById("uemail");

            uaccountMsg = document.getElementById("uaccountMsg");
            upwdMsg = document.getElementById("upwdMsg");
            reupwdMsg = document.getElementById("reupwdMsg");
            uageMsg = document.getElementById("uageMsg");
            uemailMsg = document.getElementById("uemailMsg");
        }
        function checkForm() {          //验证表单
            var checkaccount = checkAccount();
            var checkpwd = checkPwd();
            var checkrepwd = checkrePwd();
            var checkage = checkAge();
            var checkemail = checkEmail();
            return checkaccount && checkpwd && checkrepwd && checkage && checkemail ;    //return false后, 事件将被取消
        }
        function checkAccount() {       //验证用户账号
            var regex = /^.{6,16}$/;
            var value = uaccount.value;
            var msg = "";
            if(!value) {
                msg = "用户账号不能为空";
            }
            if(!regex.test(value)) {
                msg = "用户账号必须为任意字符6-16位"
            }
            uaccountMsg.innerHTML = msg;
            return msg == "";
        }
        function checkPwd() {       //验证用户密码
            var regex = /^.{6,16}$/;//任意字符6-16位
            var value = upwd.value;
            var msg = "";
            if(!value) {
                msg = "用户密码不能为空";
            }
            if(!regex.test(value)) {
                msg = "用户密码必须为任意字符6-16位"
            }
            upwdMsg.innerHTML = msg;
            return msg == "";
        }
        function checkrePwd() {       //验证用户确认密码
            var value1 = upwd.value;
            var value2 = reupwd.value;
            var msg = "";
            if(!value2) {
                msg = "确认密码不能为空";
            }
            if(value1!=value2) {
                msg = "两次输入的密码不一致";
            }
            reupwdMsg.innerHTML = msg;
            return msg == "";
        }
        function checkAge() {       //验证用户年龄
            var regex = /^([1-9]|[1-9][0-9]?|1[01][0-9]|120)$/;
            var value = uage.value;
            var msg = "";
            if (!regex.test(value)) {
                msg = "年龄不合法";
            }
            uageMsg.innerHTML = msg;
            return msg == "";
        }
        function checkEmail() {         // 验证邮箱
            var regex = /^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,4}$/;
            var value =uemail.value;
            var msg = "";
            if (!value) {
                msg = "邮箱必须填写";
            }
            if (!regex.test(value)) {
                msg = "邮箱格式不合法";
            }
            uemailMsg.innerHTML = msg;
            return msg == "";
        }
    </script>
</head>
<body>
    <img src="${pageContext.request.contextPath }/all/book/bg.jpg" id="bg_img">
    <div id="regist">
        <h1>注册</h1>
        <hr>
        <div>
            <form action="${pageContext.request.contextPath }/AddUserServlet" method="post" onsubmit="return checkForm();">
                <input type="text" class="id_number" id="uaccount" placeholder="账号" maxlength="16" style="font-size: 18px;"  onkeyup="checkAccount();" name="uaccount">
                <span id="uaccountMsg" style="width: 100px;"></span>
                <br>
                <input type="password" class="password_number" id="upwd" placeholder="密码" maxlength="16" style="font-size: 18px;" onkeyup="checkPwd();" name="upwd">
                <span id="upwdMsg" style="width: 100px;"></span>
                <br>
                <input type="password" class="password_number" id="reupwd" placeholder="重复密码" maxlength="16" style="font-size: 18px;" onkeyup="checkrePwd();" name="reupwd">
                <span id="reupwdMsg" style="width: 100px;"></span>
                <div>
                    性别:
                    <input type="radio" name="usex" id="man" value="男">男
                    <input type="radio" name="usex" id="woman" value="女">女
                </div>
                <input type="text" class="id_number" id="uage" placeholder="年龄" maxlength="3" style="font-size: 18px;" onkeyup="checkAge();" name="uage">
                <span id="uageMsg" style="width: 100px;"></span>
                <br>
                <input type="text" class="id_number" id="uemail" placeholder="邮箱" maxlength="18" style="font-size: 18px;" onkeyup="checkEmail();" name="uemail">
                <span id="uemailMsg" style="width: 100px;"></span>
                <br>
                <input type="text" class="id_number" id="utel" placeholder="联系电话" maxlength="11" style="font-size: 18px;" name="utel">
                <br>
                <input type="text" class="id_number" id="uaddress" placeholder="地址" maxlength="26" style="font-size: 18px;" name="uaddress">
                <br>
                <textarea id="write" cols="35" rows="10" id="uintroduction" placeholder="请输入个人说明:" style="font-size: 18px;"" name="uintroduction"></textarea>
                <br>
                <div>
                    <input type="submit" id="regist_submit" value="注册">
                </div>
            </form>
            <div id="register">
                <span style="font-size: 18px;">已有账号?马上<a href="${pageContext.request.contextPath  }/jsp/login.jsp"><b>登录</b></a></span>
            </div>
        </div>
    </div>
</body>
</html>