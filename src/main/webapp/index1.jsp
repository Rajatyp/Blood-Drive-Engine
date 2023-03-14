<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
.mySlides {display:none;}

input[type="text"], input[type="mail"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:2%;
	padding:15px;	
}
</style>
</head>
<body>

<div class="header">
  <a href="#default" class="logo"><img class="logo" src="logo1.jpg"></a>
  <div class="header-right">
    <a class="active" href="index.jsp">Home</a>
   <!--<a href="loginaction.jsp">Login</a>!-->
   <!-- <a href="adminLogin.jsp">Admin Login</a>!-->
  </div>
</div>

<div style="max-width:100%">
  <img class="mySlides"  src="slide114.jpg" >
  <img class="mySlides"  src="slide115.jpg" >
</div>
 
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 3000); // Change image every 3 seconds
}
</script>


<body>
  <br>
  <%
  String msg=request.getParameter("msg");
  if("true".equals(msg))
  {
	  %>
	  <script >alert("Form Submitted Sucessfully") </script>
	  <%
  }
  %>
  <%
  String login=request.getParameter("login");
  if("true".equals(login))
  {
	  %>
	 <script >alert("Login Sucessfully") </script>
	  <%
  }
  %>
  <%
 
  if("invalid".equals(msg))
  {
	  %>
	  <center><font color="red" size="5">Invalid Data !! Try Again...</font></center>
	  <%
  }
  %>
 <center><h1>Enter Your Details To Request for Blood</h1></center>
 <form action="indexFormAction.jsp" method="post">
 <center>
 <input type="text" name="name" placeholder="Enter Name" required>
  <input type="text" name="mobilenumber" placeholder="Enter mobile Number" required>
   <input type="mail" name="email" placeholder="Enter Email Address" required>
    <input type="text" name="bloodgroup" placeholder="Enter Blood Group" required>
    <button class="button1"><Span>Submit</Span></button>
 </center>
 </form>
 
  <br>
  <br>
  </div>
</div>

<div class="row1"> 
<div class="container"> 
<br>         
<br>
    </tbody>
  </table>
</div>
</div>
<h3><center>Helpline No : 88887777</center></h3>

</body>
</html>