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
<script>
	$(document).ready(function() {
		$('#update').on("click", function() {
			const title = $('#title').val();
			const content = $('#content').val();
			const password = $('#password').val();
			const html= `
				<form action='/aboard1/update' method='post' id='update_frm'>
					<input type='hidden' name='bno' value='${board.bno}'>
					<input type='hidden' name='password' value=\${password}>
					<input type='hidden' name='title' value=\${title}>
					<input type='hidden' name='content' value=\${content}>
				</form>
			`;
			$('#page').append(html);
			$('#update_frm').submit();
		});
		
		$('#delete').on("click", function() {
			const password = $('#password').val();
			const html= `
				<form action='/aboard1/delete' method='post' id='delete_frm'>
					<input type='hidden' name='bno' value='${board.bno}'>
					<input type='hidden' name='password' value=\${password}>
				</form>
				${password}
			`;
			$('#page').append(html);
			$('#delete_frm').submit();
		});
	});
</script>
<title>Insert title here</title>
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
				<h1>글 읽기/변경</h1>
				<div class="mb-3 mt-3">
	    		<label for="title" class="form-label">제목:</label>
	    		<input type="text" class="form-control" id="title" name="title" value="${board.title}">
	  		</div>
				<div class="mb-3 mt-3">
	    		<label for="nickname" class="form-label">작성자:</label>
	    		<input type="text" class="form-control" value="${board.nickname}" disabled>
	  		</div>
	  		<div class="mb-3 mt-3">
					<textarea class="form-control" rows="5" id="content" name="content" >${board.content }</textarea>
	    	</div>
	    	<hr>
	  		<div class="mb-3 mt-3">
	    		<label for="password" class="form-label">비밀번호:</label>
	    		<input type="password" class="form-control" id="password" name="password" placeholder="글을 변경하거나 삭제하려면 비밀번호...">
	  		</div>	
	    	<button class="btn btn-outline-info" id="update">변경하기</button>
	    	<button class="btn btn-outline-danger" id="delete">삭제하기</button>
			</section>
		</main>
		<footer>
			<jsp:include page="/include/footer.jsp" />
		</footer>
	</div>
</body>
</html>