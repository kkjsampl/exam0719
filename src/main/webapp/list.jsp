<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/aboard1/css/main.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		if(location.search==='?error')
			alert('작업이 실패했습니다');
	})
</script>
</head>
<body>
	<div id="page">
		<header>
			<jsp:include page="/include/header.jsp" />
		</header>
		<nav>
			<jsp:include page="/include/nav.jsp" />
		</nav>
		<main>
			<aside>
				<jsp:include page="/include/aside.jsp" />
			</aside>
			<section>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>읽기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<td>${board.bno }</td>
								<td>
									<a href="/aboard1/read?bno=${board.bno}">${board.title}</a>
								</td>
								<td>${board.nickname }</td>
								<td>${board.writeday }</td>
								<td>${board.readcnt }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</main>
		<footer>
			<jsp:include page="/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>