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
    <title>书库页面</title>
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
        .second{font-weight: 700; color: black;font-size: 18px;}
        header{background: #ffffff;}
        .footer_span{height: 40px;;text-align: center;line-height: 40px;}
        footer{min-height: 165px;}
        #footer{background-color: #434343;}
        .book_img{width: 100px;height: 130px;}
        #center{flex: 1;}
        a:hover{text-decoration: none;}
        .choose{color: red;}
    </style>
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
                            <li class="active"><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet">书库</a></li>
                            <li><a href="${pageContext.request.contextPath}/BookRankingServlet">排行</a></li>
                            <li><a href="${pageContext.request.contextPath}/QueryBookShelfByPageServlet">书架</a></li>
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
    <div class="container" id="center" style="background-color: #ffffff;">
        <div style="margin-left: 37px;">
	            <!-- Single button -->
	            <div class="btn-group">
            <c:if test="${bookparameterMap.bcategory==null||bookparameterMap.bcategory==''}">
	                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:#0EBB9A">
	                                                    全部<span class="caret"></span>
	                </button>
	                <ul class="dropdown-menu">
	                    <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=玄幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">玄幻</a></li>
	                    <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=科幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">科幻</a></li>
	                    <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=都市&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">都市</a></li>
	                    <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=仙侠&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">仙侠</a></li>
	                    <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=游戏&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">游戏</a></li>
	                    <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=古言&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">古言</a></li>
	                </ul>
            </c:if>
            <c:if test="${bookparameterMap.bcategory=='玄幻'}">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:#0EBB9A">
                                                        玄幻<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">全部</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=科幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">科幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=都市&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">都市</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=仙侠&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">仙侠</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=游戏&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">游戏</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=古言&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">古言</a></li>
                    </ul>
            </c:if>
            <c:if test="${bookparameterMap.bcategory=='科幻'}">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:#0EBB9A">
                                                        科幻<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">全部</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=玄幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">玄幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=都市&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">都市</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=仙侠&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">仙侠</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=游戏&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">游戏</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=古言&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">古言</a></li>
                    </ul>
            </c:if>
            <c:if test="${bookparameterMap.bcategory=='都市'}">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:#0EBB9A">
                                                        都市<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">全部</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=玄幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">玄幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=科幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">科幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=仙侠&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">仙侠</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=游戏&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">游戏</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=古言&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">古言</a></li>
                    </ul>
            </c:if>
            <c:if test="${bookparameterMap.bcategory=='仙侠'}">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:#0EBB9A">
                                                        仙侠<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">全部</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=玄幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">玄幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=科幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">科幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=都市&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">都市</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=游戏&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">游戏</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=古言&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">古言</a></li>
                    </ul>
            </c:if>
            <c:if test="${bookparameterMap.bcategory=='游戏'}">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:#0EBB9A">
                                                        游戏<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">全部</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=玄幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">玄幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=科幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">科幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=都市&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">都市</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=仙侠&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">仙侠</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=古言&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">古言</a></li>
                    </ul>
            </c:if>
            <c:if test="${bookparameterMap.bcategory=='古言'}">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color:#0EBB9A">
                                                        古言<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">全部</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=玄幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">玄幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=科幻&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">科幻</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=都市&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">都市</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=仙侠&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">仙侠</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=游戏&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">游戏</a></li>
                    </ul>
            </c:if>
                    <!-- 使用了字数排序 -->
                    <c:if test="${byWord !=null && byWord != ''}">
		                <a class="btn btn-default choose" href="javascript:void(0);" role="button" style="background-color: #0EBB9A;margin-left: 10px;border-radius: 10%;">字数</a>
                    </c:if>
                    <!-- 没使用了字数排序 -->
                    <c:if test="${byWord ==null || byWord == ''}">
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=${bookparameterMap.bcategory }&fparam=${fparam }&byWord=byWord&byTime=${byTime }" role="button" style="background-color: #0EBB9A;margin-left: 10px;border-radius: 10%;">字数</a>
                    </c:if>
	                <!-- 使用了时间排序 -->
	                <c:if test="${byTime != null && byTime != ''}">
                        <a class="btn btn-default choose" href="javascript:void(0);" role="button" style="background-color: #0EBB9A;margin-left: 10px;border-radius: 10%;">时间</a>
                    </c:if>
                    <!-- 没使用了时间排序 -->
                    <c:if test="${byTime == null || byTime == ''}">
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/QueryBooksByPageServlet?bcategory=${bookparameterMap.bcategory }&byTime=byTime&fparam=${fparam }&byWord=${byWord }" role="button" style="background-color: #0EBB9A;;margin-left: 10px;border-radius: 10%;">时间</a>
                    </c:if>
	            </div>
        </div>
        
        <!-- 书籍信息 -->
        <c:forEach items="${bookpages.getPageLists() }" var="l">
	        <div class="row thumbnail">
	            <div class="col-md-2">
	                <div><a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${l.bnum } "><img src="${pageContext.request.contextPath}/all/${l.bimg }" alt="书籍" class="book_img" style="height: 133px;"></a></div>
	            </div>
	            <div class="col-md-10">
	                <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${l.bnum }"><span style="font-weight: 700;font-size: 27px;">${l.bname }</span></a><br>
	                <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${l.bnum }"><span style="font-weight: 700;font-size: 18px;">${l.bauthor }</span></a><br>
	                <div style="height: 45px;"><a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${l.bnum }"><span style="color: black;">${l.bintroduction }</span></a></div>
	                <span style="border: 1px solid red;color: red;font-size: 16px;">${l.bcategory }</span>&nbsp;&nbsp;<span style="border: 1px solid blue;color: blue;font-size: 16px;">${l.totalwords }万</span>
	                &nbsp;<span style="border: 1px solid green;color: green;font-size: 16px;">阅读量:${l.readtimes }</span>
	                &nbsp;<span style="border: 1px solid orange;color: orange;font-size: 16px;">收藏量:${l.collectiontimes }</span>
	            </div>
	        </div>
        </c:forEach>
    </div>
    <footer><!--  navbar-fixed-bottom -->
        <div class="container" style="background-color: #ffffff;font-size: 20px;">
            <!-- 分页 -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${bookpages.getCurrentpageNum() == 1 }">
                        <li class="disabled">
                    </c:if>
                    <c:if test="${bookpages.getCurrentpageNum() != 1 }">
                        <li>
                    </c:if>
                        <a href="${pageContext.request.contextPath }/QueryBooksByPageServlet?currentpageNum=${bookpages.getCurrentpageNum() -1}&bcategory=${bookparameterMap.bcategory }&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${bookpages.getTotalpage() }" var="i">
                        <c:if test="${bookpages.getCurrentpageNum() == i }">
                            <li class="active">  
                        </c:if>
                        <c:if test="${bookpages.getCurrentpageNum() != i }">
                            <li>  
                        </c:if>
                           <a href="${pageContext.request.contextPath }/QueryBooksByPageServlet?currentpageNum=${i }&bcategory=${bookparameterMap.bcategory }&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }">${i }</a></li>
                    </c:forEach>
                    <c:if test="${bookpages.getCurrentpageNum() == bookpages.getTotalpage() }">
                        <li class="disabled">
                    </c:if>
                    <c:if test="${bookpages.getCurrentpageNum() != bookpages.getTotalpage() }">
                        <li>
                    </c:if>
                        <a href="${pageContext.request.contextPath }/QueryBooksByPageServlet?currentpageNum=${bookpages.getCurrentpageNum() +1 }&bcategory=${bookparameterMap.bcategory }&byTime=${byTime }&fparam=${fparam }&byWord=${byWord }" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <span style="font-size: 20px;line-height: 45px  ;">共${bookpages.getTotaldata() }条数据,共${bookpages.getTotalpage() }页</span>
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
