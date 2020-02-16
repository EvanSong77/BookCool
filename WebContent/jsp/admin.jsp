<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>管理员界面</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/all/data/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/all/data/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/all/data/js/bootstrap.min.js"></script>    
    <style>
        body,html{background-color: #F5F5F5;display: flex;min-height: 100vh;flex-direction: column;}
        *{margin: 0;padding: 0;}
        .mag_top{margin-top: 10px;}
        .author{border-radius: 50%; border: 2px solid #FF8D7B;background-color: #FF8D7B;}
        header{background: #ffffff;border-bottom: 1px solid #F5F5F5;}
        .footer_span{height: 40px;;text-align: center;line-height: 40px;}
        footer{min-height: 164px;}
        #footer{background-color: #434343;}
        th,td{text-align: center;font-size: 17px;}
        #center{flex: 1;}
    </style>
    <script>
        $(function() {
            $("#checkAll").click(function() {
                $(".checkItem").prop("checked",this.checked);
            });
            $("#deleteSelect").click(function() {
                var flag = false;
                var boxs = $(".checkItem");
                //遍历所有单选框
                for(var i = 0; i < (boxs.length); i++) {
                    if(boxs[i].checked) {
                        flag = true;
                    }
                }
                if(flag) {
                    if(confirm("是否删除所选")) {
                        $("#deleteForm").submit();
                    }
                }
            });
           /*  $(".deleteThis").click(function() {
                if(confirm("是否删除该用户")) {
                    window.location.href = "${pageContext.request.contextPath }/DeleteUserServlet?uaccount=${l.getUaccount() }";
                }
            }); */
        });
    </script>
</head>
<body>
    <header class="container">
        <div class="row">
            <div class="col-md-8">
                <a href="${pageContext.request.contextPath}/jsp/index2.jsp">
                    <img src="${pageContext.request.contextPath}/all/book/logo.jpg" alt="logo" id="logo">
                </a>
                <a class="btn" href="${pageContext.request.contextPath}/QueryUserByPageServlet" role="button"><span style="font-weight: 700;font-size: 20px;">用户信息</span></a>
                <a class="btn" href="${pageContext.request.contextPath}/QueryCommentsByPageServlet" role="button"><span style="font-weight: 700;font-size: 20px;">评论审核</span></a>
            </div>
            <div class="col-md-4">
                <div class="top1" style="margin-top: 12px; margin-left: 40px; height: 48px;">
                    <button class="btn btn-default author" type="submit">书酷管理员您好</button>
                    <a class="btn" href="#" role="button"><span style="font-weight: 700;font-size: 20px;">${user.getUaccount() }</span></a>
                    <a class="btn" href="${pageContext.request.contextPath}/LoginOutServlet" role="button"><span style="font-weight: 700;font-size: 20px;">注销</span></a>
                </div>
            </div>
        </div>
    </header>  
    <div class="container" style="background-color: #ffffff;" id="center">
        <div class="row" style="text-align: center;">
            <span style="font-size: 27px;font-weight: 700;">用户信息列表</span>
        </div>
        <br>
        <div class="row" id="bg3"> 
            <div style="float: left;font-size: 15px;">
                <form class="form-inline" action="${pageContext.request.contextPath}/QueryUserByPageServlet" method="post">
                    <div class="form-group">
                        <label for="exampleInputName2" >账号</label>
                        <input type="text" class="form-control" id="exampleInputName2" placeholder="请输入账号" name="uaccount" value="${userparameterMap.uaccount[0] }">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail2">地址</label>
                        <input type="text" class="form-control" id="exampleInputEmail2" placeholder="请输入地址" name="uaddress" value="${userparameterMap.uaddress[0] }">
                    </div>
                    <div class="form-group">
                            <label for="exampleInputEmail3">用户权限</label>
                            <input type="text" class="form-control" id="exampleInputEmail3" placeholder="请输入权限" name="role" value="${userparameterMap.role[0] }">
                        </div>
                    <button type="submit" class="btn btn-default" style="background-color: turquoise;">查询</button>
                </form>
            </div>
            <div style="float: right;"><a href="javascript:void(0);" class="btn btn-primary" role="button" id="deleteSelect" >移出所选</a></div>
        </div>
        <div class="row mag_top" style="text-align: center;">
            <form action="${pageContext.request.contextPath}/DeleteUserServlet" method="post" id="deleteForm">
                <table border="1" class="table table-bordered table-hover">
                    <tr class="success">
                        <th><input type="checkbox" id="checkAll"></th>
                        <th>编号</th>
                        <th>用户账号</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>邮箱</th>
                        <th>电话</th>
                        <th>地址</th>
                        <th>权限</th>
                        <th>注册时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${userpages.getPageLists() }" var="l" varStatus="s">
	                    <tr>
	                        <td>
	                           <c:if test="${l.getUaccount() == 'admin'}">
                               </c:if>
                               <c:if test="${l.getUaccount() != 'admin'}">
                                   <input type="checkbox" name="selectBox" value="${l.getUaccount() }" class="checkItem" style="width: 25px;height: 25;">
                               </c:if>
	                        </td>
	                        <td>${s.count }</td>
	                        <td>${l.getUaccount() }</td>
	                        <td>${l.getUsex() }</td>
	                        <td>${l.getUage() }</td>
	                        <td>${l.getUemail() }</td>
	                        <td>${l.getUtel() }</td>
	                        <td>${l.getUaddress() }</td>
	                        <td>${l.getRole() }</td>
	                        <td>${l.getUregistTime() }</td>
	                        <td>
		                        <c:if test="${l.getRole() == '管理员'}">
		                        </c:if>
		                        <c:if test="${l.getRole() != '管理员'}">
		                            <a class="btn btn-default deleteThis" href="${pageContext.request.contextPath }/DeleteUserServlet?uaccount=${l.getUaccount() }" role="button">删除</a>
	                            </c:if>
	                        </td>
	                    </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>
    <footer>
        <div class="container" style="background-color: #ffffff;font-size: 20px;">
            <!-- 分页 -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                <c:if test="${userpages.getCurrentpageNum() <= 1}">
                    <li class="disabled">
                </c:if>
                <c:if test="${userpages.getCurrentpageNum() >1 }">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/QueryUserByPageServlet?currentpageNum=${userpages.getCurrentpageNum()-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    
                    <c:forEach begin="1" end="${userpages.getTotalpage() }" var="i" step="1">
                        <c:if test="${i == userpages.getCurrentpageNum()}">
                            <li class="active">
                        </c:if>
                        <c:if test="${i != userpages.getCurrentpageNum()}">
                            <li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/QueryUserByPageServlet?currentpageNum=${i}">${i }</a></li>
                    </c:forEach>
                    
                    <c:if test="${userpages.getCurrentpageNum() >= userpages.getTotalpage()}">
                        <li class="disabled">
                    </c:if>
                    <c:if test="${userpages.getCurrentpageNum() < userpages.getTotalpage()}">
                        <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/QueryUserByPageServlet?currentpageNum=${userpages.getCurrentpageNum()+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                    <span style="font-size: 20px;line-height: 45px  ;">共条${userpages.getTotaldata() }数据,共${userpages.getTotalpage() }页</span>
                </ul>
            </nav>
        </div>
        <div id="footer" style="width: 100%;">
            <div class="container">
                <div class="row">
                    <div class="footer_span">
                        <span style="font-size: 14px;color: #B1DFF6;">书酷小说版权所有，未经许可不得转载      宜ICP证10086号  宜ICP备1008611号-5《网络文化经营许可证》文网文[2019]11/21号</span>
                    </div>
                    <div class="footer_span">
                        <span style="font-size: 14px;color: #B1DFF6;">违法和不良信息举报电话： 1008611转4 举报邮箱：1533968491@qq.com</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body> 