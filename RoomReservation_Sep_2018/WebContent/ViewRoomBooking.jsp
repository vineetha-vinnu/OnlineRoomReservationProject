<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
	
.container {
	border-radius: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.29);
	background-color: white;
	padding: 2px;
}
	.roundbox 	{
    	display: inline-block;
    	color:#58d68d;
    	height: 40px;
    	background-color:#616a6b;
    	width: 180px;
    	text-align: center;
    	line-height: 40px;
    	border-radius:30px;
    	cursor: pointer;
    	text-decoration: none;
	}
	 .container th	{
	     	width: 140px;
	     	height: 30px;
	     	font-size: 20px;
	     	background-color: #2874A6;
	     	color: white;
  		   }
	
	.container td	{
	   		text-align: center;
	   		font-size:20px ;
	   }
	.container tr:nth-child(even)	{
		background-color: white;
		}	
	   
	   
	.welcome	{
  		display: inline-block;
    	float: right;
       	width: 370px;
  		line-height: 40px;
       	border-radius:30px;
      	cursor: pointer;
       }
   
</style>
<script>
  function clickAlert() {
	  var backspaceIsPressed = false
	    $(document).keydown(function(event){
	        if (event.which == 8) {
	            backspaceIsPressed = true
	        }
	    })
	    $(document).keyup(function(event){
	        if (event.which == 8) {
	            backspaceIsPressed = false
	        }
	    })
	    $(window).on('beforeunload', function(){
	        if (backspaceIsPressed) {
	            backspaceIsPressed = false
	            return "Are you sure you want to leave this page?"
	        }
	    })
}
</script>
</head>
<body bgcolor="white" onload="clickAlert()">
		<%@page import="DatabaseFiles.*,Beans.*,java.util.*" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<jsp:include page="Header.jsp" />
	<br>
	<div class="container">

	<ul>
			<a href="EmployeeHome.jsp"> <li class="roundbox">Book Room</li></a>
			<a href="ViewRoomBooking.jsp"><li class="roundbox">View Booking</li></a>
			<a href="EmployeeProfileUpdate.jsp"> <li class="roundbox">Update Profile</li></a>
			<a href="ViewRooms.jsp"><li class="roundbox">View Rooms</li></a>
			<a href="Home.jsp"><li class="roundbox">Logout</li></a>
 			<li class="welcome"><marquee behavior=alternate> 
	<% 

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma", "no-cache");	  //HTTP 1.0    
        response.setHeader("Expires", "0");  	//	Proxies 	
				
			       if(session.getAttribute("username")==null){
					response.sendRedirect("EmployeeLogin.jsp");
					}
			       else if(session!=null)	{
					String username=(String) session.getAttribute("username");
					out.println("Hello ,  "+username);
					}
				
		
				%> </marquee></li>
	</ul>
		<center>
		<h1>Booking Detail's</h1>
		
		<%  
			String username=(String) session.getAttribute("username");
			List <BookingRoomBean> list = BookingRoomDatabase.getAppointById(username);
			request.setAttribute("list",list);  
		%>  
		<center>
		<table border="1px solid black">
			<tr>
				<th>Booking ID</th>
				<th>EmpID</th>
				<th>Name</th>
	       		<th>Email</th>
	       		<th>Room Name</th>
	       		<th>Check In</th>
	       		<th>Check Out</th>
	       		<th>Purpose</th>
	       		<th>Remarks</th>
	       		
	       	</tr>
			<c:forEach items="${list}" var="d">  
			<tr>
			<td>${d.getBookid()}</td>
			<td>${d.getEid()}</td>
			<td>${d.getName()}</td>
			<td>${d.getEmail()}</td>  
			<td>${d.getRname()}</td>
			<td>${d.getCheck_in()}</td> 
			<td>${d.getCheck_out()}</td>
			<td>${d.getPurpose()}</td>
			<td>${d.getRemarks()}</td>
			 		
 			</tr>  
			</c:forEach>
		</table>
		</center>
		<br>
	</div>
	<br>
	<jsp:include page="Footer.jsp" />
</body>
</html>