<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link REL="StyleSheet" TYPE="text/css" HREF="/PMS/css/styles.css">
</head>
<body>
	<%
String str = null;
if (session.getAttribute("userName")==str) {
	request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);	
} else {

if(session.getAttribute("userName").equals("admin")){
	%>
	
	<div class=nav1>
	<ul>
	<li><a href="#" style="text-decoration: none">Home</a></li>
	<li><a href="/PMS/addMedicineType.do?method=emptyaction" style="text-decoration: none">Add Medicine Type</a></li>
	<li><a href="/PMS/addMedicines.do?method=emptyaction" style="text-decoration: none">Add Medicines</a></li>
	<li><a href="/PMS/medicineInventory.do?method=list" style="text-decoration: none">Inventory</a></li>
	<li><a href="/PMS/medicineInventory.do?method=emptyaction" style="text-decoration: none">Search Medicines</a></li>
	<li><a href="/PMS/sellMedicines.do?method=emptyaction" style="text-decoration: none">Sell Medicines</a></li>
	<li><a href="/PMS/dailyReports.do?method=emptyaction" style="text-decoration: none">Daily Reports</a></li>
	<li><a href="/PMS/yearlyReports.do?method=emptyaction" style="text-decoration: none">Yearly Medicines</a></li>
	<li><a href="/PMS/logout.do?method=logout" style="text-decoration: none">Logout</a></li>
	</ul>
	</div>
	<%
	}
else
{
	%>
	<div class=nav1>
	<ul>
	<li><a href="/PMS/userProfiles.do?method=listId&id=<%=session.getAttribute("id") %>&cc=8" style="text-decoration: none">Edit Profile</a></li>
	<li><a href="/PMS/changePassword.do?method=emptyaction" style="text-decoration: none">Change Password</a></li>
	<li><a href="/PMS/medicineInventory.do?method=emptyaction" style="text-decoration: none">Search Medicines</a></li>
	<li><a href="/PMS/sellMedicines.do?method=emptyaction" style="text-decoration: none">Buy Medicines</a></li>
	<li><a href="/PMS/logout.do?method=logout" style="text-decoration: none">Logout</a></li>
	</ul>
	</div>
	<%}
}
%>
</body>
</html>