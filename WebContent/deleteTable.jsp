<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="projet2.Database"%>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
    
<%@ page errorPage="error.jsp" %>

<%  
	String table = request.getParameter("table"); 
	Database db = (Database)application.getAttribute("database"); 
%>

<!DOCTYPE html>
<html lang="fr">
<body>
<% 
try {
	db.deleteTable(table);
	pageContext.forward("manageTables.jsp?deletion=done");
} catch(Exception e) { pageContext.forward("manageTables.jsp?deletion=" + URLEncoder.encode(e.getMessage())); }
%>
</body>
</html>
