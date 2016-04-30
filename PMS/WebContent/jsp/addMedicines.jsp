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
		document.getElementById("remainingStock").value	=	document.getElementById("totalUnits").value;
		alert(document.getElementById("remainingStock").value);
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
<%	Object obj	=	null;
	addMedicinesBean object	=	new	addMedicinesBean();
	object	=	(addMedicinesBean)request.getAttribute("object");
	if(object==obj)
	{
		object	=	new	addMedicinesBean();
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
<tr>
<tr>
<td>MEDICINE TYPE</td>
				<td><select id="medicineType" name="medicineType">
				<%
				Vector	vec	=	dropDown.dropDown("medicineType");
				for(int i=0;i<vec.size();i++) {%>
				<option value	=<%=vec.get(i) %>><%=vec.get(i+1) %></option>
				<%i++;
				} %>
				</select></td>
</tr>
<tr><td>MEDICINE NAME</td>
<td><input name="medicineName" id="medicineName" value="<%=object.getMedicineName()%>" type="text"></td></tr>
<tr><td>MANUFACTURER</td>
<td><input name="manufacturer" id="manufacturer" value="<%=object.getManufacturer()%>" type="text"></td></tr>
<tr><td>BATCH NUMBER</td>
<td><input name="batchNumber" id="batchNumber" value="<%=object.getBatchNumber()%>" type="text"></td></tr>
<tr><td>EXPIRY DATE</td>

<td>  		<input type="Text" readonly="readonly" id="expiryDate" name="expiryDate" maxlength="13" size="13">
	  		<a href="javascript:NewCal('expiryDate','mmddyyyy',false,24)">
	  		<img src="/PMS/images/cal.gif" width="16" height="16" border="0" alt="Pick a date" value="<%=object.getExpiryDate()%>"></a>
</td>
<tr><td>UNIT COST</td>
<td><input name="unitCost" id="unitCost" type="text" value="<%=object.getUnitCost()%>"></td></tr>
<tr><td>TOTAL UNITS</td>
<td><input onkeyup="addTotal()" name="totalUnits" id="totalUnits" type="text" value="<%=object.getTotalUnits()%>"></td></tr>
<tr><td>TOTAL PURCHASECOST</td>
<td><input name="totalPurchaseCost" id="totalPurchaseCost" readonly="readonly" type="text" value="<%=object.getTotalPurchaseCost()%>"></td></tr>
<tr><td>SAFTEY STOCK</td>
<td><input name="safetyStock" id="safetyStock" type="text" value="<%=object.getSafetyStock()%>"></td></tr>
  
<input name="remainingStock" id="remainingStock" type="hidden" value="<%=object.getRemainingStock()%>">
<tr><td><input type=button  class=button value=submit onclick="add()"></td>
<td><input type=button  class=button value=Reset onclick="Reset()"></td>
</tr>	

<tr><td>&nbsp;</td><td>	</td></tr>
</table>
	<iframe style="border: 1px; height: 1000px; weight: 1200px"
			 src="/PMS/addMedicines.do?method=list"></iframe> 
</td></tr>
</table>
</form>
</div>
</body>

</html>