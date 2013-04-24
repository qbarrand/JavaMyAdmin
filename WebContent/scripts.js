function confirmTableDeletion(table) {
	window.scroll();
	
	document.getElementById("warningDeletion").style.display = "block";
	document.getElementById("tableId").innerHTML = table;
	
	document.getElementById('cancelDeletion').onclick = 
			function() { document.getElementById('warningDeletion').style.display = "none"; };
	
	document.getElementById('confirmDeletion').onclick = 
			function() { document.location.href = 'deleteTable.jsp?table=' + table; };
}


function confirmRowDeletion(table, primaryName, primaryData) {
	window.scroll();
	
	document.getElementById("warningDeletion").style.display = "block";
	
	document.getElementById('cancelDeletion').onclick = 
			function() { document.getElementById('warningDeletion').style.display = "none"; };
	
	document.getElementById('confirmDeletion').onclick = 
			function() { document.location.href = 'deleteRow.jsp?table=' + table + '&query=' + encodeURIComponent(primaryName + '= "' + primaryData+"\""); };
}

function insertRow(table) {
	document.getElementById('newRow').style.display = "";
	document.getElementById('addRow').style.display = "none";
	
	document.getElementById('cancelNewRow').onclick = function() { 
		document.getElementById('newRow').style.display = "none";
		document.getElementById('addRow').style.display = "";
		};

	document.getElementById('confirmNewRow').onclick = function() { 
		var header = new Array();
		var values = new Array();
		
		for(var i = 0; i < document.getElementById('content').rows[0].cells.length-1; i++) {
			header.push(document.getElementById("header" + i).innerHTML);
			values.push("\"" + document.getElementById("field" + i).value + "\"");
		}
		var query = "INSERT INTO " + table + "(" + header.toString() + ") VALUES(" + values.toString() + ");";
		
		alert(query);
		document.location.href = 'insertRow.jsp?table=' + table + '&values=' + encodeURIComponent(values); 
		};
}

function addTable(fields) {
	var query = "CREATE TABLE IF NOT EXISTS " + document.getElementById("tableName").value + "(";
	var primaryKeys = new Array();
	
	if(fields > 0 ) {
		query += document.getElementById("field0").value;
		query += " " + document.getElementById("type0").value;
		query += " " + document.getElementById("null0").value;
		query += " " + document.getElementById("increment0").value;
		if(document.getElementById("primary0").checked == true) primaryKeys.push(document.getElementById("field0").value); 
	}
	
	for(var i = 1; i < fields; i++) {
		query += ", " + document.getElementById("field" + i).value;
		query += " " + document.getElementById("type" + i).value;
		query += " " + document.getElementById("null" + i).value;
		query += " " + document.getElementById("increment" + i).value;
		if(document.getElementById("primary" + i).checked == true) primaryKeys.push(document.getElementById("field" + i).value); 
	}
	if(primaryKeys.length > 0) query += ", PRIMARY KEY("+ primaryKeys.toString() + ")";
	
	query += ") ENGINE="+ document.getElementById("engine").value + ";";
	
	document.location.href = 'createTable.jsp?query=' + encodeURIComponent(query); 
}


function dontAddRow() {
	document.getElementById('newRow').style.display = "none";
}

