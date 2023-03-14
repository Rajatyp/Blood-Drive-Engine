<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
String UserId=request.getParameter("UserId");
String Password=request.getParameter("Password");



try
{
	
	System.out.println("inside loginaction.jsp"+UserId+" "+Password);
	Connection con= ConnectionProvider.getConnection();
	boolean isSucess=false; 
	Statement st= con.createStatement();
	ResultSet rs= st.executeQuery("select * from registerdata where ID='"+UserId+"' and password='"+Password+"'");
	
	while(rs.next())		
	{
		isSucess=true;
	}
	if(isSucess){
		
		response.sendRedirect("index1.jsp?msg=valid&login=true");
		
	}

	else{
		response.sendRedirect("login.jsp?msg=invalid&login=false");
		
	}
}
catch(Exception e){
	System.out.println(e);
	e.printStackTrace();
}
%>