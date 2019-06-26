	<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.lang.*" import="java.util.*"%>
    <html>
	<body>
	<%
	String res="",f="0";
	int RuleNum=0;
    session.setAttribute("1",request.getParameter("ntp"));
	session.setAttribute("2",request.getParameter("pgc"));
	session.setAttribute("3",request.getParameter("dbp"));
	session.setAttribute("4",request.getParameter("tsft"));
	session.setAttribute("5",request.getParameter("si"));
	session.setAttribute("6",request.getParameter("bmi"));
	session.setAttribute("7",request.getParameter("dpf"));
	session.setAttribute("8",request.getParameter("age"));
	   if(request.getParameter("dpf")!=""  && request.getParameter("bmi")!=""  && request.getParameter("si")!=""  && request.getParameter("ntp")!=""  && request.getParameter("dbp")!="" && request.getParameter("tsft")!="" && request.getParameter("age")!="")
	    {
                   try
					{
  					   
					   int d1,d2,d3,d4,d6;
			   float c1,c2;
		       d1=Integer.parseInt(request.getParameter("ntp"));
            	       d2=Integer.parseInt(request.getParameter("pgc"));
            	       d3=Integer.parseInt(request.getParameter("dbp"));
            	       d4=Integer.parseInt(request.getParameter("tsft"));
            	       c1=new Float(request.getParameter("bmi"));
            	       c2=new Float(request.getParameter("dpf"));	
            	       d6=Integer.parseInt(request.getParameter("age"));
					  
			if(d2<=154)  
                        { 
                	        if(d2<=100)
                	        {
                		        if(d6<=25)
                		        {
                			      res="Tested *Negative for Diabetes";
                	              RuleNum=1;
                		        }
                		        else if(d6>25)
                		        {
                			       if(d1<=10)
                			       {
                				      if(d3<=52)
                				      {
                				       res="Tested *Positive for Diabetes";
                	                   RuleNum=2;	
                				      }
                				      else if(d3>52)
                				      {
                					    res="Tested *Negative for Diabetes";
                	                    RuleNum=3;	
                			          }
                			        } 
                			        else if(d1>10)
                			        {
                		     	      res="Tested *Positive for Diabetes";
                	                   RuleNum=4;	
                			        }
                				
                		        }
                	        }
                	       else if(d2>100)
                	       {
                		      if(d6<=28)
                		       {
                	    	      res="Tested *Negative for Diabetes";
                	              RuleNum=5;	
                		       }
                		       else if(d6>28)
                		       {
                			        if(d6<=58)
                			         {
                				        if(d3<=76)
                				         {
                					        res="Tested *Negative for Diabetes";
                	                        RuleNum=6;
                				         }
                				         else if(d3>76)
                				         {
                					         if(d4<=21)
                					          {
                						        res="Tested *Negative for Diabetes";
                	                            RuleNum=7;
                					          }
                					         else if(d4>21)
                					          {

                                                                           if(((c1*17.9252)+(c2*29.2605))<716.413903)
                                                                            {
                                                                             res="Tested *Negative for Diabetes";
                	                                                     RuleNum=8;
                                                            		    }
                                                                            else 
                                                                            {
                                                                             res="Tested *Positive for Diabetes";
                	                                                     RuleNum=8;                                                                             
                                                                            }				  
                					          }
                				         }     
                			         }
                			         else if(d6>58)
                			         {
                				       res="Tested *Negative for Diabetes";
                	                   RuleNum=9;
                			         }       
                		       }
                		
                	        }

                        }	
     	                else if(d2>154)
     	                {
     	        	      res="Tested *Positive for Diabetes";
                	      RuleNum=10;
     	                }
						f="1";
						session.setAttribute("output",res);  
                    } 
                    catch(NumberFormatException e)	
                    {
			    	    session.setAttribute("output","Please enter valid values.");			   
						f="0";
					}	
                
		}	
       else
	   {
     	 session.setAttribute("output","Please Enter specified values");
		 f="0";
       }
	 session.setAttribute("flag",f);  
          session.setAttribute("rnum",RuleNum);
	 response.sendRedirect("page.jsp");  	  
    %>
	</body>
	</html>