<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>User Page</title>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
<%! 
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
public void jspInit(){
	try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","mysql");
	}
	catch(Exception e ){
		e.printStackTrace();
	}
	}
%>

</head>
<body>

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    
    	<div id="site_title">
            <h1><a href="home.jsp">
                <img src="./images/train_logo.PNG" width="494" height="110" />
             
            </a></h1>
        </div>
 
        <div id="templatemo_menu">
    
            <ul>
                <li><a href="home.jsp" class="current">Home</a></li>
                <li><a href="SearchTrain.jsp">Trains</a></li>
                <li><a href="SeatAvail.jsp">Booking</a></li>
                <li><a href="Pnr.jsp">PNR Status</a></li>
                <li><a href="contactus.html">Contact Us</a></li>
            </ul>    	
    
    	</div> <!-- end of templatemo_menu -->
        
        <div class="cleaner"></div>
	</div> <!-- end of header -->
    
    <div id="templatemo_content">


	<!-- Form Body -->

<div>
<%
//Session Validation
try{
	if(session.isNew()){
			out.println("<h3><span style='color: red;'>Access Denied please login to access </span></h3>");	
	}
	else{
	String uname = (String)session.getAttribute("uname");
	String ssid = (String)session.getAttribute("sid");
	String author = (String)session.getAttribute("author");
	String sessionid = (String)session.getId();
	String uid = (String)session.getAttribute("uid");
		if(ssid == sessionid && author.equals("user")) {
		%>

<h1 align="center"> User HomePage </h1>
<div style="float: right;">
		<br/>
		<br/>
		<h3> Quick Links </h3>
        <ul>
            <li><a href="./SeatAvail.jsp"> Make a Booking  </a></li>
            <li><a href="./Pnr.jsp"> View PNR Status  </a></li>
            <li><a href="./Cancel.jsp"> Cancellation  </a></li>
        </ul>
		<h3> Reference </h3>
        <ul>
            <li><a href="./viewbook.jsp"> View Bookings  </a></li>
            <li><a href="./viewcancel.jsp"> View Cancellations  </a></li>
        </ul>
</div>

<br  />
<div style="float: left; position: inherit;">
<%
String sql1="select r.name, r.sex, c.amt from reg_user r, credit c where r.user_id=c.user_id and r.user_id="+uid+" ";

pstmt = con.prepareStatement(sql1);

rs =pstmt.executeQuery();

if(rs.next()){
	if(rs.getString("sex").equals("M")){
		%>
		<img src="./images/male.png"  height="200px" width="175">
		<%
	}
	else{
		%>
		<img src="./images/female.png" height="200px" width="175">
		<%		
	}
out.println("<span style='color:brown; font-weight:bold; font-size:16px;'>");	
out.println("<br/>User Name: "+rs.getString("name")+"<br/>");
out.println("Available Credit: "+rs.getString("amt")+" Rs. <br/>");
out.println("</span>");	
}
%>
</div>


		<%
		//Session Validation

		}
		else{
			out.println("<h3><span style='color: red;'>Access Denied please login to access </span></h3>");	
		}
	}
}
catch(Exception e){
	out.println("<h3><span style='color: red;'>Access Denied please login to access </span></h3>");	
}
%>

</div>

	<!-- Form Body -->

    </div> <!-- end of templatemo_content -->
    
    <div id="templatemo_sidebar">
    	<div id="request_a_quote">
        <%
        	try{
			if(session.isNew()){			//session.isNew is true for the first time when the page is loaded
			}
			else{
			String uname = (String)session.getAttribute("uname");
			String ssid = (String)session.getAttribute("sid");
			String author = (String)session.getAttribute("author");
			String error = (String)session.getAttribute("error");
			String sessionid = (String)session.getId();
				if(error=="Y"){				//error=Y is set when the email and password are mismatched
				}
				else if(ssid == sessionid) {			//To verify the session id of page and sid i.e session id set during session creation match
				%>
					<h2> Login Details</h2><br/>
					<p style="font-size: 12pt">
					<label style="color:#DD0000;"> UserName</label> &nbsp; <%= uname %>	<br/>
					<label style="color:#DD0000;"> Authority </label> &nbsp; <%= author.toUpperCase() %>	<br/>
					<br/>
					<a href="<%= author%>home.jsp"> <%= author.toUpperCase() %>	Home</a>
					<a href='Logout.jsp'> Logout</a>
					</p>
				<%
				}
				else{			//if all cases fail login is prompted
				}
			}
        }
        catch(Exception e){       	
        }
		%>
        </div>
    
      <div id="sidebar_featured_project">
        	<div class="cleaner"></div>
            <div class="cleaner"></div>
            <div class="cleaner"></div>
            <div class="cleaner"></div>
            <h3>Information</h3>
            <div class="right" >
            
              <h6 ><a href="SearchTrain.jsp">Trains Btw Stations</a></h6>
              <h6><a href="SearchSchedule.jsp">Train Schedules</a></h6>
              <h6><a href="ViewFare.jsp">Fare List</a></h6>
              <h6><a href="http://www.indianrail.gov.in" target="_new">Other Railway Websites </a></h6>
         
            </div>
            
             <div class="cleaner"></div>
            
        </div>
        <div class="cleaner"></div>
    </div>
    
    <div id="templatemo_footer">

        <ul class="footer_menu">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="SearchTrain.jsp">Train Between Stations</a></li>
            <li><a href="feedback.jsp">FeedBack</a></li>
            <li class="last_menu"><a href="contactus.html">Contact Us</a></li>
        </ul>
    
       Copyright &copy; 2012 <a href="#">Railway Reservation</a> | <a href="http://www.sjrc.edu.in/" target="_new">SJRC</a> 
<p>Center For Railway Information Systems, Designed and Hosted by Nabeel Ahmed and Nikhil C Padia.</p>
    
    </div> <!-- end of footer -->

</div> <!-- end of wrapper -->


</body>
</html>
