<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />

<title>Inserting Discount Values Into BackEnd</title>
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

try{

	loop:for(int i=1; i<=25 ; i++ )
		{
			String _qu = null;
			_qu = request.getParameter("quota"+i);
			if (_qu == null)
			{
				break loop;		
			}
            try{
		
        	Double _per = Double.parseDouble(request.getParameter("dis"+i));
        
        	String sql1="select quota from discount where quota=?";
            
			pstmt=con.prepareStatement(sql1);
			pstmt.setString(1,_qu);
			
			rs=pstmt.executeQuery();
			
			int flag=0;       

            while(rs.next()){
				if (rs.getString(1).equals(_qu.toUpperCase())){
					flag=1;
				}
			}

			if (flag==0){
           		String sql = "insert into discount values(?,?)";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1,_qu.toUpperCase());
			pstmt.setDouble(2,_per);

			pstmt.executeUpdate();
		}
        else{
          		String sql = "update discount set perct=? where quota=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(2,_qu.toUpperCase());
			pstmt.setDouble(1,_per);

			pstmt.executeUpdate();
		}//End Of If Block for flag
			}//End Of Try block For Exceptions during parsing
			catch(Exception e){
				//Exception occurs while parsing a null string but no need to specify it to the user 
			}
			}//End Of For Loop
%>
	<div><h2 style="height: 600px;" > 
	Discount Updation Successfully Completed <br >
	<input type="button" Value="ok" onclick="parent.location='adminhome.jsp'" />
	</h2></div>

<%	
}
catch(Exception e){
	e.printStackTrace();

%>
	<div><h2> 
	 Input Error </h2> 
	</div>

<%	
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
            <li><a href="news.html">Booking Location</a></li>
            <li><a href="gallery.html">FeedBack</a></li>
            <li class="last_menu"><a href="contactus.html">Contact Us</a></li>
        </ul>
    
       Copyright &copy; 2012 <a href="#">Railway Reservation</a> | <a href="http://www.sjrc.edu.in/" target="_new">SJRC</a> 
<p>Center For Railway Information Systems, Designed and Hosted by Nabeel Ahmed and Nikhil C Padia.</p>
    
    </div> <!-- end of footer -->

</div> <!-- end of wrapper -->


</body>
</html>
