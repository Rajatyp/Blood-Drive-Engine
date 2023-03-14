<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>



<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"],select , input[type="submit"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:33%;	
	border-radius: 25px;
}
</style>
</head>
<body>
<div class="container">

<div class="header">
  <a href="#default" class="logo"><img class="logo" src="logo1.jpg"></a>
  <div class="header-right">
    <!--  <a class="active" href="index.jsp">Home</a>-->
  <!-- <a href="loginaction.jsp">Login</a> --> 
    <a href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<br>
<br>


	


	<%
	String msg=request.getParameter("msg");
	 if("invalid".equals(msg)){
		  %>
		  <center ><font color="blue" size="5"></font>Invalid Details...</center>
		 <%} %>
	<%
	
	 if("valid".equals(msg)){
		  %>
		   
		  <center ><font color="red" size="5"></font>Successfully Registered...</center>
		 <%} %>
	

	
	
<%
int id=1;
try{
	Connection con= ConnectionProvider.getConnection();

	Statement st=con.createStatement();
	
	ResultSet rs=st.executeQuery("select max(id) from registerdata");
	
	if(rs.next()){
		id=rs.getInt(1);
		id=id+1;
	}%>
	<div class="con" >
	
	
	<h2 style="color:red;">Form No :<% out.println(id);%> </h2>
	
	
	<% 
}
catch(Exception e){
	
}


%>

	


<form action="regisaction.jsp"  method="post">  
 
  <center>  <h1>* Request Registeration Form *</h1> </center>  
       
<center><h3><font color="blue">Name</font></h3></center>
<input type="text" name="name" placeholder= "Enter Your Name" size="15" required />     
   
   
<center><h3><font color="blue">Mobile Number</font></h3></center>
<input type="text" name="mobileno" placeholder="Enter Your Mobile Number" size="10" required> 
    
<center><h3><font color="blue">UserId</font></h3></center>  
<input type="text" name="Id" placeholder="Enter Your Id" size="15"required /> 
     
<center><h3><font color="blue">Password</font></h3></center>
  <input type="password" placeholder="Enter Your Password" name="password" required> 
       
<center><h3><font color="blue">Select Gender</font></h3></center>
 <select name="gender">
<option value="male">Male</option>
<option value="Female">Female</option>
<option value="Others">Others</option>
</select>
<br>
<br>
 <center><button type="submit" class="registerbtn">Register</button></center>
 

  </div>

</div> 
</form>
</body>
</html>