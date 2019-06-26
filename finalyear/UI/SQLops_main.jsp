<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<%
  String message=""; int n=0;
  int flg=Integer.parseInt(session.getAttribute("flag").toString());
  if(flg==1)
   {  
    String fname=request.getParameter("Uname");
	String fpassword=request.getParameter("password");
	Connection conn=null;
    ResultSet rs=null; 
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
	String dataSourceName = "myDB";
    String dbURL = "jdbc:odbc:" + dataSourceName;
    conn = DriverManager.getConnection(dbURL, "","");
    try
    {
       
	   String sql = "select * from Login where ID=? and password=?"; 
       PreparedStatement ps = conn.prepareStatement(sql);
	   ps.setString(1,fname);
	   ps.setString(2,fpassword);
       rs = ps.executeQuery();
           
        if(rs.next())
		  { 
		    String p,q,r,s,t,u,v,w,x;
			p=session.getAttribute("1").toString();
			q=session.getAttribute("2").toString();
			r=session.getAttribute("3").toString();
			s=session.getAttribute("4").toString();
			t=session.getAttribute("5").toString();
			u=session.getAttribute("6").toString();
			v=session.getAttribute("7").toString();
			w=session.getAttribute("8").toString();
			x=request.getParameter("selectResult");
			
		        try
			    {
					String sql1 = "INSERT INTO DBDataset VALUES (?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement ps1 = conn.prepareStatement(sql1);
					ps1.setString(1,p);
					ps1.setString(2,q);
					ps1.setString(3,r);
					ps1.setString(4,s);
					ps1.setString(5,t);
					ps1.setString(6,u);
					ps1.setString(7,v);
					ps1.setString(8,w);
					ps1.setString(9,x);
					ps1.setString(10,fname);
					n=ps1.executeUpdate();
			
			       if(n!=0)
			        {
			          message="Success!!";
                      ps.close();
	                  ps1.close();
                      conn.close();
			        } 
                }
               catch(Exception exp)
			    {
			        message="Failed"+exp.toString();
			    }
			
		}	
        else
		    message="No user or password matched" ;
        		
     }catch (Exception e) {
         e.printStackTrace();
    }
    finally
    { conn.close(); }	
   }	
   else
   {
    message="Please specify your Symptoms."; 
   }
 
  session.setAttribute("report",message);  
 
  if(n!=0)
   {
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
	session.setAttribute("flag","0"); 
   }
   response.sendRedirect("page.jsp");  
%>	