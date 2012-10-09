import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class DBConn {
	
	private static final String JDBC_DRIVER = "org.postgresql.Driver";
	private static final String URL = "jdbc:postgresql://localhost:5432/CLF";
	private static final String USERNAME = "postgres";
	private static final String PASSWORD = "rattle";

	public static Connection getConn()
	   {
	      Connection dbConn = null;
	      
	      // Explicitly load the JDBC driver
	      try{Class.forName(JDBC_DRIVER);
	      }
	      catch (ClassNotFoundException e){System.out.println(e);}
	      // Create a connection to the database
	      try
	      {
	         dbConn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	         
	      }
	      catch (SQLException e)
	      {
	         System.out.println("Unable to connect to database\n"+e.getMessage());
	         System.exit(1);
	      }
	      return dbConn;
	   } // main

}
