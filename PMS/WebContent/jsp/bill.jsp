<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>bill</title>
</head><center>
<body style="text-align: center;">
<%
	Vector	data		=	(Vector) request.getAttribute("bill");
	float	totalCost	=	0f;
%>



<h1>Pharmacy Management System</h1>
<h2>-------------------------------------------------------------------------------------------</h2>
<table style="text-align: center;" width="50%">
<tr>
<td>Customer Name</td>
<td><%=data.get(7) %></td>
</tr>

<tr><td>Bill Number</td><td><%=request.getParameter("b") %></td></tr>
</table>
<h2>-------------------------------------------------------------------------------------------</h2>
<table width="50%" style="text-align: center;">
<tr><td><b>Medcicine Details</b></td></tr></table>
<h2>-------------------------------------------------------------------------------------------</h2>

<table width="50%" style="text-align: center;">
<tr><td>&nbsp;</td></tr>
<tr>
<td><b>Medicine Name</td>
<td><b>Manufacturer</td>
<td><b>Batch Number</td>
<td><b>Expiry Date</td>
<td><b>Unit Cost</td>
<td><b>Number Of units</td>
<td><b>total Cost Of unit</td>
</tr>
<%for(int i	=0	;	i<	data.size();i++){ %>

<tr>
<td><%=data.get(i)%></td>
<td><%=data.get(i+1)%></td>
<td><%=data.get(i+2)%></td>
<td><%=data.get(i+3)%></td>
<td><%=data.get(i+4)%></td>
<td><%=data.get(i+5)%></td>
<td><%=data.get(i+6)%></td>
</tr>
<%
		totalCost	=	totalCost	+	Float.valueOf((String)data.get(i+6));
		i	=	i	+	8	;} %>
</table>
<h2>-------------------------------------------------------------------------------------------</h2>
<table width="50%" style="text-align: center;">
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><b>Total Cost</td>
<td><b><%=totalCost %></b></td></tr>
</table>

</body></center>
</html>