<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="projet2.Database"%>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>

<%@ page errorPage="error.jsp" %>

<%@ page import="java.util.ArrayList" %>

<%  
	String table = request.getParameter("table");	
	
	String deletion = request.getParameter("deletion");
	if(deletion != null) deletion = URLDecoder.decode(deletion);
	
	String insertion = request.getParameter("insertion");
	if(insertion != null) insertion = URLDecoder.decode(insertion);

	Database db = (Database)application.getAttribute("database"); 
%>

<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <title>Contenu de la table <%= table %></title>
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
              <li class="active"><a href="#">Contenu de la table <%= table %></a></li>
              <li><a href="index.jsp">Retour à l'accueil</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
    
      <h1>  
      	<div class="btn-group">
  			<a class="btn" href="tableStructure.jsp?table=<%= table %>">Structure</a>
  			<button class="btn active">Contenu</button>
  		</div>
  		Table <em><%= table %></em> 
  	  </h1>


      <ul class="breadcrumb">
        <li><a href="index.jsp">Accueil</a> <span class="divider">/</span></li>
        <li><a href="manageTables.jsp">Gérer les tables</a> <span class="divider">/</span></li>
        <li class="active">Table <%= table %></li>
      </ul>
      
      	<!--  Alerts -->

		<% // When we deleted a row
		if(deletion != null) {
			if(deletion.equals("done")) {
				out.print("<div class=\"alert alert-success\" style=\"display:block\">");
				out.print("L'enregistrement a bien été supprimé.");
			} else  {
				out.print("<div class=\"alert alert-danger\" style=\"display:block\">");
				out.print(deletion);
			}
			out.print("</div>");
		} 
		%>

		<% // When we inserted a row
		if(insertion != null) {
			if(insertion.equals("done")) {
				out.print("<div class=\"alert alert-success\" style=\"display:block\">");
				out.print("L'enregistrement a bien été inséré");
			} else  {
				out.print("<div class=\"alert alert-danger\" style=\"display:block\">");
				out.print("<strong>Aïe !</strong> Petit problème : " + insertion);
			}
			out.print("</div>");
		} 
		%>

		<!-- End of alerts -->

      <div id="warningDeletion" class="alert" style="display:none">
  		<strong>Attention !</strong> Voulez-vous vraiment supprimer cet enregistrement ? Cette opération est irréversible.
  		 <button id="cancelDeletion" class="btn" type="button">Annuler</button>
  		 <button id="confirmDeletion" class="btn btn-danger" type="button">Supprimer</button>
      </div>

      	<table id="content" class="table table-striped table-bordered">
      		<thead>
      			<% 
      				int columns = 0;
					ArrayList<String> header = db.getTableColumns(table);
      			
	      			for(String column : header) {
	      				columns++;
	      				out.println("<th id=\"header" + (columns - 1) + "\" >" + column + "</th>");
	      			}
      			%>
	      		<th><span class="label label-important">Supprimer</span></th>
	      	</thead>
	      	<tbody>
			<% 
				int primaryFields = db.getPrimaryFields(table);
	
				for(ArrayList<String> row : db.getTableColumnsContents(table)) {
					out.println("<tr>");
					for(String data : row) out.println("<td>" + data + "</td>");
					
	    			out.println("<td><i class=\"icon-trash\" onclick=\"javascript:confirmRowDeletion('" + table + "', '" 
	    								+ header.get(primaryFields) + "', '" + row.get(primaryFields) + "');\"></i></td>");
	    			out.println("</tr>");
	  			}
			%>
				<tr id="newRow" style="display:none">
					<% 
						for(int i = 0; i < columns; i++) {
							String fieldName = header.get(i);
							out.println("<td><input type=\"text\" class=\"span2\" id=\"field" + i + "\" placeholder=\"" + fieldName + "\" required /></td>");
						}
					%>
					<td>
						<button id="confirmNewRow" class="btn btn-primary" type="button">Valider</button>
						<button id="cancelNewRow" class="btn btn-danger" type="button">Annuler</button>
					</td>
				</tr>
			</tbody>
      	</table>

        <button id="addRow" class="btn" type="button" onclick="javascript:insertRow('<%= table %>')">Ajouter un rang</button>
      
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
