package Db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database
{  
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{  Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/filedb", "root", "root");
		return conn;
	}
}
