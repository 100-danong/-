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

String sql = "select id from member";

System.out.println(id);
System.out.println(pa);

Connection con = JDBConnection.getConnection();
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

while(rs.next()){
	if(id.equals(rs.getString(1))){
			%>
			<script type="text/javascript">
			alert("id가 중복됩니다.");
			window.location.href = "index.jsp";
			</script>
			<%
	}
}
rs.close();

sql = "select memberno from member order by memberno desc";

pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();
rs.next();
int no = Integer.parseInt(rs.getString(1));
rs.close();
sql = "insert into member values(?,1,?,?,0)";

pstmt = con.prepareStatement(sql);

pstmt.setInt(1, no+1);
pstmt.setString(2, id);
pstmt.setString(3, pa);

pstmt.executeUpdate();
%>
<script type="text/javascript">
alert("회원가입이 완료되었습니다.");
window.location.href = "login.jsp";
</script>





