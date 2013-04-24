<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="projet2.Database" %>
    
<%@ page errorPage="error.jsp" %>

<%  
	Database db = (Database)application.getAttribute("database"); 
	String table = request.getParameter("table");
	int fields = Integer.parseInt(request.getParameter("fields"));
	
	boolean tableExists = false;
	if(!table.equals("")) {
		tableExists = db.tableExists(table);
		
	}
%>

<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Ajouter une table</title>
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
              <li class="active"><a href="#">Ajouter une table</a></li>
              <li><a href="index.jsp">Retour à l'accueil</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
    
      <h1>Ajouter une table</h1>

      <ul class="breadcrumb">
        <li><a href="index.jsp">Accueil</a> <span class="divider">/</span></li>
        <li><a href="manageTables.jsp">Gérer les tables</a> <span class="divider">/</span></li>
        <li class="active">Ajouter une table</li>
      </ul>

      <% 
      	// Print an alert if table already exists
      	if(tableExists) {
      		out.println("<div class=\"alert alert-error\"><strong>Oups</strong>... La table " + table + " existe déjà.</div>");
      		table = "";
      	}
      %>
      <p>Nom de la table <% out.println("<input id =\"tableName\" type=\"text\" class=\"span2\" name=\"table\" value=\"" + table +"\" required>"); %>
      <%
      	out.println("<select id=\"engine\">");
			out.println("<option value=\"INNODB\">InnoDB</option>");
			out.println("<option value=\"MYISAM\">MyISAM</option>");
		out.println("</select>");
      %>
      <%= fields %> champs
      </p>
      
      <hr>
		
		<% 
		for(int i=0; i<fields; i++){
			out.println("<div id=\"table" + i + "\" style=\"display:inline\">");
			out.println("<input type=\"text\" id=\"field" + i + "\" placeholder=\"Champ n°" + (i + 1) +"\" required>");
			out.println("<select id=\"type" + i + "\" required />");
				out.println("<option value=\"TINYINT\">TINYINT</option>");
				out.println("<option value=\"SMALLINT\">SMALLINT</option>");
				out.println("<option value=\"MEDIUMINT\">MEDIUMINT</option>");
				out.println("<option value=\"INT\">INT</option>");
				out.println("<option value=\"INTEGER\">INTEGER</option>");
				out.println("<option value=\"BIGINT\">BIGINT</option>");
				out.println("<option value=\"REAL\">REAL</option>");
				out.println("<option value=\"DOUBLE\">DOUBLE</option>");
				out.println("<option value=\"FLOAT\">FLOAT</option>");
				out.println("<option value=\"DECIMAL\">DECIMAL</option>");
				out.println("<option value=\"NUMERIC\">NUMERIC</option>");
				out.println("<option value=\"DATE\">DATE</option>");
				out.println("<option value=\"TIME\">TIME</option>");
				out.println("<option value=\"TIMESTAMP\">TIMESTAMP</option>");
				out.println("<option value=\"DATETIME\">DATETIME</option>");
				out.println("<option value=\"CHAR\">CHAR</option>");
				out.println("<option value=\"VARCHAR(255)\">VARCHAR(255)</option>");
				out.println("<option value=\"TINYBLOB\">TINYBLOB</option>");
				out.println("<option value=\"MEDIUMBLOB\">MEDIUMBLOB</option>");
				out.println("<option value=\"LONGBLOB\">LONGBLOB</option>");
				out.println("<option value=\"TINYTEXT\">TINYTEXT</option>");
				out.println("<option value=\"TEXT\">TEXT</option>");
				out.println("<option value=\"MEDIUMTEXT\">MEDIUMTEXT</option>");
				out.println("<option value=\"LONGTEXT\">LONGTEXT</option>");
				out.println("<option value=\"ENUM\">ENUM</option>");
				out.println("<option value=\"SET\">SET</option>");
				out.println("<option value=\"spatial_type\">spatial_type</option>");
				
			out.println("</select>");
				out.println("<select id=\"null" + i + "\" >");
				out.println("<option value=\"\"> </option>");
				out.println("<option value=\"NOT NULL\">NOT NULL</option>");
			out.println("</select>");
			
			out.println("</select>");
				out.println("<select id=\"increment" + i + "\" >");
				out.println("<option value=\"\"> </option>");
				out.println("<option value=\"AUTO_INCREMENT\">AUTO_INCREMENT</option>");
			out.println("</select>");
			
			out.println("<input type=\"checkbox\" id=\"primary" + i +"\" value=\"primary\">    Clé primaire");
			
			out.println("</div>");
		} %>
		<br>
		<br>
		<button type="submit" class="btn" onclick="javascript:addTable('<%= fields %>')">Ajouter la table</button>
	  
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
