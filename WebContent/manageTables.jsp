<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="projet2.Database"%>

<%@ page import="java.net.URLDecoder" %>

<%@ page errorPage="error.jsp" %>

<% 	
	Database db = (Database)application.getAttribute("database"); 
	
	String deletion = request.getParameter("deletion");
	if(deletion != null) deletion = URLDecoder.decode(deletion);	
	
	String creation = request.getParameter("creation");
	if(creation != null) creation = URLDecoder.decode(creation);	
%>

<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Gérer les tables</title>
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
              <li class="active"><a href="#">Gérer les tables</a></li>
              <li><a href="index.jsp">Retour à l'accueil</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
    
      <h1>Gérer les tables</h1>

      <ul class="breadcrumb">
        <li><a href="index.jsp">Accueil</a> <span class="divider">/</span></li>
        <li class="active">Gérer les tables</li>
      </ul>
      
      	<% // When we deleted a table
		if(deletion != null) {
			if(deletion.equals("done")) {
				out.print("<div class=\"alert alert-success\" style=\"display:block\">");
				out.print("La table a bien été supprimée.");
			} else  {
				out.print("<div class=\"alert alert-danger\" style=\"display:block\">");
				out.print(deletion);
			}
			out.print("</div>");
		} 
		%>
		
		<% // When we ceated a table
		if(creation != null) {
			if(creation.equals("done")) {
				out.print("<div class=\"alert alert-success\" style=\"display:block\">");
				out.print("La table a bien été créée.");
			} else  {
				out.print("<div class=\"alert alert-danger\" style=\"display:block\">");
				out.print(creation);
			}
			out.print("</div>");
		} 
		%>
      
      
      <div id="warningDeletion" class="alert" style="display:none">
        <a href="#" class="close" data-dismiss="alert">×</a>
  		<strong>Attention !</strong> Vous êtes sur le point de supprimer la table <strong><span id="tableId"></span></strong>. Cette opération est irréversible.
  		<button id="cancelDeletion" class="btn" type="button">Annuler</button>
  		<button id="confirmDeletion" class="btn btn-danger" type="button">Supprimer</button>
      </div>
      
      
      <table class="table table-striped table-bordered table-hover">
      		<thead>
      			<th>Table</th>
      			<th>Structure</th>
      			<th>Contenu</th>
      			<th><span class="label label-important">Supprimer</span></th>
	      	</thead>

		<% 
    		for(String table : db.getTables()) {
    			out.println("<tr>");
    			out.println("<td>" + table + "</td>");
    			out.println("<td><a href=\"tableStructure.jsp?table=" + table + "\"><i class=\"icon-search\"></i></a></td>");
    			out.println("<td><a href=\"tableContents.jsp?table=" + table + "\"><i class=\"icon-th-list\"></i></a></td>");
    			out.println("<td><i class=\"icon-trash\" onclick=\"javascript:confirmTableDeletion('" + table + "');\"></i></td>");
    			out.println("</tr>");
    		} 	
      	%>
      	
      </table>
      
      <form class="navbar-form pull-left" method="post" action="addTable.jsp">
		<input type="text" class="span2" name="table" placeholder="Nom de la table" required>
		<input type="number" min = "0" class="span2" name="fields" placeholder="Nombre de champs" required>
		<button type="submit" class="btn">Ajouter la table</button>
	  </form>
		
	  <br>
	  <br>
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
    
    <!-- My script -->
	<script src="scripts.js"></script>
	
  </body>
</html>
