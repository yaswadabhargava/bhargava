<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Railway Reservation System</title>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />

</head>
<body>

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    
    	<div id="site_title">
            <h1><a href="home.jsp">
                <img src="./images/train_logo.PNG" alt="Indian Railways" width="494" height="110" />
             
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
    
    	<div id="templatemo_slider">
					<embed style="background-color: black;" src="Railway.swf" width="650" height="315">
        </div> <!-- end of templatemo_slider -->  
            
               <h2>Welcome to Indian Railways</h2>
			<div  style=" padding:25px; text-align: justify;">
			<p> &nbsp; &nbsp; <span style="padding-left:2px; color: #2089FF; font-weight:bold; font-size: 16px;"> Indian Railways</span> 
				is one of the biggest rail network in the world. It provides comfortable journey for passengers through out India.
				Every day Indian Railways sells millions of railway tickets to millions of passengers.
				Considering the number of booking counters available and the long queues at the booking counters, 
				it takes a lot of time for the passenger to get a railway ticket reserved or canceled.
				The time consuming process of reservation and cancellation is reduced with the website which provides details 
				about all the trains, reservations of train ticket, cancellations of train ticket and some more features as an one step process.
		</p>              
    	</div>
      <div class="cleaner_h40"></div>
        
        <h2>&nbsp;</h2>
    </div> <!-- end of templatemo_content -->
    
    <div id="templatemo_sidebar">
    	
        <div id="request_a_quote" >
        <%
        	try{
			if(session.isNew()){			//session.isNew is true for the first time when the page is loaded
		%>
		    <h2>Login</h2>
            <form action="./Valid.jsp" method="get">
            <label>Email ID</label>
            <input type="text" id="userid" name="email" size="10" class="quote_input" title="Email Id" />
            <label>Password</label>
            <input type="password" id="password" name="pass" size="6" maxlength="6" class="quote_input" title="Password" />
            <input type="submit" value="SignIn" id="signin" /><br /><br />
            <h2> <a href="./UserReg.jsp"> User Registration</a>
			<br/><br/>
			<a href="./password.jsp"> Forget Password?</a></h2>
			</form>
		
		<%
			}
			else{
			String uname = (String)session.getAttribute("uname");
			String sid = (String)session.getAttribute("sid");
			String author = (String)session.getAttribute("author");
			String error = (String)session.getAttribute("error");
			String sessionid = (String)session.getId();
				if(error=="Y"){				//error=Y is set when the email and password are mismatched
					%>
					    <h2>Login</h2>
			       
			            <form action="./Valid.jsp" method="get">
			            <label>Email ID</label>
			            <input type="text" id="userid" name="email" size="25" class="quote_input" title="Email Id" />
			            <label>Password</label>
			            <input type="password" id="password" name="pass" maxlength="6" size="6" class="quote_input" title="Password" />
			            <input type="submit" value="SignIn" id="signin" /><br /><br />
						<span style="color: red; font-size: 12pt"> Invalid UserName/Password </span> <br/><br/>
			             <h2> <a href="./UserReg.jsp"> User Registration</a>
				        <br/><br/>
			             <a href="./password.jsp"> Forget Password?</a></h2>
			            </form>
				
					<%
					session.invalidate();
				}
				else if(sid == sessionid) {			//To verify the session id of page and sid i.e session id set during session creation match
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
					%>
					    <h2>Login</h2>
			       
			            <form action="./Valid.jsp" method="get">
			            <label>Email ID</label>
			            <input type="text" id="userid" name="email" size="25" class="quote_input" title="Email Id" />
			            <label>Password</label>
			            <input type="password" id="password" name="pass" size="6" maxlength="6" class="quote_input" title="Password" />
			            <input type="submit" class="demo" value="SignIn" id="signin" /><br /><br />
				        <h2> <a href="./UserReg.jsp"> User Registration</a>
				        <br/><br/>
			             <a href="./password.jsp"> Forget Password?</a></h2>
			            </form>
					<%
				}
			}
        }
        catch(Exception e){
        	
        }
		%>
        
            
            <div class="cleaner"></div>
                
        </div>
    
      <div id="sidebar_featured_project">
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
