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
    <title>书酷首页</title>
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/all/data/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/all/data/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/all/data/js/bootstrap.min.js"></script>
    <!-- 导入音乐播放CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/all/data/css/player.css">
    <style>
        body{background-color: #F5F5F5;}
        *{margin: 0;padding: 0;}
        #logo{width: 120px;height: 60px;}
        .mag_top{margin-top: 10px;}
        .second{font-weight: 700; color: black;font-size: 18px;}
        .author{border-radius: 50%; border: 2px solid #FF8D7B;background-color: #FF8D7B;}
        .books{width: 120px;}
        .footer_span{height: 40px;;text-align: center;line-height: 40px;}
        header{background: #ffffff;}
        footer{background-color: #434343;}
        /* 下面是日历表的属性 */
        #calendar{text-align: center; background: url(${pageContext.request.contextPath}/all/book/bg.jpg);height: 500px;}
        #p_month{font-size: 45px;font-weight: 700;}
        #p_year{font-size: 30px;font-weight: 700;}
        #week{width: 380px;margin: auto;}
        #calendar ul{list-style-type: none;}
        #calendar li{width: 30px;height: 30px;text-align: center;line-height: 30px;font-size: 22px;float: left;margin: 12px;}
        .current{color: red;font-weight: 700};
    </style>
    <script>
        /* 显示日历上的年月日的函数 */
        window.onload = function() {
        	bgChange();
            var date = new Date();//日期
            var year = date.getFullYear();//年
            var month = date.getMonth()+1;//月
            var day = date.getDate();//日
            show(year,month,day);
        }
        function show(year,month,day) {
            //在页面显示年份
            document.getElementById("p_year").innerText = year+"年";
            //在页面显示月份
            document.getElementById("p_month").innerText = month+"月";
            var isLeapYear = false;//是否是闰年
            var dayArray = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];//每个月对应的天数
            if((month%4==0&&month%100!=0) || month%400==0) {//是闰年
                isLeapYear = true;
                dayArray[1]--;//二月天数28天
            }
            //获取每个月一号的星期
            var weekday = getFirstDay(); 
            var ul_weekday = document.getElementById("ul_weekday");
            ul_weekday .innerHTML = "";
            for(var i = 0; i < weekday; i++) {
                ul_weekday.innerHTML += "<li></li>";//添加空白li标签
            }
            for(var i = 1; i <= dayArray[month-1]; i++) {
                if(i==day) {
                    ul_weekday.innerHTML += "<li class='current'>"+i+"</li>";
                }else {
                ul_weekday.innerHTML += "<li>"+i+"</li>";//添加
                }
            }
        }
        /* 获取每个月第一天的星期数的函数 */
        function getFirstDay() {
            var date = new Date();
            //设置日期为当月一号
            date.setDate(1);
            //得到当天的星期
            var weekday = date.getDay();
            return weekday;
        }
        var dd = new Date();//日期
        var y = dd.getFullYear();//年
        var m = dd.getMonth()+1;//月
        var d = dd.getDate();//日
        /* left */
        function left() {
            m=m-1;
            if(m==0) {
                m=12;
                y--;
            }
            show(y,m,d);
        }
        /* left */
        function right() {
            m++;
            if(m==13) {
                m=1;
                y++;
            }
            show(y,m,d);
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
                <div style="margin-top: 12px; margin-left: 0px; height: 48px;">
                    <button class="btn btn-default author" type="button">欢迎您来到书酷</button>
                    <c:if test="${user.getUaccount() !=null}">
	                    <a class="btn" href="javascript:void(0);" role="button"><span style="font-weight: 700;font-size: 20px;">${user.getUaccount() }</span></a>
                        <a class="btn" href="${pageContext.request.contextPath}/LoginOutServlet" role="button"><span style="font-weight: 700;font-size: 20px;">注销</span></a>
                    </c:if>
                    <c:if test="${user.getUaccount() ==null}">
                        <a class="btn" href="${pageContext.request.contextPath}/jsp/login.jsp" role="button"><span style="font-weight: 700;font-size: 20px;">登录</span></a>
                        <a class="btn" href="${pageContext.request.contextPath}/jsp/regist.jsp" role="button"><span style="font-weight: 700;font-size: 20px;">注册</span></a>
                    </c:if>
                    
                </div>
            </div>
        </div>
        <div class="row second">
            <nav class="navbar navbar-default" style="background-color: #ffffff;">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/index2.jsp"><span style="color: black;">首页</span></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath}/QueryBooksByPageServlet">书库</a></li>
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
    <div class="container">
        <!-- 轮播图 -->
        <div class="row">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="${pageContext.request.contextPath}/all/book/Carousel_1.jpg" alt="1" style="width: 100%;">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/all/book/Carousel_2.jpg" alt="2" style="width: 100%;">
                    </div>
                </div>
                
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                </a>
            </div>
        </div>
    </div>
    <div class="container mag_top" style="background: #ffffff;text-align: center;">
        <div class="row mag_top">
            <div class="col-md-2">
                <span style="font-size: 25px;font-weight: 700; color: red;">书酷热度榜</span>
                <div class="thumbnail mag_top">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=2"><img src="${pageContext.request.contextPath}/all/book/a2.jpg" alt="book_a2" class="books" style="height: 180px;"></a>
                    <span style="margin-left: 15px;"><b>圣墟 作者:辰东</b></span>
                </div>
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=10"><img src="${pageContext.request.contextPath}/all/book/a10.jpg" alt="book_a10" class="books" style="height: 180px;"></a>
                    <span style="margin-left: 15px;"><b>斗破苍穹 作者:天蚕土豆</b></span>
                </div>
            </div>
           
             <!-- 日历 -->
            <div class="col-md-10 thumbnail" id="calendar" style="margin-top: 15px;">
                <a class="left carousel-control" href="javascript:left();" role="button" id="left">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="javascript:right();" role="button" id="right">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
                <div id="d_month"><span id="p_month"></span></div>
                <p id="p_year"></p>
                <div id="week">
                    <ul>
                        <li>日</li>
                        <li>一</li>
                        <li>二</li>
                        <li>三</li>
                        <li>四</li>
                        <li>五</li>
                        <li>六</li>
                    </ul>
                    <ul id="ul_weekday">
                    </ul>
                </div>
            </div>
        </div>
    </div>  
    <div class="container mag_top">
        <div class="row"> 
            <img src="${pageContext.request.contextPath}/all/book/bg2.jpg" alt="bg2">
        </div>
    </div>
    <div class="container mag_top" style="background: #ffffff;">
        <div class="row">
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=1"><img src="${pageContext.request.contextPath}/all/book/a1.jpg" alt="book_a1" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>元尊 作者:天蚕土豆</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=16"><img src="${pageContext.request.contextPath}/all/book/b1.jpg" alt="book_b1" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>九星毒奶 作者:育</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=31"><img src="${pageContext.request.contextPath}/all/book/c1.jpg" alt="book_c1" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                            <span><b>凡人修仙之仙界篇 作者:忘语</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=46"><img src="${pageContext.request.contextPath}/all/book/d1.jpg" alt="book_d1" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                            <span><b>都市极品医神 作者:风会笑</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=61"><img src="${pageContext.request.contextPath}/all/book/e1.jpg" alt="book_e1" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                            <span><b>轮回乐园 作者:那一只蚊子</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=76"><img src="${pageContext.request.contextPath}/all/book/f1.jpg" alt="book_f1" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                            <span><b>邪王追妻：废材逆天小姐 作者:苏小暖</b></span>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <div class="container mag_top" style="background: #ffffff;">
        <br>
        <div class="row">
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=4"><img src="${pageContext.request.contextPath}/all/book/a4.jpg" alt="book_a4" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>全职法师 作者:乱</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=19"><img src="${pageContext.request.contextPath}/all/book/b4.jpg" alt="book_b4" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>吞噬星空 作者:我吃西红柿</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=34"><img src="${pageContext.request.contextPath}/all/book/c4.jpg" alt="book_c4" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>诛仙 作者:萧鼎</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=49"><img src="${pageContext.request.contextPath}/all/book/d4.jpg" alt="book_d4" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>修真聊天群 作者:圣骑士的传说</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=64"><img src="${pageContext.request.contextPath}/all/book/e4.jpg" alt="book_e4" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>重生之最强剑神 作者:天运老猫</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=79"><img src="${pageContext.request.contextPath}/all/book/f4.jpg" alt="book_f4" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>纨绔世子妃 作者:西子情</b></span>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <div class="container mag_top" style="background: #ffffff;">
        <br>
        <div class="row">
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=9"><img src="${pageContext.request.contextPath}/all/book/a9.jpg" alt="book_a9" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>万古神帝 作者:飞天鱼</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=24"><img src="${pageContext.request.contextPath}/all/book/b9.jpg" alt="book_b9" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>黎明之剑 作者:远瞳</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=39"><img src="${pageContext.request.contextPath}/all/book/c9.jpg" alt="book_c9" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>仙逆 作者:耳根</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=54"><img src="${pageContext.request.contextPath}/all/book/d9.jpg" alt="book_d9" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>最强医圣 作者:左耳思念</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=69"><img src="${pageContext.request.contextPath}/all/book/e9.jpg" alt="book_e9" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>网游之最强 作者:八二年自</b></span>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/QueryBookServlet?bnum=84"><img src="${pageContext.request.contextPath}/all/book/f9.jpg" alt="f9" class="books" style="height: 160px;"></a>
                    <div style="text-align: center;height: 35px;margin-top: 5px;">
                        <span><b>香蜜沉沉烬如霜 作者:电线</b></span>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <footer class="container-fluid mag_top footer">
        <div class="container">
            <div class="row">
                <div class="footer_span">
                    <span style="font-size: 14px;color: #B1DFF6;">书酷小说版权所有，未经许可不得转载      宜ICP证10086号  宜ICP备1008611号-5《网络文化经营许可证》文网文[2019]11/21号</span>
                </div>
                <div class="footer_span">
                    <span style="font-size: 14px;color: #B1DFF6;">违法和不良信息举报电话： 1008611转4 举报邮箱：1533968491@qq.com</span>
                </div>
                <!-- <div class="col-md-4"></div> -->
            </div>
        </div>
    </footer>
    
    <!-- 播放器 -->
    <div id="QPlayer">
        <div id="pContent">
            <div id="player">
                <span class="cover"></span>
                <div class="ctrl">
                    <div class="musicTag marquee">
                        <strong>Title</strong>
                        <span> - </span>
                        <span class="artist">Artist</span>
                    </div>
                    <div class="progress1">
                        <div class="timer left">0:00</div>
                        <div class="contr">
                            <div class="rewind icon"></div>
                            <div class="playback icon"></div>
                            <div class="fastforward icon"></div>
                        </div>
                        <div class="right">
                            <div class="liebiao icon"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ssBtn">
                    <div class="adf"></div>
            </div>
        </div>
        <ol id="playlist"></ol>
    </div>

    <script src="${pageContext.request.contextPath }/all/data/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/all/data/js/jquery.marquee.min.js"></script>

    <script>
	    var playlist = [
        {title:"五月雨",artist:"高梨康治、刃",mp3:"${pageContext.request.contextPath }/all/musicplay/高梨康治、刃-yaiba- - 五月雨.mp3",cover:"${pageContext.request.contextPath }/all/musicplay/五月雨.jpg",},
        {title:"涅槃 (Phoenix)",artist:"英雄联盟",mp3:"${pageContext.request.contextPath }/all/musicplay/英雄联盟 - 涅槃 (Phoenix).mp3",cover:"${pageContext.request.contextPath }/all/musicplay/涅槃 (Phoenix).jpg",},
        {title:"今后我与自己流浪",artist:"张碧晨",mp3:"${pageContext.request.contextPath }/all/musicplay/张碧晨 - 今后我与自己流浪.mp3",cover:"${pageContext.request.contextPath }/all/musicplay/今后我与自己流浪.jpg",},
        ];
        var isRotate = true;
        var autoplay = false;
    </script>
    <script src="${pageContext.request.contextPath }/all/data/js/player.js"></script>
    <script>
        function bgChange(){
            var lis= $('.lib');
            for(var i=0; i<lis.length; i+=2)
            lis[i].style.background = 'rgba(246, 246, 246, 0.5)';
        }
        /* window.onload = bgChange; */
    </script>
</body>
</html>