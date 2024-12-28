<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int no = Integer.parseInt(request.getParameter("no"));
    
	StringBuffer sb = new StringBuffer();
	sb.append(" select name from stage where stageno = ? ");
	
	String sql = sb.toString();
	Connection con = JDBConnection.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, no);
	ResultSet rs = pstmt.executeQuery();
	System.out.println(no);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Game Win Screen</title>
    <style>
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #333;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .win-screen {
            text-align: center;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
        }
        .win-screen h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }
        .win-screen p {
            font-size: 18px;
            margin-bottom: 30px;
        }
        .win-screen button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #0095DD;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .win-screen button:hover {
            background-color: #007bb5;
        }
    </style>
</head>
<script type="text/javascript">
function bu() {
	
	window.location.href = "stage.jsp"
	
}
</script>
<body>
    <div class="win-screen">
        <h1>축하합니다!</h1>
        <p><%= rs.getString(1) %>을 클리어하셨습니다.</p>
        <button onclick="bu()">스테이지</button>
    </div>
    <%
    rs.close();
    sql = "select stageno from member where checks = 1";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();
    rs.next();
    if(rs.getInt(1)==no){
    	sql = "update member set stageno = ? where checks = 1";
    	pstmt = con.prepareStatement(sql);
    	pstmt.setInt(1, no+1);
    	pstmt.executeUpdate();
    }
    
    %>
</body>
</html>
