package DbManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.Vector;

import javaActionForms.medicineInventoryActionForm;


public class DbMethods {
	static DbConnection db = new DbConnection();
	static Statement st = null;
	static ResultSet res = null;
	public static void changePassword(String userName, String password) {
		// TODO Auto-generated method stub
		try {

		st = db.getConnection().createStatement();
		st.executeQuery("update userprofiles set password='"+password+"',confirmpassword='"+password+"' where username='"+userName+"'");
		st.close();
		}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String addUserProfiles(Vector columns, String formName) {
		// TODO Auto-generated method stub
		String patid = "user";
		int id = 0;
		try {

			Statement st1 = null;
			ResultSet res1 = null;
			st1 = db.getConnection().createStatement();
			res1 = st1
					.executeQuery("select userprofiles_seq.nextval from dual");
			while (res1.next()) {
				id = res1.getInt(1);
			}
			st1.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		patid = patid + id;
		String query = "Insert into userprofiles values(" + id + ",'" + patid
				+ "',";
		for (int i = 2; i < columns.size(); i++) {
			query = query + "'" + columns.get(i) + "',";
		}
		query = query.substring(0, query.length() - 1) + ",'customer')";
		try {
			st = db.getConnection().createStatement();
			st.executeQuery(query);
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return patid;
	}

	
	public static String authenticate(String userName, String password, String userType) {
		String authStatus = "Fail$$$";
		try {
			st = db.getConnection().createStatement();
			System.out.println("test");
			res = st.executeQuery("select password,id from userprofiles where username='"
					+ userName + "' and userType='"+ userType +"'");
			while (res.next()) {
				if (password.equals(res.getString(1))) {
					authStatus = "Success$$$"+res.getString(2);
				}
			}
			st.close();
			System.out.println("test1");
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return authStatus;
	}
	public static void add(Vector columns, String formName) {
		// TODO Auto-generated method stub
		String query	="Insert into "+formName+" "
				+ "values("+formName+"_seq.nextval,";
		for(int	i	=	1	;	i	<	columns.size();	i++)
		{
			query	=	query	+	"'"	+columns.get(i)+"',";
		}
		query	=	query.substring(0,query.length()-1)	+	")";
		try {
			st	=	db.getConnection().createStatement();
			st.executeQuery(query);
			st.close();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	public static int listColumnCount(String formName) {
		// TODO Auto-generated method stub
		int columnCount	=	0;
		try {
			st	=	db.getConnection().createStatement();
			res = st.executeQuery("select COUNT(*) from dba_tab_columns where table_name = '"+formName+"'");
			while(res.next()){
				columnCount	=	res.getInt(1);
			}
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return columnCount;
	}
	public static Vector listColumns(String formName,int columnCount) {
		Vector vec	=	new	Vector();
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select column_name from dba_tab_columns where table_name = '"+formName+"'");
		while(res.next()){
			vec.add(res.getString(1));
			}
		st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
	}
	public static Vector listRows(String formName,int columnCount) {
		// TODO Auto-generated method stub
		Vector	vec	=	new	Vector();
		try {
			st	=	db.getConnection().createStatement();
			res	=	st.executeQuery("select * from "+formName+" order by id");
			while(res.next()){
				for(int i	=	0;	i	<	columnCount;	i++){
				vec.add(res.getString(i+1));
				}
			}
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
		}
	public static Vector listRows(String formName,int columnCount,String str) {
		// TODO Auto-generated method stub
		Vector	vec	=	new	Vector();
		try {
			st	=	db.getConnection().createStatement();
			System.out.println("select * from "+formName+" where medicinename like '"+str+"%' order by id");
			res	=	st.executeQuery("select * from "+formName+" where medicinename like '"+str+"%' order by id");
			while(res.next()){
				for(int i	=	0;	i	<	columnCount;	i++){
				vec.add(res.getString(i+1));
				}
			}
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
		}
	public static void edit(Vector variables,Vector values, String formName, int id) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		String query	="Update "+formName+" set ";
		for(int	i	=	0	;	i	<	values.size();	i++)
		{
			if(i==0)
			{
				query	=	query+variables.get(i)	+ "="	+values.get(i)+",";
			}
			else{
				query	=	query+variables.get(i)	+ "='"	+values.get(i)+"',";
			}
		}
		query	=	query.substring(0,query.length()-1)+ " where id="+id;
		try {
			st	=	db.getConnection().createStatement();
			st.executeQuery(query);
			st.close();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	public static Vector listEdit(int id, String formName,int columnCount) {
		// TODO Auto-generated method stub
		Vector	vec	=	new	Vector();
		try {
			st	=	db.getConnection().createStatement();
			res	=	st.executeQuery("select * from "+formName+" where id="+id);
			while(res.next()){
				for(int i	=	0;	i	<	columnCount;	i++){
					vec.add(res.getString(i+1));
				}
			}
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
	}
	public static Vector dropDown(String columnName,String tableName) {
		Vector vec	=	new	Vector();
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select id,"+columnName+" from  "+tableName+"");
		
		while(res.next()){
			vec.add(res.getInt(1));
			vec.add(res.getString(2));
			}
		st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
		// TODO Auto-generated method stub
		
	}
	public static String dropDownReference(String referenceId,String columnName,String tableName) {
		String str	=	"";
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select "+columnName+" from  "+tableName+" where id="+referenceId);
		while(res.next()){
			str=res.getString(1);
			}
		st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
		// TODO Auto-generated method stub
		
	}
	public static String dropDownReference1(String referenceId,String columnName,String tableName) {
		String str	=	"";
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select "+columnName+" from  "+tableName+" where medicinename='"+referenceId+"'");
		while(res.next()){
			str=res.getString(1);
			}
		st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
		// TODO Auto-generated method stub
		
	}
	public static String getMedicineDetails(String id) {
		// TODO Auto-generated method stub
		String result	=	"";
		try {
		st	=	db.getConnection().createStatement();
		res	=	st.executeQuery("select medicinetype,manufacturer,batchnumber,expirydate,unitcost,remainingstock from  addmedicines where medicineName='"+id+"'");
		while(res.next()){

				result	=res.getString(1)+"$$$"+res.getString(2)+"$$$"+res.getString(3)+"$$$"+res.getString(4)+"$$$"+res.getString(5)+"$$$"+res.getString(6);
		}
		st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public static String addMedicines(Vector childData, String path) {
		String	billId	=	"BILL";
		String	id		=	"";
		try {
			st	=	db.getConnection().createStatement();
			res	=	st.executeQuery("SELECT billId_seq.NEXTVAL FROM DUAL");
			while(res.next()){

					billId	=	billId	+	res.getString(1);
					id		=	res.getString(1);
					
			}
			st.close();
		} catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
		float	totalCost		=	0f;
		String	reportedDate	=	"";
		Vector	medicineUpdate	=	new	Vector();
		for(int	i	=	0	;	i	<	childData.size()	;	i	++)
		{
			try{
				st	=	db.getConnection().createStatement();
				String query 	=	"insert into sellmedicines values(sellMedicines_seq.nextval,'"+childData.get(i+1)+"','"+childData.get(i+2)+"','"+childData.get(i+3)+"','"+childData.get(i+4)+"','"+childData.get(i+5)+"','"+childData.get(i+6)+"','"+childData.get(i+7)+"','"+childData.get(i+8)+"','"+childData.get(i+9)+"','"+childData.get(i+10)+"','"+billId+"','"+childData.get(i+12)+"','"+childData.get(i+13)+"')";
				medicineUpdate.add(childData.get(i+2));
				medicineUpdate.add(childData.get(i+4));
				medicineUpdate.add(childData.get(i+7));
				medicineUpdate.add(childData.get(i+9));
				totalCost	=	totalCost	+	Float.valueOf((String)childData.get(i+9)) ;
				System.out.println("insert  "+query);
				reportedDate	=	(String)childData.get(i+13);
				st.executeUpdate(query);
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
			i	=	i	+	13;
		}
		
		try{
			st	=	db.getConnection().createStatement();
			String query 	=	"insert into bill values("+ id +",'"+billId+"','"+path+"','"+totalCost+"','"+reportedDate+"')";
			System.out.println("bill   "+query);
			st.executeUpdate(query);
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}

		
		for(int	i	=	0	;	i	<	medicineUpdate.size()	;	i	++)
		{
			try{
				st	=	db.getConnection().createStatement();
				String query 	=	"update addmedicines set remainingstock='"+(Float.valueOf((String)medicineUpdate.get(i+3))-Float.valueOf((String)medicineUpdate.get(i+2)))+"' where medicinename='"+medicineUpdate.get(i)+"' and batchnumber='"+medicineUpdate.get(i+1)+"'";
				System.out.println("medicine update "+query);
				st.executeUpdate(query);
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
		}
			i	=	i	+	3;
		}
		
		
		
		return billId;
	}
	
	
	public static Vector getDailyReport(String date) {
		// TODO Auto-generated method stub
		Vector	dailyReport	=	new	Vector();
		try{
			String	temp1	=	"";
			String	query	=	"";
			if(date.equals(temp1))
			{
				query	=	"select * from bill order by id";
			}
			else if (!date.equals(temp1)) {
				query	=	"select * from bill where reportedDate='"+date+"' order by id";
			}
			System.out.println(query);
			int	temp2	=	0;
			st	=	db.getConnection().createStatement();
			res=	st.executeQuery(query);
			int 	count	=	0;
			while(res.next()){
				dailyReport.add(res.getString(2));
				dailyReport.add(res.getFloat(4));
			}
			st.close();
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return dailyReport;
	}
	public static Vector getYearlyReport(String date) {
		// TODO Auto-generated method stub
		Vector	dailyReport	=	new	Vector();
		try{
			String	temp1	=	"";
			String	query	=	"";
			if(date.equals(temp1))
			{
				query	=	"select * from bill order by id";
			}
			else if (!date.equals(temp1)) {
				query	=	"select * from bill where REPORTEDDATE like '%"+date+"%' order by id";
				System.out.println("select * from bill where REPORTEDDATE like '%"+date+"%' order by id");
			}
			int	temp2	=	0;
			st	=	db.getConnection().createStatement();
			res=	st.executeQuery(query);
			int 	count	=	0;
			while(res.next()){
				dailyReport.add(res.getString(2));
				dailyReport.add(res.getFloat(4));
			}
			st.close();
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return dailyReport;
	}

	public static Vector getBill(String billId) {
		// TODO Auto-generated method stub
		Vector	bill	=	new	Vector();
		try{
			String	temp1	=	"";
			String	query	=	"";
			query	=	"Select * from sellMedicines where billid='"+billId+"'";	
			st	=	db.getConnection().createStatement();
			res=	st.executeQuery(query);
			while(res.next()){
				bill.add(res.getString(3));
				bill.add(res.getString(4));
				bill.add(res.getString(5));
				bill.add(res.getString(6));
				bill.add(res.getFloat(7));
				bill.add(res.getFloat(8));
				bill.add(res.getString(9));
				bill.add(res.getString(11));
				bill.add(res.getString(14));
			}
			st.close();
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return bill;
	}

	
	
}