<%@page import="projet2.Database"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error.jsp" %>

<%@ page import="java.util.ArrayList" %>

<%
	Database db = new projet2.Database();
	application.setAttribute("database", (Database)db);
%>

<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>JDBC / Java EE</title>
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
              <li class="active"><a href="#">Accueil</a></li>
              <!-- 
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li> -->
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
    	
      <h1>JavaMyAdmin <small>(yet another version - by Quentin Barrand)</small></h1>
      	<ul class="breadcrumb">
  			<li class="active"><a href="#">Accueil</a></li>
		</ul>
      	
      	
      <div class="row">
      	<!-- List the tables of the database -->
        <div class="span5 well">
          <h2>Tables dans la base <small><%= db.getName() %></small></h2>
      	 	<p>
      	 	<% for(String table : db.getTables()) out.println("<a href=\"tableStructure.jsp?table=" + table + "\">" + table + "</a><br>"); %>
      		</p>
      		<p><a class="btn" href="manageTables.jsp">Gérer les tables &raquo;</a></p>  	
        </div>
        
        <!-- Create a new table in the database -->
        <div class="span5 well">
          <h2>Créer une nouvelle table</h2>
          	<form class="navbar-form pull-left" method="post" action="addTable.jsp">
  				<input type="text" class="span2" name="table" placeholder="Nom de la table" required>
  				<input type="number" min = "0" class="span2" name="fields" placeholder="Nombre de champs" required>
  				<button type="submit" class="btn">Ajouter la table</button>
			</form>
        </div>
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
