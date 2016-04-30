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
	var	finalResult	=	1;
	
	function setDate() {
		var today = new Date(); 
		var dd = today.getDate(); 
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear(); 
		if(dd<10){dd='0'+dd} 
		if(mm<10){mm='0'+mm} 
		document.getElementById("reportedDate").value	=	mm+'-'+dd+'-'+yyyy;
	}
	
	function add() {
		if(finalResult==0)
		{
			alert("check remaining stock and stock given");
			finalResult==1;
			return	false;
		}
		else{
			document.myform.submit();	
		}
		
	}
	function addTotal(){
		var	givenStock	=	document.getElementById("totalUnits").value*1;
		var	remStock	=	document.getElementById("remainingStock").value*1;
		if(remStock<givenStock)
		{
			finalResult	=	0;
			alert("You cant given stock more than remaining stock");
			return false;
		}
		else{
			document.getElementById("totalPurchaseCost").value	=	document.getElementById("unitCost").value	*	document.getElementById("totalUnits").value;
		}
	}
	function Reset(){
		window.open("/PMS/sellMedicines.do?method=emptyaction","_self")
	}
	function Prescription(){
		window.open("/PMS/sellMedicines.do?method=prescription","_self")
	}
	
	function ajax(){
		var	url	= "/PMS/ajax?f="+document.getElementById("medicineName").value;
		
		var	asyncRequest;
		try{
			asyncRequest			=	new	XMLHttpRequest();
			asyncRequest.onreadystatechange =	function(){
				if(asyncRequest.readyState	==	4	&& asyncRequest.status==200){
					var	result	=	asyncRequest.responseText;
					document.getElementById("medicineType").value=result.substring(0,result.indexOf("$$$"));
					
					result	=	result.substring(result.indexOf("$$$")+3,result.legth);
					document.getElementById("manufacturer").value=result.substring(0,result.indexOf("$$$"));
					result	=	result.substring(result.indexOf("$$$")+3,result.legth);
					document.getElementById("batchNumber").value=result.substring(0,result.indexOf("$$$"));
					result	=	result.substring(result.indexOf("$$$")+3,result.legth);
					document.getElementById("expiryDate").value=result.substring(0,result.indexOf("$$$"));
					result	=	result.substring(result.indexOf("$$$")+3,result.legth);
					document.getElementById("unitCost").value=result.substring(0,result.indexOf("$$$"));
					result	=	result.substring(result.indexOf("$$$")+3,result.legth);
					document.getElementById("remainingStock").value=result.substring(0,result.length);
				}
			}
			asyncRequest.open("GET", url , true);
			asyncRequest.send(null);
		}
		catch(exception)
		{
			alert("try Again");
		}
	}
</script>
<head>
<link rel="stylesheet" href="/PMS/css/calender.css" type="text/css" media="all" />
<script language="javascript" type="text/javascript" src="/PMS/script/datetimepicker.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/PMS/css/styles.css">
</head>
<body onload="setDate()"><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/PMS/sellMedicines.do" name="myform" id="myform" method="post">
<%	Object obj	=	null;
	sellMedicinesBean object	=	new	sellMedicinesBean();
	object	=	(sellMedicinesBean)request.getAttribute("object");
	if(object==obj)
	{
		object	=	new	sellMedicinesBean();
	%>
		<input type=hidden name=method id=method value=add>
	<%}else{
		%>
		<input type=hidden name=method id=method value=edit>
		<%
	}
%>

<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
<td><h1>Add Medicines</h1></td>

</tr>
	<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>

	<input name="id" id="id" type="hidden" value="<%=object.getId()%>">



<input name="medicineType" id="medicineType" value="<%=object.getMedicineName()%>" type="hidden" readonly="readonly">


<tr><td>MEDICINE NAME</td>

		<td><select id="medicineName" name="medicineName" onchange="ajax()">
				<%
				Vector	vec	=	dropDown.dropDown("medicineName");
				for(int i=0;i<vec.size();i++) {%>
				<option value	="<%=vec.get(i+1) %>"><%=vec.get(i+1) %></option>
				<%i++;
				} %>
				</select>
				
				</td>


</tr>


<tr><td>MANUFACTURER</td>
<td><input name="manufacturer" id="manufacturer" value="<%=object.getManufacturer()%>" type="text" readonly="readonly"></td></tr>



<tr>

<tr><td>BATCH NUMBER</td>
<td><input name="batchNumber" id="batchNumber" value="<%=object.getBatchNumber()%>" type="text" readonly="readonly"></td></tr>
<tr><td>EXPIRY DATE</td>

<td>  		<input type="Text" readonly="readonly" id="expiryDate" name="expiryDate" maxlength="13" size="13">
	</a>
</td>



<tr><td>UNIT COST</td>
<td><input name="unitCost" id="unitCost" type="text" value="<%=object.getUnitCost()%>" readonly="readonly"></td></tr>


<tr><td>TOTAL UNITS</td>
<td><input onkeyup="addTotal()" name="totalUnits" id="totalUnits" type="text" value="<%=object.getTotalUnits()%>" ></td></tr>

<tr><td>TOTAL PURCHASECOST</td>
<td><input name="totalPurchaseCost" id="totalPurchaseCost" readonly="readonly" type="text" value="<%=object.getTotalPurchaseCost()%>"></td></tr>

  <tr><td>REMAINING STOCK</td>
<td><input name="remainingStock" id="remainingStock" type="text" readonly="readonly" value="<%=object.getRemainingStock()%>"></td></tr>


<%if(((String)session.getAttribute("userName")).equals("admin")){ %>

<tr><td>PATIENT NAME</td>
<td><input name="patientName" id="patientName" type="text" value="<%=object.getUserName()%>"></td></tr>
<%} else {%>

<tr><td>PATIENT NAME</td>
<td><input name="patientName" id="patientName" type="text" value="<%=session.getAttribute("userName")%>"></td></tr>


<%} %>

<input type="hidden" name="billid" id="billid" value="BILL">

<%if(((String)session.getAttribute("userName")).equals("admin")){ %>


<input type="hidden" name="status" id="status" value="Approved">

<%} else {%>

<input type="hidden" name="status" id="status" value="unApproved">


<%} %>

<tr>
<td>
Date
</td>
<td>
<input type="text"	id	=	"reportedDate"	name	=	"reportedDate"	readonly="readonly"		>
</td>
</tr>


<tr><td><input type=button  class=button value=submit onclick="add()"></td>
<td><input type=button  class=button value=Reset onclick="Reset()"></td>
<%
	Vector	testData	=	null;
	Vector	childData	=	(Vector)session.getAttribute("childData");
	if(testData==childData)
	{%>

	
		
	<%}
	else{%>
	
		<td><input type=button  class=button value=Prescription onclick="Prescription()"></td>
			
	<%}
%>


</tr>	



<tr><td>&nbsp;</td><td>	</td></tr>
</table>
	<iframe style="border: 1px; height: 1000px; weight: 1200px"
			 src="/PMS/sellMedicines.do?method=list"></iframe> 
</td></tr>
</table>
</form>
</div>
</body>

</html>