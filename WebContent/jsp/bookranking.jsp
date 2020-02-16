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
    <title>书酷排行榜页面</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/all/data/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/all/data/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/all/data/js/bootstrap.min.js"></script> 
    <link rel="stylesheet" href="${pageContext.request.contextPath }/all/data/css/ranking.css">
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
        a:hover{text-decoration: none;}
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
                            <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet">书库</a></li>
                            <li class="active"><a href="${pageContext.request.contextPath}/BookRankingServlet">排行</a></li>
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

    <!-- 中间部分 -->
    <div id="center" class="container" style="background-color: #ffffff;">
        <div class="row">
            <div class="col-md-3">
                <!-- 阅读榜 -->
                <div class="chartsSame">
                    <div class="ListFirst">
                        <h3>阅读榜</h3>
                    </div>
                    <!-- 第一名 -->
                    <div class="booksNo_01">
                        <!-- 书的文本部分 -->
                        <div class="bookText">
                            <!-- 书名 -->
                            <div class="bookName">
                                <span class="no01">1</span>&nbsp;
                                <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${readtimesBookRanking.get(0).getBnum() } "><span style="font-size: 18px;">${readtimesBookRanking.get(0).getBname() }</span></a>
                            </div>
                            <!-- 作者 -->
                            <div class="bookAuthor"><span>${readtimesBookRanking.get(0).getBauthor() }</span></div>
                            <!-- 类别 -->
                            <div class="bookCategory"><span>[${readtimesBookRanking.get(0).getBcategory() }]</span></div>
                            <span style="font-size: 13px;color: #999;margin-left: 30px;">${readtimesBookRanking.get(0).getReadtimes() }</span>
                        </div>
                        <!-- 书的图片 -->
                        <div class="bookImg"><a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${readtimesBookRanking.get(0).getBnum() }"><img src="${pageContext.request.contextPath }/all/${readtimesBookRanking.get(0).getBimg() }" style="height: 90px;"></a></div>
                    </div>
                    <!-- 第二名 -->
                    <div class="booksNo_02">
                        <span class="no02">2</span>&nbsp;
                        <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${readtimesBookRanking.get(1).getBnum() }">${readtimesBookRanking.get(1).getBname() }</a>
                        <span class="monthlyVotesRight">${readtimesBookRanking.get(1).getReadtimes() }</span>
                    </div>
                    <!-- 第三名 -->
                    <div class="booksNo_02">
	                    <span class="no03">3</span>&nbsp;
	                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${readtimesBookRanking.get(2).getBnum() }">${readtimesBookRanking.get(2).getBname() }</a>
	                    <span class="monthlyVotesRight">${readtimesBookRanking.get(2).getReadtimes() }</span>
                    </div>
                    <!-- 前三名后面的 -->
                    <c:forEach begin="3" end="${readtimesBookRanking.size() -1}" var="r" varStatus="s" step="1">
	                    <div class="booksNo_02">
		                    <span class="no04">${s.count+3}</span>&nbsp;
		                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${readtimesBookRanking.get(r).getBnum() }">${readtimesBookRanking.get(r).getBname() }</a>
		                    <span class="monthlyVotesRight">${readtimesBookRanking.get(r).getReadtimes() }</span>
	                    </div>
                    </c:forEach>
                </div>
            </div>
            
            <div class="col-md-3">
                <!-- 收藏榜 -->
                <div class="chartsSame">
                    <div class="ListFirst">
                        <h3>收藏榜</h3>
                    </div>
                    <!-- 第一名 -->
                    <div class="booksNo_01">
                        <!-- 书的文本部分 -->
                        <div class="bookText">
                            <!-- 书名 -->
                            <div class="bookName">
                                <span class="no01">1</span>&nbsp;
                                <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${collectiontimesRanking.get(0).getBnum() }"><span style="font-size: 18px;">${collectiontimesRanking.get(0).getBname() }</span></a>
                            </div>
                            <!-- 作者 -->
                            <div class="bookAuthor"><span>${collectiontimesRanking.get(0).getBauthor() }</span></div>
                            <!-- 类别 -->
                            <div class="bookCategory"><span>[${collectiontimesRanking.get(0).getBcategory() }]</span></div>
                            <span style="font-size: 13px;color: #999;margin-left: 30px;">${collectiontimesRanking.get(0).getCollectiontimes() }</span>
                        </div>
                        <!-- 书的图片 -->
                        <div class="bookImg"><a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${collectiontimesRanking.get(0).getBnum() }"><img src="${pageContext.request.contextPath }/all/${collectiontimesRanking.get(0).getBimg() }" style="height: 90px;"></a></div>
                    </div>
                    <!-- 第二名 -->
                    <div class="booksNo_02">
                        <span class="no02">2</span>&nbsp;
                        <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${collectiontimesRanking.get(1).getBnum() }">${collectiontimesRanking.get(1).getBname() }</a>
                        <span class="monthlyVotesRight">${collectiontimesRanking.get(1).getCollectiontimes() }</span>
                    </div>
                    <!-- 第三名 -->
                    <div class="booksNo_02">
                        <span class="no03">3</span>&nbsp;
                        <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${collectiontimesRanking.get(2).getBnum() }">${collectiontimesRanking.get(2).getBname() }</a>
                        <span class="monthlyVotesRight">${collectiontimesRanking.get(2).getCollectiontimes() }</span>
                    </div>
                    <!-- 前三名后面的 -->
                    <c:forEach begin="3" end="${collectiontimesRanking.size() -1}" var="r" varStatus="s" step="1">
                        <div class="booksNo_02">
                            <span class="no04">${s.count+3 }</span>&nbsp;
                            <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${collectiontimesRanking.get(r).getBnum() }">${collectiontimesRanking.get(r).getBname() }</a>
                            <span class="monthlyVotesRight">${collectiontimesRanking.get(r).getCollectiontimes() }</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
            
            <div class="col-md-3">
                <!-- 新书榜 -->
                <div class="chartsSame">
                    <div class="ListFirst">
                        <h3>新书榜</h3>
                    </div>
                    <!-- 第一名 -->
                    <div class="booksNo_01">
                        <!-- 书的文本部分 -->
                        <div class="bookText">
                            <!-- 书名 -->
                            <div class="bookName">
                                <span class="no01">1</span>&nbsp;
                                <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${btimeRanking.get(0).getBnum() }"><span style="font-size: 18px;">${btimeRanking.get(0).getBname() }</span></a>
                            </div>
                            <!-- 作者 -->
                            <div class="bookAuthor"><span>${btimeRanking.get(0).getBauthor() }</span></div>
                            <!-- 类别 -->
                            <div class="bookCategory"><span>[${btimeRanking.get(0).getBcategory() }]</span></div>
                        </div>
                        <!-- 书的图片 -->
                        <div class="bookImg"><a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${btimeRanking.get(0).getBnum() }"><img src="${pageContext.request.contextPath }/all/${btimeRanking.get(0).getBimg() }" style="height: 90px;"></a></div>
                    </div>
                    <!-- 第二名 -->
                    <div class="booksNo_02">
                        <span class="no02">2</span>&nbsp;
                        <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${btimeRanking.get(1).getBnum() }">${btimeRanking.get(1).getBname() }</a>
                    </div>
                    <!-- 第三名 -->
                    <div class="booksNo_02">
                        <span class="no03">3</span>&nbsp;
                        <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${btimeRanking.get(2).getBnum() }">${btimeRanking.get(2).getBname() }</a>
                    </div>
                    <!-- 前三名后面的 -->
                    <c:forEach begin="3" end="${btimeRanking.size() -1}" var="r" varStatus="s" step="1">
                        <div class="booksNo_02">
                            <span class="no04">${s.count+3 }</span>&nbsp;
                            <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=${btimeRanking.get(r).getBnum() }">${btimeRanking.get(r).getBname() }</a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            
            <div class="col-md-3">
                <!-- 推荐榜 -->
                <div class="newBook chartsSame">
                    <div class="ListFirst">
                        <h3>推荐榜</h3>
                    </div>
                    <!-- 第一名 -->
                    <div class="booksNo_01">
	                    <!-- 书的文本部分 -->
	                    <div class="bookText">
	                        <!-- 书名 -->
	                        <div class="bookName">
	                        <span class="no01">1</span>&nbsp;
	                        <a href="#"><span style="font-size: 18px;">出人头地</span></a>
	                        </div>
	                        <!-- 作者 -->
	                        <div class="bookAuthor"><span>荒唐镜</span></div>
	                        <!-- 类别 -->
	                        <div class="bookCategory"><span>[都市]</span></div>
	                    </div>
	                    <!-- 书的图片 -->
	                    <div class="bookImg"><a href="#"><img src="${pageContext.request.contextPath }/all/book/d5.jpg" style="height: 90px;"></a></div>
                    </div>
                    <!-- 第二名 -->
                    <div class="booksNo_02">
                    <span class="no02">2</span>&nbsp;
                    <a href="#">赘婿神医</a>
                    </div>
                    <!-- 第三名 -->
                    <div class="booksNo_02">
                    <span class="no03">3</span>&nbsp;
                    <a href="#">废婿当道</a>
                    </div>
                    <!-- 剩下的 -->
                    <div class="booksNo_02">
                    <span class="no04">4</span>&nbsp;
                    <a href="#">梦武轮回</a>
                    </div>
                    <div class="booksNo_02">
                    <span class="no04">5</span>&nbsp;
                    <a href="#">都市至尊仙帝</a>
                    </div>
                    <div class="booksNo_02">
                    <span class="no04">6</span>&nbsp;
                    <a href="#">武道剑主</a>
                    </div>
                    <div class="booksNo_02">
                    <span class="no04">7</span>&nbsp;
                    <a href="#">三界改造计划</a>
                    </div>
                    <div class="booksNo_02">
                    <span class="no04">8</span>&nbsp;
                    <a href="#">地府引路人</a>
                    </div>
                    <div class="booksNo_02">
                    <span class="no04">9</span>&nbsp;
                    <a href="#">霸气纵横九万里</a>
                    </div>
                    <div class="booksNo_02">
                    <span class="no04">10</span>&nbsp;
                    <a href="#">都市绝品狂尊</a>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <div class="container" style="background-color: #ffffff;height: 20px;"></div>
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