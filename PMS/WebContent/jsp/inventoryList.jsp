<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int columnCount = Integer.valueOf(request.getAttribute("columnCount").toString());
	Vector rows = (Vector) request.getAttribute("rows");
%>

<html>
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
<td>	
<table>
	<tr><h1><u>Medicine Inventory</u></h1></tr>
		<tr style="background-color: white">
	<th>Id</th>
	<th>Medicine Name</th>
	<th>Manufacturer</th>
	<th>Batch Number</th>
	<th>Expiry Date</th>
	<th>Unit Cost</th>
	<th>Total Units</th>
	<th>Total Cost</th>
	<th>Safety Stock</th>
	<th>Remaining Stock</th>	
		</tr>
	<%
	for(int i=0; i < rows.size(); i++)
	{
		if(Float.valueOf((String)rows.get(i+10))<Float.valueOf((String)rows.get(i+9)))
		{
	%>
	<tr style="background-color: red">
	<%} else 	{%>
	<tr style="background-color: white">
	<%} %>
		<td><%=rows.get(i) %></td>
		<td><%=rows.get(i+2) %></td>
		<td><%=rows.get(i+3) %></td>
		<td><%=rows.get(i+4) %></td>
		<td><%=rows.get(i+5) %></td>
		<td><%=rows.get(i+6) %></td>		
		<td><%=rows.get(i+7) %></td>
		<td><%=rows.get(i+8) %></td>
		<td><%=rows.get(i+9) %></td>
		<td><%=rows.get(i+10) %></td>
		
	</tr>
	<%
	i	=	i	+	10;
	} 
	%>
	</table>
</td>

<td width="20%"></td>
</tr>
</table>
</form>
</div>
</body>

</html>