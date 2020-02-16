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
    <title>书架页面</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath }/all/data/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath }/all/data/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath }/all/data/js/bootstrap.min.js"></script>    
    <style>
        body,html{background-color: #F5F5F5;display: flex;min-height: 100vh;flex-direction: column;}
        *{margin: 0;padding: 0;}
        .mag_top{margin-top: 10px;}
        .author{border-radius: 50%; border: 2px solid #FF8D7B;background-color: #FF8D7B;}
        .second{font-weight: 700; color: black;font-size: 18px;}
        header{background: #ffffff;}
        .footer_span{height: 40px;;text-align: center;line-height: 40px;}
        footer{min-height: 165px;}
        #footer{background-color: #434343;}
        th,td{text-align: center;font-size: 17px;}
        .book_img{width: 100px;height: 130px;}
        #center{flex: 1;}
        #bg3{background: url('${pageContext.request.contextPath }/all/book/bg4.jpg'); height: 120px;}
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
                        //提交表单
                    	$("#deleteForm").submit();
                    }
                }
            });
        });
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
	                        <li class="active"><a href="${pageContext.request.contextPath}/QueryBookShelfByPageServlet">书架</a></li>
	                        <li><a href="${pageContext.request.contextPath}/QueryUserServlet">个人信息</a></li>
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
    <div class="container" style="background-color: #ffffff;" id="center">
        <div class="row" id="bg3"> 
            <div style="float: left;font-size: 16px;">
                <form class="form-inline" style="margin-top: 85px;font-weight: 700;" action="${pageContext.request.contextPath }/QueryBookShelfByPageServlet" method="post">
                    <div class="form-group">
                        <label for="exampleInputName2" style="color: red;">作品名</label>
                        <input type="text" class="form-control" id="exampleInputName2" placeholder="请输入作品名" name = "bname" value="${bookshelfparameterMap.bname[0] }"
                        style="background-color:transparent;border: 1px solid yellow;color: turquoise;">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail2" style="color: red;">作者名</label>
                        <input type="text" class="form-control" id="exampleInputEmail2" placeholder="请输入作者名" name="bauthor" value="${bookshelfparameterMap.bauthor[0] }"
                        style="background-color:transparent;border: 1px solid yellow;color: turquoise;">
                    </div>
                    <button type="submit" class="btn btn-default" style="background-color: turquoise;">查询</button>
                </form>
            </div>
            <div style="float: right;margin-right: 60px;margin-top: 85px;"><a href="javascript:void(0);" class="btn btn-primary" role="button" id="deleteSelect" >移出所选</a></div>
        </div>
        <div class="row mag_top" style="text-align: center;">
            <form action="${pageContext.request.contextPath}/DeleteBookFromBookShelf" method="post" id="deleteForm">
	            <table border="1" class="table table-bordered table-hover" style="text-align: center;">
	                <tr class="success">
	                    <th><input type="checkbox" id="checkAll"></th>
	                    <th>编号</th>
	                    <th>分类</th>
	                    <th>作品信息</th>
	                    <th>作者</th>
	                    <th>加入时间</th>
	                    <th>操作</th>
	                </tr>
	                <c:forEach items="${bookshelfpages.getPageLists()}" var="l" varStatus="s">
		                <tr>
		                    <td><input type="checkbox" name="checkItem" value="${l.getBs_bnum() }" class="checkItem" style="width: 25px;height: 25;"></td>
		                    <td>${s.count }</td>
		                    <td>${l.getBook().getBcategory() }</td>
		                    <td>${l.getBook().getBname() }</td>
		                    <td>${l.getBook().getBauthor() }</td>
		                    <td>${l.getBstime() }</td>
		                    <td><a class="btn btn-default" href="${pageContext.request.contextPath}/DeleteBookFromBookShelf?bs_bnum=${l.getBs_bnum() }" role="button">移出书架</a></td>
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
                <c:if test="${bookshelfpages.getCurrentpageNum()<=1}">
                    <li class="disabled">
                </c:if>
                <c:if test="${bookshelfpages.getCurrentpageNum()>1}">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/QueryBookShelfByPageServlet?currentpageNum=${bookshelfpages.getCurrentpageNum()-1 }" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    <c:forEach begin="1" end="${bookshelfpages.getTotalpage() }" var="i" step="1">
                        <c:if test="${i == bookshelfpages.getCurrentpageNum()}">
                            <li class="active">
                        </c:if>
                        <c:if test="${i != bookshelfpages.getCurrentpageNum()}">
                            <li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/QueryBookShelfByPageServlet?currentpageNum=${i} ">${i}</a></li>
                    </c:forEach>
                    
                    <c:if test="${bookshelfpages.getCurrentpageNum()>=bookshelfpages.getTotalpage()}">
                        <li class="disabled">
                    </c:if>
                    <c:if test="${bookshelfpages.getCurrentpageNum()<bookshelfpages.getTotalpage()}">
                        <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/QueryBookShelfByPageServlet?currentpageNum=${bookshelfpages.getCurrentpageNum()+1 }" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                    <span style="font-size: 20px;line-height: 45px;">共${bookshelfpages.getTotaldata() }条数据,共${bookshelfpages.getTotalpage() }页</span>
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