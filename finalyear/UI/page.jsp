<%@ page contentType="text/html; charset=iso-8859-1" language="java"  import="java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Page - Diabetis Classification Model</title>
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
		<h2>Neuro Lab</h2>
	</div>
	
	<div id="body">	
		<div id="body-inner">			
			<div id="sidebar">
			    <h3 class="icon-feature">Authorised domain For Doctors.</h3>
				<hr></br></br>
				<p>Your valuable & Authorise feedback about Dibetes prediction will lead us to
                   improve the overall model.</br>
				   It will help us to</br>
                </p>   	
	            <ul>
					<li>To improve Regional Accuracy.</li>
					<li>To Normliase our Dataset.</a></li>
					<li>To Collect more Dataset on Dibetic Patients.</li>
				</ul>	
                </br>				
                <form id="form2" name="form2" method="post" action="SQLops_main.jsp">
				<ul class="Dform">
					<li><label for="Select Name">Name</label><font>:</font>&nbsp 
					  <select name="Uname">
                      <option value="Dr.A">Dr. A</option>
                      <option value="Dr.B">Dr. B</option>
                      <option value="Dr.C">Dr. C</option>
                      <option value="Dr.D">Dr. D</option>
                      </select> 
					</li>
					<li><label for="password">password</label><font>:</font>&nbsp
					<input name="password" type="password" /></li>
					<li><label for="Select Name">Outcome</label><font>:</font>&nbsp 
					  <select name="selectResult">
                      <option value="1">Right Prediction</option>
                      <option value="0">Wrong Prediction</option>
                      </select> 
					</li>
					</br>	
					<li><center><input type="submit" value="Send" class="button" /></center>
					</ul>
				    <hr>	
				</form>  
				<%
				   if(session.getAttribute("report")!="")
				    {
					  out.print("</br><center><h3>" +session.getAttribute("report")+"</h3></center>");
					}
				%>
			</div>
			<div id="main-content">
				<form id="form1" name="form1" method="post" action="rules.jsp" >
				<h1>Check Out for Following symptoms</h1>
				</br><hr></br>
				<ul class="form">
					<li><label>1. Number of times pregnant</label><B>:</B>&nbsp <input name="ntp" type="text" value="<%= session.getAttribute("1") %>"/>&nbsp <font>*(0-17)</font></li>
					<li><label>2. Plasma glucose concentration</label><B>:</B>&nbsp <input name="pgc" type="text" value="<%= session.getAttribute("2") %>" />&nbsp <font>*(57-197)</font></li>
					<li><label>3. Diastolic blood pressure (mm Hg)</label><B>:</B>&nbsp <input name="dbp" type="text" value="<%= session.getAttribute("3") %>" />&nbsp <font>*(30-110)</font></li>
					<li><label>4. Triceps skin fold thickness (mm)</label><B>:</B>&nbsp <input name="tsft" type="text" value="<%= session.getAttribute("4") %>" />&nbsp <font>*(7-63)</font></li>
					<li><label>5. 2-Hour serum insulin (mu U/ml)</label><B>:</B>&nbsp <input name="si" type="text" value="<%= session.getAttribute("5") %>" />&nbsp <font>*(0-846)</font></li>
					<li><label>6. Body mass index</label><B>:</B>&nbsp <input name="bmi" type="text" value="<%= session.getAttribute("6") %>" />&nbsp <font>*(0-67.1)&nbsp </font></li>
					<li><label>7. Diabetes pedigree function</label><B>:</B>&nbsp <input name="dpf" type="text" value="<%= session.getAttribute("7") %>" />&nbsp <font>*(0.078-2.42)</font></li>
					<li><label>8. Age</label><B>:</B>&nbsp <input name="age" type="text" value="<%= session.getAttribute("8") %>" />&nbsp <font>*(21-81)</font></li>
					</br></br>
				</ul>
     			 <center><input type="submit" value="Submit Query" class="button" /></center>
				</form> 
				</br>
				<%
				String op=session.getAttribute("output").toString();
				out.print("<center><h2>" +op+"</h2></center>");
                %>				
				</br></br>
				<form id="form1" name="form2" method="post" action="justfy.jsp" >
				<center><input type="submit" value="Justify Your Prediction" class="button" /><center>
                </br>
				<ul>
				<% 
				 if(session.getAttribute("rule1")!="")
				   out.print("<li><b>"+session.getAttribute("rule1")+"</b></li>");
				 if(session.getAttribute("rule2")!="")
				   out.print("<li><b>"+session.getAttribute("rule2")+"</b></li>");
				 if(session.getAttribute("rule3")!="")
				   out.print("<li><b>"+session.getAttribute("rule3")+"</b></li>");
				 if(session.getAttribute("rule4")!="")
				   out.print("<li><b>"+session.getAttribute("rule4")+"</b></li>");
				 if(session.getAttribute("rule5")!="")
				   out.print("<li><b>"+session.getAttribute("rule5")+"</b></li>");
				%>
				</ul>
				</form>
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