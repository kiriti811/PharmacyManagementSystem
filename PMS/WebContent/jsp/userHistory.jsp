<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javaActionForms.dropDown"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="../js/jquery-1.11.1.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"
	src="/TMS/script/datetimepicker.js"></script>
<script>
function myFunction(){
	window.open("/TMS/userHistory?method=emptyaction","_self");
}
function save(){
	document.getElementById("method").value="add";
	document.myform.submit();
}
</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/TMS/css/calender.css"
	type="text/css" media="all" />
<link REL="StyleSheet" TYPE="text/css"
	HREF="/TMS/css/styles.css">
<script src="/TMS/script/calender.js"
	type="text/javascript"></script>
	<%request.getAttribute("Data"); %>
<title>Search Tickets</title>
</head>
<center><body onload="init()">
	<div><jsp:include page='header.jsp'></jsp:include><html>
	</div>
	<div>
		<form action="/TMS/userHistory" name="myform"
			id="myform" method="post">
			<table style="width: 100%; height: 90%">
				<tr>
					<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
					<td><table>
							<tr>
								<h1>User History</h1>
							</tr>
							<input type=hidden name=method id=method value=emptyaction>
							<input name="id" id="id" type="hidden">
						
						</table>
						<table border="1">
									<tr>
									<th>TicketID</th>
									<th>Booking Date</th>
									<th>User Name</th>
										<th>Status</th>
										</tr>
											<%
		Vector 	vec		=	null;
		Vector	data	=	(Vector)request.getAttribute("Data");
		if(data==vec  ){
			
		}
		else{
		for(int	i	=	0	;	i	<	data.size();	i	++){
		%>
			<tr>
			<td><a href="/TMS/checkTicket.do?method=add&ticketCode=<%=data.get(i) %>" target="_blank"><%=data.get(i) %></a></td>
			<td><%=data.get(i+1) %></td>
			<td><%=data.get(i+2) %></td>
			<td><%=data.get(i+3) %></td>
			</tr>
		<%
		i	=	i	+	3;
		}
		}
		%>
						
						</table>
						</td>
				</tr>
		
			</table>
		</form>
	</div>

</body>

</html>