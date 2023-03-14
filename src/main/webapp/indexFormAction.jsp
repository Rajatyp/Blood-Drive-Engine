<%@page import= "Project.ConnectionProvider"%>
<%@page import= "java.sql.*"%>
<%
String name=request.getParameter("name");
String mobilenumber=request.getParameter("mobilenumber");
String email=request.getParameter("email");
String bloodgroup=request.getParameter("bloodgroup");
String sms_status=request.getParameter("sms_status");
String status = "pending";
try{
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement ps=con.prepareStatement("insert into bloodrequest values(?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,mobilenumber);
	ps.setString(3,email);
	ps.setString(4,bloodgroup);
	ps.setString(5,status);
	ps.setString(6,sms_status);
	
	ps.executeUpdate();
	response.sendRedirect("index1.jsp?msg=true");
	
}
catch(Exception e)
{
	response.sendRedirect("login.jsp?msg=false");
}

%>