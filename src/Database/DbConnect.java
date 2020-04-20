package Database;
import java.sql.*;

public class DbConnect {

	static Connection cn=null;
	static String driver="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/ADJAVA";
	static String user="saikat";
	static String pass="saikat";
	
	public static Connection getDb()
	{
		try
		{
			Class.forName(driver);
			System.out.println("Database Entry");
			
			cn=DriverManager.getConnection(url,user,pass);
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return cn;
	}
}
