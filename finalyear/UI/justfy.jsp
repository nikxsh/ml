	<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.lang.*" import="java.util.*"%>
    <html>
	<body>
	<%
	String just_rule1="",just_rule2="",just_rule3="",just_rule4="",just_rule5="";
        int RuleNum=Integer.parseInt(session.getAttribute("rnum").toString()); 	   
	    switch (RuleNum) 
            	  	{
    				case 1:
					        just_rule1="Plasma glucose concentration is Less than 155.";
							just_rule2="Age of the pantient is Less than 26 Years.";
    					    break;
    				case 2: 
							just_rule1="Plasma glucose concentration is Less than 155.";
							just_rule2="Age of the pantient is Greater than 25 Years.";
							just_rule3="Pantient is pregnant less than 11 times.";
							just_rule4="Diastolic blood pressure is less than 53 (mm hg)";
    					    break;
        			case 3: 
					        just_rule1="Plasma glucose concentration is Less than 155.";
							just_rule2="Age of the pantient is Greater than 25 Years.";
							just_rule3="Pantient is pregnant less than or equal to 10 times.";
							just_rule4="Diastolic blood pressure is Greater than 52 (mm hg)";
        				    break;
    				case 4: 
					        just_rule1="Plasma glucose concentration is Less than or Equal to 154.";
							just_rule2="Age of the pantient is Greater than 25 Years.";
							just_rule3="Pantient is pregnant Greater than 10 times.";
    					    break;
    				case 5: 
					        just_rule1="Plasma glucose concentration is Between 100 and 155.";
							just_rule2="Age of the pantient is Less than 29 Years.";
    					    break;
    				case 6: 
							just_rule1="Plasma glucose concentration is Between 100 and 155.";
							just_rule2="Age of the pantient is Between 28 and 59 Years.";
							just_rule3="Diastolic blood pressure is Less than 77 (mm hg)";
    					    break;
    				case 7: 
							just_rule1="Plasma glucose concentration is Between 100 and 155.";
							just_rule2="Age of the pantient is Between 28 and 59 Years.";
							just_rule3="Diastolic blood pressure is Greater than 76 (mm hg)";
							just_rule4="Triceps skin fold thickness is less than 22(mm)"; 
    					    break;
    				case 8: 
							just_rule1="Plasma glucose concentration is Between 100 and 155.";
							just_rule2="Age of the pantient is Between 28 and 59 Years.";
							just_rule3="Diastolic blood pressure is Less than 77 (mm hg)";
							just_rule4="Triceps skin fold thickness is Greater than 21(mm)"; 
                                                        just_rule5="Body Mass Index*17.9252+Dibetes Pedigree Fuction*29.2605 is Less than 716.413903";
    					    break;
    				case 9: 
							just_rule1="Plasma glucose concentration is Between 100 and 155.";
							just_rule2="Age of the pantient is Greater than 28 Years.";
     					    break;
    				case 10: 
					        just_rule1="Plasma glucose concentration is Greater than 154.";
    					    break;
					}
				
	            session.setAttribute("rule1",just_rule1);
	            session.setAttribute("rule2",just_rule2);
	            session.setAttribute("rule3",just_rule3);
	            session.setAttribute("rule4",just_rule4);
                    session.setAttribute("rule5",just_rule5);
		    response.sendRedirect("page.jsp");  
	%>			