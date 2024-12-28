<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	
	String sql = "select * from member where checks = 1";
	Connection con = JDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		rs.close();
		response.sendRedirect("index2.jsp");
	}
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<!-- 부트스트랩 CSS 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.jumbotron {
	background: url('https://source.unsplash.com/random/1600x900') no-repeat
		center center;
	background-size: cover;
	color: white;
}

.nav-link {
	color: white !important;
}
</style>
</head>
<body>
	<!-- 내비게이션 바 -->
	<%@ include file="header.jsp" %>

	<!-- 메인 콘텐츠 -->
	<div class="jumbotron text-center">
		<h1 class="display-4">벽돌 깨기 스와이프!</h1>
		<p class="lead">벽돌을 깨며 앞으로 나아가서 이 곳을 탈출하라!</p>
		<a class="btn btn-primary btn-lg" href="login.jsp" role="button">로그인 하시오.</a>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<h2>Section 1</h2>
				<p>총 10개의 스테이지로 구성되어 있음!</p>
				<a class="btn btn-secondary" href="maplist.jsp" role="button">맵 보러가기»</a>
			</div>
			<div class="col-lg-4">
				<h2>Section 2</h2>
				<p>모든 스테이지를 클리어하고 이 곳을 탈출하시오!</p>
				<a class="btn btn-secondary" href="login.jsp" role="button">로그인 하러 가기»</a>
			</div>
			<div class="col-lg-4">
				<h2>Section 3</h2>
				<p>특수한 이스터에그를 찾아서 보물찾기를 해보자!</p>
				<a class="btn btn-secondary" href="hint.jsp" role="button">힌트 보러 가기»</a>
			</div>
		</div>
	</div>

	<!-- 부트스트랩 JS 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
