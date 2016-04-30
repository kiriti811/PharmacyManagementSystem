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
	window.open("/PMS/yearlyReports.do?method=emptyaction","_self");
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
	
<title>Search Tickets</title>
</head>
<center><body onload="init()">
	<div><jsp:include page='header.jsp'></jsp:include><html>
	</div>
	<div>
		<form action="/PMS/yearlyReports.do" name="myform"
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
<td>Select a Year</td>
		<td>	
		<select name="bookedDate" id="bookedDate">
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		<option value="2020">2020</option>
		<option value="2021">2021</option>
		<option value="2022">2022</option>
		<option value="2023">2023</option>
		</select>
</td>

							</tr>
						
							<tr>
				<td><input type=button onclick="save()" class="button"  value=Search></td>
				<td><input type=button onclick="myFunction()" class="button"  value=Reset></td>
							</tr>
						
						</table>
						<table border="1">
									<tr>
									<th>BillID</th>
									<th>Cost</th></tr>
									
<% 

Map test=null;
Map	Data=	(Map)request.getAttribute("yearlyReport");
if(request.getAttribute("yearlyReport")==test)
{
}
else{
	Map<String, Float> map = Data;
	System.out.println("map"+map);
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
<%
} %>	    						</table>

						</td>
				</tr>
	
			</table>
		</form>
	</div>

</body>

</html>