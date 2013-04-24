<%@page import="projet2.Database"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error.jsp" %>

<%@ page import="java.util.ArrayList" %>

<% 
	String table = request.getParameter("table"); 
	Database db = (Database)application.getAttribute("database");
%>

<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Détail de la table <%= table %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Quentin Barrand">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="ico/favicon.png">
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">JDBC / Java EE</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Détail de la table <%= table %></a></li>
              <li><a href="index.jsp">Retour à l'accueil</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">		
            <h1>  
      	<div class="btn-group">
  			<button class="btn active">Structure</button>
  			<a class="btn" href="tableContents.jsp?table=<%=table %>">Contenu</a>
  		</div>
  		Table <em><%= table %></em> 
  	  </h1>
      
      		<ul class="breadcrumb">	
  				<li><a href="index.jsp">Accueil</a> <span class="divider">/</span></li>
  				<li><a href="manageTables.jsp">Gérer les tables</a> <span class="divider">/</span></li>
  			<li class="active">Table <%= table %></li>
		</ul>

      <div>
      	<table class="table table-striped table-bordered table-hover">
      		<thead>
      			<th>Champ</th>
      			<th>Type</th>
      			<th>Null</th>
      			<th>Clé</th>
      			<th>Valeur par défaut</th>
      			<th>Autres</th>
	      	</thead>
	      		
	      <%
  	  		
	      	for(ArrayList<String> columns : db.getTableColumnsDetails(table)) {
  	    	 	out.println("<tr>");
  	    	 	for(String row : columns) out.println("<td>" + row + "</td>"); 
  	    	 	out.println("</tr>");
	        }
	      %>
      		
      	</table>
      </div>
		
		<hr>
		<footer>
        	<p>Quentin Barrand - IUT de Belfort-Montbéliard - 2013</p>
      	</footer>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap-transition.js"></script>
    <script src="js/bootstrap-alert.js"></script>
    <script src="js/bootstrap-modal.js"></script>
    <script src="js/bootstrap-dropdown.js"></script>
    <script src="js/bootstrap-scrollspy.js"></script>
    <script src="js/bootstrap-tab.js"></script>
    <script src="js/bootstrap-tooltip.js"></script>
    <script src="js/bootstrap-popover.js"></script>
    <script src="js/bootstrap-button.js"></script>
    <script src="js/bootstrap-collapse.js"></script>
    <script src="js/bootstrap-carousel.js"></script>
    <script src="js/bootstrap-typeahead.js"></script>

  </body>
</html>
