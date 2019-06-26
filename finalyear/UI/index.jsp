<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Diabetis Classification Model</title>
<link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('#middlebar-big').cycle({
		fx: 'fade',
		speed: 600, 
		timeout: 3000, 
		pause: 1 
	});
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="header">
	    <h1>Here we Go</h1> 
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
	<% 
	session.setAttribute("output",""); 
	session.setAttribute("1","");
	session.setAttribute("2","");
	session.setAttribute("3","");
	session.setAttribute("4","");
	session.setAttribute("5","");
	session.setAttribute("6","");
	session.setAttribute("7","");
	session.setAttribute("8","");
	session.setAttribute("rule1","");
	session.setAttribute("rule2","");
	session.setAttribute("rule3","");
	session.setAttribute("rule4","");
	session.setAttribute("rule5","");
	session.setAttribute("flag","0"); 
	session.setAttribute("report","");
	%>
	<div id="middlebar-big">
		<div class="product">
			<h2>Artficial Neural Network</h2>
			<p>For Diabetes Classification ?? <br /></p>
			<p><a href="about.jsp" class="learn-more">Learn More &raquo;</a></p>
			<img src="images/nn1.png" alt="" />
		</div>
		<div class="product">
			<h2>You don't believe me?</h2>
			<p>I know it.<br />But yes We can!<br /></p>
			<p><a href="about.jsp" class="learn-more">Learn More &raquo;</a></p>
			<img src="images/nn2.png" alt="" />
		</div>
		<div class="product">
			<h2>We really should!</h2>
			<p>Check More on our Website<br />and lets get down to business.<br />Get started...</p>
			<p><a href="about.jsp" class="learn-more">Learn More &raquo;</a></p>
			<img src="images/nn3.png" alt="" />
		</div>
	</div>
	
	<div id="body">	
		<div id="body-inner">
			<div class="clear"></div>
			
			<div id="sidebar">
				<h3 class="icon">Artificial Neural Network</h3>
				<p>Based on mathematical concept Artificial neural network is key classification and prediction
				   technology.This can be applied on other fields such as </p>
				<ul>
					<li>Cancer Classification & Analysis.</li>
					<li>Image Classification & Analysis.</li>
				</ul>
				<p>Our intension is to collect different samples from worldwide to increase Accuracy of 
				   prediction model </p>
			</div>
			
			<div id="main-content">
				<h2>About Diabetes Prediction Model</h2>
				<p> The diagnostic, binary-valued variable investigated is whether the
                    patient shows signs of diabetes according to World Health Organization
                    criteria (i.e., if the 2 hour post-load plasma glucose was at least 
                    200 mg/dl at any survey  examination or if found during routine medical
                    care).The population lives near Phoenix, Arizona, USA.</p>

				<blockquote>"Their ADAP algorithm makes a real-valued prediction between
                             0 and 1.  This was transformed into a binary decision using a cutoff of 
                             0.448. "</blockquote>

				<p>Using 576 training instances, the sensitivity and specificity
                   of their algorithm was 76% on the remaining 192 instances.</p>
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