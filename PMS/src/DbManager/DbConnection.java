
package DbManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
static Connection	con	=	null;
public static Connection getConnection(){
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con	=	DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "pharmacy", "password");
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return con;
}
}
