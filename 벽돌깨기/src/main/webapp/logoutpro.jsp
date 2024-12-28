<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%



			String sql = "update member set checks = 0 where checks = 1";

Connection con = JDBConnection.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.executeUpdate();
			%>
			<script type="text/javascript">
			alert("로그아웃 되었습니다!");
			window.location.href = "index.jsp";
			</script>
