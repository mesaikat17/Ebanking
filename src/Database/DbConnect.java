package Database;
import java.sql.*;

public class DbConnect {

	static Connection cn=null;
	static String driver="com.mysql.jdbc.Driver";
	static String url="jdbc:postgressql://"+ "ec2-18-233-137-77.compute-1.amazonaws.com:5432"+"/d6hkc11isjn8kf";
	static String user="sefxjkhlqzfefc";
	static String pass="4104533756c7bc2e4082b72b616643f9654f2f850f2597b43f2b1e90bc2f5d42";
	
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
