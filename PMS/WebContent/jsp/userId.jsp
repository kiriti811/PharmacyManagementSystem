<%@page import="DbManager.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javaActionForms.dropDown"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="../js/jquery-1.11.1.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"
	src="/PMS/script/datetimepicker.js"></script>

<head>
<div style="padding-left: 10%;"><h1></h1></div>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/PMS/css/calender.css"
	type="text/css" media="all" />
<link REL="StyleSheet" TYPE="text/css"
	HREF="/PMS/css/styles.css">
<script src="/PMS/script/calender.js"
	type="text/javascript"></script>
<title>Success Page</title>
</head><center>
<body onload="init()">
	<div><jsp:include page='header.jsp'></jsp:include>
	</div>
	<div>
		
			<br><br><br><center>
			Your Login id is "<%=(String)session.getAttribute("xyzId") %>" You can login to the system with this username and password you have set	
			<br><br>
			<a href="/PMS/jsp/Index.jsp">Click here to go to home page</a>
			</center>
	</div>

</body>

</html>