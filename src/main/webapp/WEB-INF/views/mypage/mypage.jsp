<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/mypage/mypage.css"/>

<!-- js -->
<script type="text/javascript" src="/js/mypage/mypage.js"></script>
<script src="jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	/* if($("#redcard").val() == 1){
		alert("한 번의 레드카드를 받았습니다.");
	}else if($("#redcard").val() == 2){
		alert("두 번의 레드카드를 받아 모든 포인트가 소멸되었습니다.");
	}
	else if($("#redcard").val() == 3){
		alert("세 번의 레드카드를 받아 강퇴 처리중입니다.");
	}else{
		
	} */
});
</script>

</head>
<body>

 <div id="pop" class="pop">
        <div class="layerBox">
            <h1 class="title">미션 인증 사진 신고로 인해 레드카드를 받았습니다.</h1>
            <div class="cont">
                <p>누적 레드카드 ${userdto.redcard } 회</p>
            </div>
            <div class="close">
                <span id="check" class="btnTodayHide"><input type="checkbox" value="checkbox" name="chkbox" id="chkday"/><label for="chkday">일주일간 보지 않기</label></span>
                <span id="close" class="btnClose"> <a href="#0">Close</a></span>
            </div>
        </div>
    </div>
    <script>
        // 쿠키 가져오기
        var getCookie = function (cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i=0; i<ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1);
                if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
            }
            return "";
        }

        // 일주일 쿠키 설정  
        var setCookie = function (cname, cvalue, exdays) {
            var todayDate = new Date();
            todayDate.setTime(todayDate.getTime() + (exdays*24*60*60*1000));    
            var expires = "expires=" + todayDate.toUTCString();
            document.cookie = cname + "=" + cvalue + "; " + expires;
        }

        var couponClose = function(){
            if($("input[name='chkbox']").is(":checked") == true){
                setCookie("close","Y",7); //일주일
            }
            $("#pop").hide();
        }
        
        $(document).ready(function(){
            var cookiedata = document.cookie;
            console.log(cookiedata);
            if(cookiedata.indexOf("close=Y")<0){
                $("#pop").show();
            }else{
                $("#pop").hide();
            }
            $("#close").click(function(){
                couponClose();
            });
        });
    </script>
<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->

	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
<section class="boardSection">
<input type="hidden" id="redcard" name="redcard" value="${userdto.redcard }">
	<h1>What's up ${sessionScope.session_id} !</h1>
	<div id="menu">
	
		<table id="menu_table">
			<tr class="menu_tr">
				<td class="menu_td">
					<input type=button id="profil_div" name="${sessionScope.session_id}" value="${sessionScope.session_id}님의 정보" onclick = "profil_div()" checked="checked"/>
				</td>
			</tr>
			<tr class="menu_tr">
				<td id="m_mission" class="btn">
					<input type=button id="mymission" value="나의 활동" onclick = "mymission()">
				</td>
			</tr>
			<tr class="menu_tr">
				<td id="m_board" class="btn">
					<input type=button id="myboard_btn" value="작성게시물 및 댓글" onclick="boardlist()">
				</td>
			</tr>
			<tr class="menu_tr">
				<td id="m_guide" class="btn">
					<input type=button id="myguide" value="자주 보는 배출가이드" onclick = "myguide()">
				</td>
			</tr>
		</table>
		
		<div id="mymenu_div">
			<form action="/update" method="post">
				<div id="updateDiv">
				</div>
			</form>
				<div id="myMissionDiv">
				</div>
				<div id="myboardlist_div">
				</div>
				<div id="myguidelist_div">
				</div>
		</div>
	</div>
</section>
	
	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
</body>
</html>