<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
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
       <title>小说阅读网页</title>
       <!-- 1. 导入CSS的全局样式 -->
       <link href="${pageContext.request.contextPath }/all/data/css/bootstrap.min.css" rel="stylesheet">
       <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
       <script src="${pageContext.request.contextPath }/all/data/js/jquery-2.1.0.min.js"></script>
       <!-- 3. 导入bootstrap的js文件 -->
       <script src="${pageContext.request.contextPath }/all/data/js/bootstrap.min.js"></script> 
        <!-- 导入图标样式 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/all/data/css/iconfont.css"> 
        <!-- 引入toastr的js、css文件  -->
	    <link href="${pageContext.request.contextPath }/all/data/css/toastr.min.css" rel="stylesheet" />
	    <script src="${pageContext.request.contextPath }/all/data/js/toastr.min.js"></script>  
	    <!-- 导入音乐播放CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/all/data/css/player.css"> 
    <script>
	    $(function() {
	        $(".bookshelfbtn").click(function() {
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
		                if(${bookContent != null}) {
		                	window.location.href = "${pageContext.request.contextPath}/AddBookToBookShelf?bs_account=${user.getUaccount() }&bs_bnum=${bookContent.getBc_bnum() }&chapter_num=${bookContent.getChapter_num()}&collectiontimes=${collectiontimes +1}";
		                }else {
		                	window.location.href = "${pageContext.request.contextPath}/AddBookToBookShelf?bs_account=${user.getUaccount() }&bs_bnum=${bc_bnum}&chapter_num=${chapter_num}&collectiontimes=${collectiontimes +1}";
		                }
	                }
	            },1000);
	        }
	    });
    </script>
    <style>
        body,html{background-color: #E7E1D4;display: flex;min-height: 100vh;flex-direction: column;}
        .footer_span{height: 40px;;text-align: center;line-height: 40px;}
        footer{background-color: #434343;min-height: 80px;}
        #center{flex: 1;}
        .mag_top{margin-top: 15px;}
        
        .left_fw {position: fixed;top: 0px;left: 300px;background-color: #eee;border: 1px solid #ddd;}
        .left_fw_01 {width: 60px;height: 52px;border-bottom: 1px solid #aaa;line-height: 20px;padding-top: 8px;text-align: center;}
        .left_fw_01:last-child {border-bottom: none;}
        .left_fw_01 a {color: #666;text-decoration: none;}
        .left_fw_01 a:hover {color: #e00;}
        .right_fw {position: fixed;bottom: 0px;right: 300px;background-color: #eee;border: 1px solid #ddd;}
        .right_fw_01 {width: 60px;height: 50px;border-bottom: 1px solid #aaa;line-height: 20px;padding-top: 8px;text-align: center;}
        .right_fw_01:last-child {border-bottom: none;height: 40px;padding-top: 20px;line-height: 2px;}
        .right_fw_01 a {color: #666;text-decoration: none;}
        .right_fw_01 a:hover {color: #e00;}
        /* 设置图标 */
        .iconfont_1 {font-size: 20px;}
        .iconfont_2 {font-size: 35px;}
        .s1 {font-size: 13px;}
            
    </style>
</head>
<body>
    <div id="center" style="background-color: #F7F2E8;width: 790px;margin: auto;">
        <div style="width: 750px;margin: auto;">
            <h2 style="text-align: center;">${bookContent.getBcchapter() }</h2>
            <span style="font-size: 18px;">
                <c:if test="${bookContent!=null }">
                    ${bookContent.getBccontent() }
                </c:if>
                <c:if test="${bookContent==null }">
                    <h3 style="text-align: center;">很抱歉，该小说还没更新...</h3>
                </c:if>
            </span>
        </div>
    </div>
    
    <!-- 左侧悬浮窗left_fw -->
    <div class="left_fw">
        <!-- Button trigger modal -->
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary btn-lg left_fw_01" data-toggle="modal" data-target="#myModal">
            <i class="iconfont iconfont_1">&#xe629;<br><span class="s1">目录</span></i>
        </button>
        <div class="left_fw_01">
            <c:if test="${bookContent!=null}">
	            <a href="${pageContext.request.contextPath }/QueryBookServlet?bnum=${bookContent.getBc_bnum() } "><i class="iconfont iconfont_1">&#xe612;<br><span class="s1">返回</span></i></a>
            </c:if>
            <c:if test="${bookContent==null}">
                <a href="${pageContext.request.contextPath }/QueryBookServlet?bnum=${bc_bnum} "><i class="iconfont iconfont_1">&#xe612;<br><span class="s1">返回</span></i></a>
            </c:if>
        </div>
        <div class="left_fw_01"><a href="#"><i class="iconfont iconfont_1">&#xe609;<br><span
                        class="s1">设置</span></i></a></div>
        <div class="left_fw_01">
            <!-- 已在书架 -->
            <c:if test="${IsInBookshelf !=null}">
                <a href="${pageContext.request.contextPath }/QueryBookShelfByPageServlet">&#xe611;<br><span class="s1">已在书架</span></a>
            </c:if>
            <!-- 不在书架 -->
            <c:if test="${IsInBookshelf ==null }">
                <a href="javascript:void(0);" class="bookshelfbtn"><i class="iconfont iconfont_1">&#xe611;<br><span class="s1">书架</span></i></a>
                <!-- 书籍内容书籍内容是否为空 -->
                <%-- <c:if test="${bookContent!= null}">
		            <a href="${pageContext.request.contextPath }/AddBookToBookshelf?bs_account=${user.getUaccount() }&bs_bnum=${bookContent.getBc_bnum() }&chapter_num=${bookContent.getChapter_num()}&collectiontimes=${collectiontimes +1}" class="bookshelfbtn"><i class="iconfont iconfont_1">&#xe611;<br><span class="s1">书架</span></i></a>
                </c:if>
                <c:if test="${bookContent== null}">
                    <a href="${pageContext.request.contextPath }/AddBookToBookshelf?bs_account=${user.getUaccount() }&bs_bnum=${bc_bnum}&chapter_num=${chapter_num}&collectiontimes=${collectiontimes +1}" class="bookshelfbtn"><i class="iconfont iconfont_1">&#xe611;<br><span class="s1">书架</span></i></a>
                </c:if> --%>
            </c:if>
        </div>
    </div>
    <!-- 右侧悬浮窗right_fw -->
    <div class="right_fw">
        <div class="right_fw_01"><a href="#"><i class="iconfont iconfont_1">&#xe610;<br><span
                        class="s1">投票</span></i></a></div>
        <div class="right_fw_01"><a href="#"><i class="iconfont iconfont_1">&#xe606;<br><span
                        class="s1">打赏</span></i></a></div>
        <div class="right_fw_01"><a href="#"><i class="iconfont iconfont_2">&#xe7b1;<br>&#xe743;</i></a></div>
    </div>
    
    <div style="background-color: #F7F2E8;width: 790px;margin:15px auto;">  
        <c:if test="${bookContent.getChapter_num() <=1 || bookContent==null}">
            <a class="btn btn-default disabled" href="javascript:void(0);" role="button" style="width: 255px;height: 50px;;">
                <span style="font-size: 20px;line-height: 38px;">上一章</span>
            </a>
        </c:if>
        <c:if test="${bookContent.getChapter_num() >1 && bookContent!=null}">
	        <a class="btn btn-default" href="${pageContext.request.contextPath }/BookContentServlet?bc_bnum=${bookContent.getBc_bnum()}&chapter_num=${bookContent.getChapter_num()-1 } " role="button" style="width: 255px;height: 50px;;">
	            <span style="font-size: 20px;line-height: 38px;">上一章</span>
	        </a>   
        </c:if>
        
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="width: 255px;height: 50px;margin-left: 8px;">
                                 目录
        </button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title" id="myModalLabel" style="text-align: center;font-weight: 700;">${bookContent.getBcname() }目录</h3>
                    </div>
                    <div class="modal-body">
                        <ul class="list-group">
                            <c:forEach items="${bookCatalogList }" var="l">
	                            <li class="list-group-item"><a href="${BookContentServlet }?bc_bnum=${bookContent.getBc_bnum()}&chapter_num=${l.getChapter_num() } " style="font-size: 16px;">${l.getBcchapter() }</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
        <c:if test="${bookContent.getChapter_num() >=bookcontentTotal || bookContent==null}">
	        <a class="btn btn-default disabled" href="javascript:void(0);" role="button" style="width: 255px;height: 50px;margin-left: 9px;">
	            <span style="font-size: 20px;line-height: 38px;">下一章</span>
	        </a>
        </c:if>
        <c:if test="${bookContent.getChapter_num() <bookcontentTotal && bookContent!=null}">
            <a class="btn btn-default" href="${pageContext.request.contextPath }/BookContentServlet?bc_bnum=${bookContent.getBc_bnum()}&chapter_num=${bookContent.getChapter_num()+1 } " role="button" style="width: 255px;height: 50px;margin-left: 9px;">
                <span style="font-size: 20px;line-height: 38px;">下一章</span>
            </a>
        </c:if>
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
        window.onload = bgChange;
    </script>
</body>
</html>