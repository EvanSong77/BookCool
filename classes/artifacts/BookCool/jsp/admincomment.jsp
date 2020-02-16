<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>管理员评论审核界面</title>
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
            <span style="font-size: 27px;font-weight: 700;">评论审核列表</span>
        </div>
        <br>
        <div class="row mag_top" style="text-align: center;">
            <form action="${pageContext.request.contextPath}/DeleteSelectUserServlet" method="post" id="deleteForm">
                <table border="1" class="table table-bordered table-hover" style="table-layout:fixed;width: 1170px;">
                    <tr class="success">
                        <th>编号</th>
                        <th>用户账号</th>
                        <th>内容</th>
                        <th>评论时间</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${allCommentsPage.getPageLists() }" var="l" varStatus="s">
                        <tr>
                            <td>${s.count }</td>
                            <td>${l.getC_account() }</td>
                            <td style="word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
                                <button type="button" style="border: none;" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="${l.getCcontent() }">${l.getCcontent() }</button>
                            </td>
                            <td>${l.getCtime() }</td>
                            <td>${l.getState() }</td>
                            <td>
                                <c:if test="${l.getState() == 1}">
                                    <a class="btn btn-default deleteThis" href="javascript:void(0);" role="button" style="background-color: red;">已通过</a>
                                </c:if>
                                <c:if test="${l.getState() == 0}">
                                    &nbsp;&nbsp;&nbsp;<a class="btn btn-default deleteThis" href="${pageContext.request.contextPath}/UpdateCommentStateServlet?cid=${l.getCid() }" role="button">通过</a>
                                </c:if>
                                <a class="btn btn-default deleteThis" href="${pageContext.request.contextPath}/DeleteCommentServlet?cid=${l.getCid() } " role="button">删除</a>
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
                <c:if test="${allCommentsPage.getCurrentpageNum() <= 1}">
                    <li class="disabled">
                </c:if>
                <c:if test="${allCommentsPage.getCurrentpageNum() >1 }">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/QueryCommentsByPageServlet?currentpageNum=${allCommentsPage.getCurrentpageNum()-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    
                    <c:forEach begin="1" end="${allCommentsPage.getTotalpage() }" var="i" step="1">
                        <c:if test="${i == allCommentsPage.getCurrentpageNum()}">
                            <li class="active">
                        </c:if>
                        <c:if test="${i != allCommentsPage.getCurrentpageNum()}">
                            <li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/QueryCommentsByPageServlet?currentpageNum=${i}">${i }</a></li>
                    </c:forEach>
                    
                    <c:if test="${allCommentsPage.getCurrentpageNum() >= allCommentsPage.getTotalpage()}">
                        <li class="disabled">
                    </c:if>
                    <c:if test="${allCommentsPage.getCurrentpageNum() < allCommentsPage.getTotalpage()}">
                        <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/QueryCommentsByPageServlet?currentpageNum=${allCommentsPage.getCurrentpageNum()+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                    <span style="font-size: 20px;line-height: 45px  ;">共条${allCommentsPage.getTotaldata() }数据,共${allCommentsPage.getTotalpage() }页</span>
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
</html>