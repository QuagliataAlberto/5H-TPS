<%@ page language="java" %>
	
	<html>
	
	<head>
	  <title>Tavola pitagorica</title>
	</head>
	
	<body>
	
	<table border=1>
		
		<%
		
	    	for(int i=1; i<=10; i++)
	        {
	    		
	    		out.println("<tr>");
	        	for(int j=1; j<=10; j++)
	        	{
	        		out.println("<td>"+(i*j)+"</td>");
	        	}
	        		
	        	out.println("</tr>");
	        	
	        }
		
		%>
		
	</table>
	
	</body>
	
</html>
