<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.SimpleDateFormat" import="java.util.*" import="java.util.regex.*" errorPage="" %>
<%
  String message=""; 
  int n=0;
	Connection conn=null;
    ResultSet rs=null; 
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
	String dataSourceName = "myDB";
    String dbURL = "jdbc:odbc:" + dataSourceName;
    conn = DriverManager.getConnection(dbURL, "","");

      	    String name,email,comment,dateOfpost,timeofpost;
			name=request.getParameter("name").toString();
			email=request.getParameter("email").toString();
			comment=request.getParameter("comment").toString();

             Calendar cal1 = Calendar.getInstance();
			 Calendar cal2 = Calendar.getInstance();
             SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yy");
			 SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
			
			    Pattern pattern;
	            Matcher matcher;
				String EMAIL_PATTERN ="^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
				
				pattern = Pattern.compile(EMAIL_PATTERN);  
				matcher = pattern.matcher(email);
				boolean b=matcher.matches();
				
				if(request.getParameter("name")=="" && request.getParameter("email")=="" && request.getParameter("comment")=="")
                {
				  message="*Please fill all the fields.";
				}	
                else if(b!=true)
                {
				  message="Invalid E-mail ID.";
				}		
                else
                {  				
		          try
			       {
					String sql = "INSERT INTO Feedback VALUES ('" + name + "','" + email + "','" + comment + "','" +  sdf1.format(cal1.getTime()) + "','" + sdf2.format(cal2.getTime()) + "')";
					PreparedStatement ps = conn.prepareStatement(sql);
					n=ps.executeUpdate();
			
			       if(n!=0)
			        {
			          message="Successfully Posted Your comment!!";
                      ps.close();
					  conn.close();
			        } 
                   }
                  catch(Exception exp)
			      {
			        message="Failed"+exp.toString();
			      }
                  finally
                  { conn.close(); }	
                }
			 
             session.setAttribute("report",message);
			 response.sendRedirect("contact.jsp");  
%>	