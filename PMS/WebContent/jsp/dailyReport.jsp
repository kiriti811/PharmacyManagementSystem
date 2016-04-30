<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javaActionForms.dropDown"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="../js/jquery-1.11.1.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"
	src="/PMS/script/datetimepicker.js"></script>
<script>
function myFunction(){
	window.open("/PMS/dailyReports.do?method=emptyaction","_self");
}
function save(){
	document.getElementById("method").value="add";
	document.myform.submit();
}
</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/PMS/css/calender.css"
	type="text/css" media="all" />
<link REL="StyleSheet" TYPE="text/css"
	HREF="/PMS/css/styles.css">
<script src="/PMS/script/calender.js"
	type="text/javascript"></script>
	
<title>Search Bills</title>
</head>
<center><body onload="init()">
	<div><jsp:include page='header.jsp'></jsp:include><html>
	</div>
	<div>
		<form action="/PMS/dailyReports.do" name="myform"
			id="myform" method="post">
			<table style="width: 100%; height: 90%">
				<tr>
					<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
					<td><table>
							<tr>
								<h1>Search Bills</h1>
							</tr>
							<input type=hidden name=method id=method value=emptyaction>
							<input name="id" id="id" type="hidden">
							<tr>
<td>Select a Day</td>
		<td>		<input type=text value="" name="bookedDate" id="bookedDate"  >
	  		<a href="javascript:NewCal('bookedDate','mmddyyyy',false,24)">
	  		<img src="/PMS/images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>

</td>

							</tr>
						
							<tr>
				<td><input type=button onclick="save()" class="button"  value=Search></td>
				<td><input type=button onclick="myFunction()" class="button"  value=Reset></td>
							</tr>
						
						</table>
						<table border="1">
									<tr>
									<th>BILL ID</th>
									<th>Cost</th></tr>
<% 

Map test=null;
Map	Data=	(Map)request.getAttribute("dailyReport");
if(request.getAttribute("dailyReport")==test)
{
}
else{
	Map<String, Float> map = Data;
	float	totalCost	=	0f;	
	Iterator<Map.Entry<String, Float>> entries = map.entrySet().iterator();
	while (entries.hasNext()) {
	    Map.Entry<String, Float> entry = entries.next();
	    %>
	    <tr><td><b><a href="/PMS/sellMedicines.do?method=bill&b=<%=entry.getKey() %>" target="_blank"><%=entry.getKey() %></a></td>
	    <%  
	    Float list =	entry.getValue(); 
	    
	    totalCost	=	totalCost	+	Float.valueOf(list);
	    					
	    %>
	    					<td>$<%=list %></td>
	    					<%
	}
	    %>
	    </tr>
	    <tr><td>Total Returns</td><td><%=totalCost %></td></tr>
	    						</table>
<%} %>
						</td>
				</tr>
	
			</table>
		</form>
	</div>

</body>

</html>