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
	function Reset(){
		window.open("/PMS/addMedicineType.do?method=emptyaction","_self")
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/PMS/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/PMS/addMedicineType.do" name="myform" id="myform" method="post">
<%	Object obj	=	null;
	addMedicineTypeBean object	=	new	addMedicineTypeBean();
	object	=	(addMedicineTypeBean)request.getAttribute("object");
	if(object==obj)
	{
		object	=	new	addMedicineTypeBean();
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
<td><h1>Add Medicine Type</h1></td>

</tr>
	<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>

	<input name="id" id="id" type="hidden" value="<%=object.getId()%>">
<tr>
<td>Medicine Type</td>
<td><input name="medicineType" id="medicineType" type="text" value="<%=object.getMedicineType()%>"></td>


</tr>
<tr><td><input type=button  class=button value=submit onclick="add()"></td>
<td><input type=button  class=button value=Reset onclick="Reset()"></td>
</tr>	

<tr><td>&nbsp;</td><td>	</td></tr>
</table>
	<iframe style="border: 1px; height: 1000px; weight: 1200px"
			 src="/PMS/addMedicineType.do?method=list"></iframe> 
</td></tr>
</table>
</form>
</div>
</body>

</html>