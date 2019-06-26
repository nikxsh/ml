<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.regex.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Contact - Diabetis Classification Model</title>
<link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
</head>
<body>

<div id="wrapper">
	<div id="header">
		<h1>Diabetis Classification Model</h1>
		<div id="nav">
			<ul>
				<li><a href="index.jsp" id="nav1">Home</a></li>
				<li><a href="page.jsp" id="nav3">Neuro-Lab</a></li>
				<li><a href="about.jsp" id="nav4">About</a></li>
				<li><a href="contact.jsp" id="nav5">Contact</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>

	<div id="middlebar-small">
		<h2>Experties Forum</h2>
	</div>
	
	<div id="body">	
		<div id="body-inner">			
			<div id="sidebar">
				<h3 class="icon-contact">Contact Methods</h3>
				<p><strong>Phone:</strong> +11 1234 567891</p>
				<p><strong>Email:</strong> <a href="mailto:nngroup@gmail.com">nngroup@gmail.com</a></p>
				<p><strong>Address:</strong>Pune<br />
				           Maharashtra,<br />
				           India,<br />
				<a href="https://maps.google.com/m/places?oi=nojs#ipd:mode=search&q=Pimpri Chinchwad College Of Engineering,Pune,Maharashtra,India&source=ipd">See Map &raquo;</a>
				</p>
			</div>

			<div id="main-content">
				
				<p>This prediction model is farly based on Mathematical Concept.</br>
				   So,Anything You Want to suggest then you are most Welcome.</p>
			<%
			   if(session.getAttribute("report")!="")
			    {
				      %> </br><center><font color="red"> <%
					  out.print(session.getAttribute("report")+"</font></center>");
				}
			%>	   
				<form id="form1" name="form1" method="post" action="SQLops_FB.jsp">
				<ul class="Cform">
					<li><label for="name">Name</label><input name="name" type="text" /></li>
					<li><label for="email">Email Address</label><input name="email" type="text" /></li>
					<li><label for="message">Message</label><textarea name="comment" cols="30" rows="7"></textarea></li>
					<li><label></label>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <input type="submit" value="Post Your Suggestion" class="button" /></li>
				</ul>
				</form>
				
			<%
                out.print("</br></br><B><I><h3>Comments :</I></B></h3></br><hr>"); 
	            Connection conn=null;
				ResultSet rs=null; 
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
				String dataSourceName = "myDB";
				String dbURL = "jdbc:odbc:" + dataSourceName;
				conn = DriverManager.getConnection(dbURL, "","");
  				
		          try
			       {
		                String sql = "SELECT * FROM Feedback order by mydate desc,myTime desc";
                        PreparedStatement ps = conn.prepareStatement(sql);
                        rs=ps.executeQuery();   
			               while(rs.next())
			                 {
			                   out.print("</br>&nbsp &nbsp By <b>"+rs.getString(1)+"</b>");
                               %><font color="Blue"><%
							   out.print(" ("+rs.getString(2)+")</font></br></br>");
							   %><font color="#800000"><%
							   out.print("<blockquote>"+rs.getString(3)+"</blockquote></font></br>");
							   out.print("&nbsp &nbsp At &nbsp<i>"+rs.getDate(4)+" </i> "+ rs.getTime(5) +"</br><hr>");
			                 }
                           ps.close();
                           conn.close();
				  }		   
                  catch(Exception exp)
			      {

			      }
                  finally
                  { conn.close(); }	
 
  
            %>	
			</div>
		</div>
	</div>

	<div id="footer">
		<div id="footer-right">
			<a href="index.jsp">Home</a> |
			<a href="page.jsp">Neuro-Lab</a> |
			<a href="about.jsp">About</a> |
			<a href="contact.jsp">Contact</a>
		</div>
		Copyright &copy; 2012 Neural Network Group 
	</div>
</div>

</body>
</html>