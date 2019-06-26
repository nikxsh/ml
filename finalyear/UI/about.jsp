<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Products - Diabetis Classification Model</title>
<link rel="stylesheet" href="styles/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="styles/lightbox.css" type="text/css" media="screen" />
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery.lightbox.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$('.product-main a.lb').lightBox();
});
</script>
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
		<h2>Glance Over Model</h2>
	</div>
	
	<div id="body">	
		<div id="body-inner">			
			<div id="sidebar">
				<h3 class="icon-cats">Categories</h3>
				<ul class="links">
					<li><a href="#">Hardware</a></li>
					<li><a href="#">Software</a></li>
					<li><a href="#">Misc</a></li>
				</ul>
				
				<br /><br />
				<h3 class="icon-feature">Featured Model</h3>
				<p><img src="images/product1small.png" alt="" /></p>
				<p><a href="#">Find out more &raquo;</a></p>
			</div>
			
			<div id="main-content">
				<br />
              <h1>Pima Indians Diabetes Database</h1>
	          <h2>Sources</h2>
				<ol>
				   <li>Original owners:</br> National Institute of Diabetes and Digestive and
                        Kidney Diseases</li>
				   <li>Donor of database:</br> Vincent Sigillito (vgs@aplcen.apl.jhu.edu)</br>
                          Research Center, RMI Group Leader</br>
                          Applied Physics Laboratory</br>
                          The Johns Hopkins University</br>
                          Johns Hopkins Road</br>
                          Laurel, MD 20707</br>
                          (301) 953-6231</li>
				</ol>
				<h2>Relevant Information</h2>
				<p>The diagnostic, binary-valued variable investigated is whether the</br>
				   patient shows signs of diabetes according to World Health Organization</br>
				   criteria (i.e., if the 2 hour post-load plasma glucose was at least </br>
                   200 mg/dl at any survey  examination or if found during routine medical</br>
                   care).   The population lives near Phoenix, Arizona, USA.</br>
 	              </br>
				   Several constraints were placed on the selection of these instances from</br>
                   a larger database.  In particular, all patients here are females at</br>
                   least 21 years old of Pima Indian heritage.  ADAP is an adaptive learning</br>
                   routine that generates and executes digital analogs of perceptron-like</br>
                   devices.  It is a unique algorithm; see the paper for details.</br>
                </p>  
				<h2>Results</h2></br>
				<p> Their ADAP algorithm makes a real-valued prediction between</br>
                   0 and 1.  This was transformed into a binary decision using a </br>
				   cutoff of 0.448.  Using 576 training instances, the sensitivity </br>
				   and specificity of their algorithm was 76% on the remaining 192 instances.
	            </p>
               	<h2>Attributes</h2>
				<ul>
				   <li>Number of times pregnant</li>
				   <li>Plasma glucose concentration a 2 hours in an oral glucose tolerance test</li>
				   <li>Diastolic blood pressure (mm Hg)</li>
				   <li>Triceps skin fold thickness (mm)</li>
				   <li>2-Hour serum insulin (mu U/ml)</li>
				   <li>Body mass index (weight in kg/(height in m)^2)</li>
				   <li>Diabetes pedigree function</li>
				   <li>Age (years)</li>
				</ul>
						
				<div class="clear"></div>
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