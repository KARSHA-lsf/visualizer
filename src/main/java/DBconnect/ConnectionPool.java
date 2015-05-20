package DBconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import system_config.R_sysConfig;


public class ConnectionPool {

	public Connection getConnection() {
		
		system_config.R_sysConfig conf = new R_sysConfig();
		Properties prog = conf.get_prog();
		/*String Database = prog.getProperty("database");
		String user = prog.getProperty("dbuser");
		String password = prog.getProperty("dbpassword");*/
		
		String Database = "jdbc:mysql://localhost:3306/visualizer";
		String user = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL JDBC Driver Not found");
			e.printStackTrace();
			return null;
		}

		Connection connection = null;

		try {
			connection = DriverManager.getConnection(Database,user,password);

		} catch (SQLException e) {
			System.out.println("Connection Failed!");
			e.printStackTrace();
			return null;
		}

		if (connection != null) {
			System.out.println("Connected to the database");
			
			return connection;

		} else {
			System.out.println("Failed to make connection!");
			return null;
		}
	}

	public void freeConnection(Connection connection) {
		
		System.out.println("Database connection closed");
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
