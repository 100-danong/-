<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pa = request.getParameter("pa");

String sql = "select id, pass from member";

System.out.println(id);
System.out.println(pa);

Connection con = JDBConnection.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

while(rs.next()){
	if(id.equals(rs.getString(1))){
		if(pa.equals(rs.getString(2))){
			sql = "update member set checks = 1 where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			%>
			<script type="text/javascript">
			alert("로그인 성공!");
			window.location.href = "index2.jsp";
			</script>
			<%
		}
	}
}
%>

<script type="text/javascript">
alert("로그인 실패!");
window.location.href = "index.jsp";
</script>