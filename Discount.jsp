<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />

<title>Discounts Insertion</title>

	<SCRIPT language="javascript">
        function addRow(tableID) {

            var table = document.getElementById(tableID);
 
            var rowCount = table.rows.length;
            			
			var row = table.insertRow(rowCount);
 
            var cell1 = row.insertCell(0);
            cell1.innerHTML = rowCount;

            var cell2 = row.insertCell(1);
            var element1 = document.createElement("input");
            element1.type = "text";
            element1.setAttribute("name", "quota" + rowCount);
            cell2.appendChild(element1);
 
 
            var cell3 = row.insertCell(2);
            var element2 = document.createElement("input");
            element2.type = "text";
            element2.setAttribute("name", "dis" + rowCount);
            cell3.appendChild(element2);
 				
       }
 
        function value1() {
    			document.form1.submit();
        }
    </SCRIPT>


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
		if(ssid == sessionid && author.equals("admin")) {
		%>


<form name="form1" action="./Discount1.jsp">
<h1 align="center"> 
 Quota Discount </h1>


<div id="divTable" align="center" style="">
<br />
<h4> Discount Rates </h4>
<table id="table1" border="1">
	<tr>
    	<th> Sl.No </th>
    	<th> Quota Type </th>
        <th> Discount (percentage) </th>
    </tr>
	<tr>
    	<td> 1 </td>
    	<td> <input type="text" name="quota1" />  </td>
        <td> <input type="text" name="dis1" />  </td>
    </tr>
	<tr>
    	<td> 2 </td>
    	<td> <input type="text" name="quota2" />  </td>
        <td> <input type="text" name="dis2" />  </td>
    </tr>
	<tr>
    	<td> 3 </td>
    	<td> <input type="text" name="quota3" />  </td>
        <td> <input type="text" name="dis3" />  </td>
    </tr>
	<tr>
    	<td> 4 </td>
    	<td> <input type="text" name="quota4" />  </td>
        <td> <input type="text" name="dis4" />  </td>
    </tr>
	<tr>
    	<td> 5 </td>
    	<td> <input type="text" name="quota5" />  </td>
        <td> <input type="text" name="dis5" />  </td>
    </tr>

    
</table>

<p align="center" >
    <INPUT type="button" value="Add Another Quota" onClick="addRow('table1')" />
</p>



<p>
<input type="button" value="Save The Discounts" onClick="value1()" />
</p>

</div>

</form>
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
