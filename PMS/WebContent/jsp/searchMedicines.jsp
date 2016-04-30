<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String	message	=	"Data Added Successfully";
%>
<script type="text/javascript">
	function add() {
	
		document.myform.submit();
	}
	function addTotal(){
		document.getElementById("totalPurchaseCost").value	=	document.getElementById("unitCost").value	*	document.getElementById("totalUnits").value;
	}
	function Reset(){
		window.open("/PMS/addMedicines.do?method=emptyaction","_self")
	}
</script>
<head>
<link rel="stylesheet" href="/PMS/css/calender.css" type="text/css" media="all" />
<script language="javascript" type="text/javascript" src="/PMS/script/datetimepicker.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/PMS/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/PMS/addMedicines.do" name="myform" id="myform" method="post">

<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
<td><h1>Search Medicines</h1></td>

</tr>


<tr><td>MEDICINE NAME</td>
<td><input onkeyup="Search()" name="medicineName" id="medicineName" type="text"></td></tr>
</table>
	<iframe name="searchResult" id="searchResult" style="border: 1px; height: 1000px; width: 800px"
			 src=""></iframe> 
</td></tr>
</table>
</form>
</div>
</body>
<script>

function Search(){
	document.getElementById("searchResult").src	=	"/PMS/medicineInventory.do?method=search&p="+document.getElementById("medicineName").value;
}

</script>
</html>