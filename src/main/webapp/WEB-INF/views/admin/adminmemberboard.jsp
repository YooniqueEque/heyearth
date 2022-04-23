<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,Earth | Admin Page</title>
<link href="css/admin/adminlist.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/admin/adminmemberboard.js"></script>
</head>
<body>

<h1 class='adminmain'>게시판 관리 페이지입니다.</h1><br>
<br>
<div class="board_choose">
		<input type="button" id="question" name="question" value = "질문" onclick="board(1)">
		<input type="button" id="request" name="request" value = "요청" onclick="board(2)">
</div>
<br>
<br>
<div class="board_body">
	<input id="id" type="hidden" value="${boardlist[0].id }">
	
	<div id="questionpage">
		<table class='adminlisttable' id='adminquestiontable'>
			<tr><th>게시물명</th><th>작성일</th><th>   </th><th>   </th></tr>
			<c:forEach items="${boardlist}" var="boardlist">
				<tr><td class='tabname'>${boardlist.b_title}</td>
				<td class="tabname">${boardlist.regdate}</td>
				<td><input class='tabmodbtn' id='boardmod' type='button' value='수정' onclick='boardmod(${boardlist.b_no})'></td>
				<td><input class='tabdelbtn' id='boarddel' type='button' value='삭제' onclick='boarddel(${boardlist.b_no})'></td></tr>
			</c:forEach> 
		</table>
		</table>
	</div>
	
	<div id="requestpage" style="display:none;">
		<table class='adminlisttable' id='adminrequesttable'>
		
		</table>
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>