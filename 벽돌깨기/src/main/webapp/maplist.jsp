<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
boolean hea = false;
	StringBuffer sb = new StringBuffer();
	sb.append(" select * from stage ");
	
	
	String sql = "select * from member where checks = 1";
	Connection con = JDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		hea = true;
		rs.close();
	}
	
	sql = sb.toString();
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>스테이지</title>
    <!-- 부트스트랩 CSS 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .jumbotron {
            background: url('https://source.unsplash.com/random/1600x900') no-repeat center center;
            background-size: cover;
            color: black;
        }
        .nav-link {
            color: white !important;
        }
        
        a{
        color: black;
        }
        
        .card-body{
        	height: 200px;
        }
        
        img{
        height: 165px;
        }
    </style>
</head>
<body>
    <!-- 내비게이션 바 -->
    <% if(hea){ %>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">벽돌깨기 스와이프</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="index2.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="logoutpro.jsp">logout</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="SignUp.jsp">Sign up</a></li>
				<li class="nav-item"><a class="nav-link" href="ranking.jsp">rank</a></li>
			</ul>
		</div>
	</nav>
	<% }else{ %>
	<%@ include file="header.jsp" %>
	<% } %>

    <!-- 메인 콘텐츠 -->
    <div class="jumbotron text-center">
        <h1 class="display-4"><strong><a href="HIDDENMAP1.jsp">M</a>ap List</strong></h1>
        <p class="lead">마지막 re:환상을 클리어하여 탈출하자</p>
    </div>

    <div class="container">
        <div class="row">
            <%
            while(rs.next()){
            %>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <img src="images/<%=rs.getString(5) %>" class="card-img-top" alt="Stage Image">
                    <div class="card-body">
                        <h5 class="card-title">stage <%= rs.getString(1) %>: <%= rs.getString(2) %></h5>
                        <p class="card-text"><%= rs.getString(3) %></p>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <!-- 부트스트랩 JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
