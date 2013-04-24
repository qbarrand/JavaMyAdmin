<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="projet2.Database"%>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>

<% 
	Database db = (Database)application.getAttribute("database"); 

	// Déprécié mais ça ira pour cette fois
	String values = URLDecoder.decode(request.getParameter("values")); 
	String table = request.getParameter("table"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="fr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<body>
<% 
	try {
		db.insertRow(table, values);
		pageContext.forward("tableContents.jsp?insertion=done");
	} catch(Exception e) { pageContext.forward("tableContents.jsp?insertion=" + URLEncoder.encode(e.getMessage())); }
%>
</body>
</html>