package projet2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Database {
	
	protected Connection connection;
	protected String database;
	
	public Database() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		String server = "";
    	String database = "";
    	String user = "";
    	String password = "";
		
		String url = "jdbc:mysql://" + server + "/" + database + "?user=" + user + "&passwd=" + password;
						
		this.connection = DriverManager.getConnection(url, user, password);
		this.database = database;
	}
	
	public ArrayList<String> getTables() throws SQLException {
		ArrayList<String> tables  = new ArrayList<String>();
		
		Statement statement = this.connection.createStatement();
		String query = "SHOW TABLES";
		
		ResultSet rs = statement.executeQuery(query);
		if(rs.next()) do {
			tables.add(rs.getString(1));
		} while(rs.next());
		
		return tables;
	}
	
	public ArrayList<String> getTableColumns(String table) throws SQLException {
		ArrayList<String> columns  = new ArrayList<String>();
		
		Statement statement = this.connection.createStatement();
		String query = "SHOW COLUMNS FROM " + table + ";";
		
		ResultSet rs = statement.executeQuery(query);
		if(rs.next()) do {
			columns.add(rs.getString(1));
		} while(rs.next());
		
		return columns;
	}	

	// Get the tables names + the details of each field
	public ArrayList<ArrayList<String>> getTableColumnsDetails(String table) throws SQLException {
		ArrayList<ArrayList<String>> columns  = new ArrayList<ArrayList<String>>();
		
		Statement statement = this.connection.createStatement();
		String query = "SHOW COLUMNS FROM " + table + ";";
		
		ResultSet rs = statement.executeQuery(query);
		
		if(rs.next()) do {
			ArrayList<String> row = new ArrayList<String>();
			for(int i = 0; i < rs.getMetaData().getColumnCount(); i++) row.add(rs.getString(i+1));
			columns.add(row);
		} while(rs.next());
		
		return columns;
	}	
	
	// Get the content of the tables
	public ArrayList<ArrayList<String>> getTableColumnsContents(String table) throws SQLException {
		ArrayList<ArrayList<String>> columns  = new ArrayList<ArrayList<String>>();
		
		Statement statement = this.connection.createStatement();
		String query = "SELECT * FROM " + table + ";";
		
		ResultSet rs = statement.executeQuery(query);
				
		if(rs.next()) do {
			ArrayList<String> data = new ArrayList<String>();
			for(int i = 0; i < rs.getMetaData().getColumnCount(); i++) data.add(rs.getString(i+1));
			columns.add(data);
		} while(rs.next());
		
		return columns;
	}		
	

	// Deletes if exists the table given in argument
	public boolean deleteTable(String table) throws SQLException {
		Statement statement = this.connection.createStatement();
		String query = "DROP TABLE IF EXISTS " + table;
		
		if(statement.executeUpdate(query) == 0) return true; else return false;
	}
	
	
	public boolean tableExists(String table) throws SQLException {
		ArrayList<String> tablesList = this.getTables();
		
		for (String t : tablesList) if (table.equals(t)) return true;
	
		return false;
	}
	
	
	public int getPrimaryFields(String table) throws SQLException {
		
		Statement statement = this.connection.createStatement();
		String query = "SHOW COLUMNS FROM " + table + ";";
		
		ResultSet rs = statement.executeQuery(query);

		int i = 1;
		
		if(rs.next()) do {
			if(rs.getString(4).equals("PRI")) return i;
		} while(rs.next());
		
		return 0;
	}
	
	public int deleteRow(String table, String where) throws SQLException {
		Statement statement = this.connection.createStatement();
		String query = "DELETE FROM " + table + " WHERE " + where;
		
		return statement.executeUpdate(query);
	}
	
	public int insertRow(String table, String values) throws SQLException {
		Statement statement = this.connection.createStatement();
		String query = "INSERT INTO " + table + " VALUES(" + values + ")";
		
		return statement.executeUpdate(query);
	}
	
	public int createTable(String query) throws SQLException {
		Statement statement = this.connection.createStatement();
		return statement.executeUpdate(query);
	}
	
	public String getName() {
		return this.database;
	}
	
}
