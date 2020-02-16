<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>书籍详情页</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/all/data/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/all/data/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/all/data/js/bootstrap.min.js"></script>   
    <!-- 引入toastr的js、css文件  -->
    <link href="${pageContext.request.contextPath }/all/data/css/toastr.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath }/all/data/js/toastr.min.js"></script>  
    <script>
        $(function() {
        	$("#comment_btn").click(function() {
        		$("#comment_form").submit();
        	});
            $("#bookshelfbtn").click(function() {
                toastr.options = {  
                    closeButton: false, //是否显示关闭按钮
                    debug: false,  //是否为调试
                    positionClass: "toast-center-center",  
                    onclick: jumpTo(),  
                    showDuration: "300",  //显示动作时间 
                    hideDuration: "1000",  //隐藏动作时间 
                    timeOut: "1000",  
                    showMethod: "fadeIn",  
                    hideMethod: "fadeOut"  
                };  
                toastr.success("添加书架成功");
            });
            /* 点击加入书架按钮后等待一秒后再跳转 */
            function jumpTo() {
                var t=1;
                setInterval(function() {
                    t--;
                    if(t==0) {
                        window.location.href = "${pageContext.request.contextPath }/AddBookToBookShelf?bs_account=${user.getUaccount() }&bs_bnum=${book.getBnum() }&collectiontimes=${book.getCollectiontimes()+1 }";
                    }
                },1000);
            }
        });
    </script>
    <style>
        body,html{background-color: #F5F5F5;display: flex;min-height: 100vh;flex-direction: column;}
        *{margin: 0;padding: 0;}
        .mag_top{margin-top: 10px;}
        .author{border-radius: 50%; border: 2px solid #FF8D7B;background-color: #FF8D7B;}
        .second{font-weight: 700; color: black;font-size: 18px;}
        header{background: #ffffff;}
        .footer_span{height: 40px;;text-align: center;line-height: 40px;}
        footer{background-color: #434343;min-height: 80px;}
        #center{flex: 1;}
        .book_img{width: 240px;height: 320px;}
    </style>
</head>
<body>
    <header class="container">
        <div class="row">
            <div class="col-md-8">
                <img src="${pageContext.request.contextPath }/all/book/logo.jpg" alt="logo" id="logo">
            </div>
            <div class="col-md-4">
                <div class="top1" style="margin-top: 12px; margin-left: 0px; height: 48px;">
                    <button class="btn btn-default author" type="button">欢迎您来到书酷</button>
                    <a class="btn " href="javascript:void(0);" role="button"><span style="font-weight: 700;font-size: 20px;">${user.getUaccount() }</span></a>
                    <a class="btn " href="${pageContext.request.contextPath}/LoginOutServlet" role="button"><span style="font-weight: 700;font-size: 20px;">注销</span></a>
                </div>
            </div>
        </div>
        <div class="row second">
            <nav class="navbar navbar-default" style="background-color: #ffffff;">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="${pageContext.request.contextPath }/jsp/index2.jsp"><span>首页</span></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath }/QueryBooksByPageServlet">书库</a></li>
                            <li><a href="${pageContext.request.contextPath}/BookRankingServlet">排行</a></li>
                            <li><a href="${pageContext.request.contextPath }/QueryBookShelfByPageServlet">书架</a></li>
                            <li><a href="${pageContext.request.contextPath}/QueryUserServlet">个人信息</a></li>
                            <li><a href="#">留言</a></li>
                            <c:if test="${user.getUaccount() == 'admin'}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/QueryUserByPageServlet">管理员界面</a>
                                </li>
                            </c:if>
                        </ul>
                        <!-- 搜索框 -->
                        <form class="navbar-form navbar-right" action="${pageContext.request.contextPath }/QueryBooksByPageServlet" method="get">
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
        <div class="row margin-top thumbnail">
            <div class="col-md-3">
                <img src="${pageContext.request.contextPath }/all/${book.getBimg() }" alt="书籍" class="book_img">
            </div>
            <div class="col-md-7 ">
                <span style="font-weight: 700;font-size: 30px;">${book.getBname() }</span><br><br>
                <span style="font-weight: 700;font-size: 20px;">${book.getBauthor() }&nbsp;著&nbsp;&nbsp;${book.getBcategory() }</span><br><br>
                <span style="font-size: 16px;">字数:</span><span style="font-weight: 700;font-size: 18px;">${book.getTotalwords() }万</span>&nbsp;&nbsp;
                <span style="font-size: 16px;">总阅读数:</span><span style="font-weight: 700;font-size: 18px;">${book.getReadtimes() }</span><br><br>
                <div style="height: 108px;"><span style="font-size: 16px;">${book.getBintroduction() }</span></div>
                <br>
                <a class="btn btn-default" href="${pageContext.request.contextPath }/BookContentServlet?bc_bnum=${book.getBnum() }&readtimes=${book.getReadtimes() +1}&collectiontimes=${book.getCollectiontimes() }" role="button" style="width: 220px; background-color: red;">开始阅读</a>
                
                <!-- 是否在书架 -->
                <c:if test="${IsInBookshelf==null || IsInBookshelf==''}">
	                <a class="btn btn-default" id="bookshelfbtn" href="javascript:void(0);" role="button" style="width: 102px;margin-left: 10px;border: 1px solid red;">加入书架</a>
                </c:if>
                <c:if test="${IsInBookshelf!=null && IsInBookshelf!=''}">
                    <a class="btn btn-default" href="${pageContext.request.contextPath }/QueryBookShelfByPageServlet" role="button" style="width: 102px;margin-left: 10px;border: 1px solid red;">已加入书架</a>
                </c:if>
            </div>
            <div class="cod-md-2"></div>
        </div>

        <!-- 评论专区 -->
        <div class="row thumbnail">
            <span style="font-weight: 700;font-size: 26px;">评论专区</span>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form id="comment_form" action="${pageContext.request.contextPath }/AddCommentsServlet?c_bnum=${book.getBnum() }&c_account=${user.getUaccount() }" method="POST">
                    <textarea class="form-control" rows="4" maxlength="300" style="border: 1px solid blue;font-size: 18px;"placeholder="来说几句吧..." name="comment"></textarea>
                </form>
            </div>
        </div>
        <button type="button" id="comment_btn" class="btn btn-primary" style="margin-top: 5px;margin-left: 1086px;">评论</button>
        <!-- 评论 -->
        <c:forEach items="${commentsparameterMap.getPageLists() }" var="c" varStatus="s">
	        <div class="row mag_top"> 
	            <div style="width: 1140px;margin: auto;border: 1px solid black;background-color: #FAFAFA;">
	               <div style="margin-left: 5px;">
	                   <p><span style="font-size: 25px;font-weight: 700;">${c.getC_account() }</span><span style="font-size: 20px;color: gray;line-height: 35px;margin-left: 10px;">#${s.count }楼</span></p>
	                   <!-- 如果ctype=0 -->
	                   <c:if test="${c.getCtype() ==0}">
	                      <p style="font-size: 15px;color: gray;"><span>${c.getUpdatetime() }</span> <span style="color: red;">审核已通过</span></p>
	                   </c:if>
	                   <!-- 如果ctype=1 -->
	                   <c:if test="${c.getCtype() ==1}">
	                      <p style="font-size: 15px;color: gray;">回复:<span style="color: red;">${c.getC_to_account() }</span> <span>${c.getUpdatetime() }</span> <span style="color: red;">审核已通过</span></p>
	                   </c:if>
	                   <span style="font-size: 16px;">${c.getCcontent() }</span>
	               </div>
	            </div>
	        </div>
        </c:forEach>
        <div class="row" style="font-size: 20px;">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <!-- 上一页 -->
                    <c:if test="${commentsparameterMap.getCurrentpageNum() == 1}">
                        <li class="disabled">
                    </c:if>
                    <c:if test="${commentsparameterMap.getCurrentpageNum() != 1}">
                        <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath }/QueryBookServlet?bnum=${book.getBnum() }&currentpageNum=${commentsparameterMap.getCurrentpageNum() -1}" aria-label="Previous pagination-lg">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    <!-- 页码 -->
                    <c:forEach begin="1" end="${commentsparameterMap.getTotalpage() }" var="i" step="1">
	                    <c:if test="${commentsparameterMap.getCurrentpageNum() ==i}">
	                       <li class="active">
	                    </c:if>
	                    <c:if test="${commentsparameterMap.getCurrentpageNum() !=i}">
                           <li>
                        </c:if>
	                    <a href="${pageContext.request.contextPath }/QueryBookServlet?bnum=${book.getBnum() }&currentpageNum=${i}">${i }</a></li>
                    </c:forEach>
                    <!-- 下一页 -->
                    <c:if test="${commentsparameterMap.getCurrentpageNum() == commentsparameterMap.getTotalpage()}">
                        <li class="disabled">
                    </c:if>
                    <c:if test="${commentsparameterMap.getCurrentpageNum() != commentsparameterMap.getTotalpage()}">
                        <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath }/QueryBookServlet?bnum=${book.getBnum() }&currentpageNum=${commentsparameterMap.getCurrentpageNum() +1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                    <span style="font-size: 20px;line-height: 45px  ;">共${commentsparameterMap.getTotaldata() }条数据,共${commentsparameterMap.getTotalpage() }页</span>
                </ul>
            </nav>
        </div>
    </div>
    <footer>
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
    </footer>
</body>
</html>