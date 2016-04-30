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
	
	function ajaxSyncRequest()
	{
		//Creating a new XMLHttpRequest object
		var xmlhttp;
		if (window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest(); //for IE7+, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}
		//Create a asynchronous GET request
		xmlhttp.open("GET", "/PMS/GetTimeServlet", false);
		xmlhttp.send(null);
		//Execution blocked till server send the response
		if (xmlhttp.readyState == 4) { 
			if (xmlhttp.status == 200) 
			{
				alert(xmlhttp.response);
				var	test	=	xmlhttp.response;
				var sel = document.getElementById("medicineName");
				for(var i = 0; i < test.length; i++) {
				    var opt = document.createElement("option");
				    opt.innerHTML = test[i];
				    opt.value = test[i];
				    sel.appendChild(opt);
				}
				document.getElementById("medicineName").innerHTML = xmlhttp.responseText;
			} 
			else
			{
				alert('Something is wrong !!');
			}
		}
	}
	
</script>
<head>
<link rel="stylesheet" href="/PMS/css/calender.css" type="text/css" media="all" />
<script language="javascript" type="text/javascript" src="/PMS/script/datetimepicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/PMS/css/styles.css">
</head>
<body><center>
<html>
<div>
<form action="/PMS/addMedicines.do" name="myform" id="myform" method="post">

<table style="width: 100%;height: 90%">
<tr>
<td width="30%"></td>
<td><table><tr>
<td><h1>Search Medicines</h1></td>

</tr>

<tr><td>MEDICINE NAME</td>
<td>
<input  name="medicineName" id="medicineName" type="text" onkeydown="ajaxSyncRequest()">
</td>
<select id=test name=test >

</tr>
</table>
</td></tr>
</table>
</form>
</div>
</body>
<script>



</script>
</html>