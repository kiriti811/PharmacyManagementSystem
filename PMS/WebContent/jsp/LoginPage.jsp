<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/PMS/css/styles.css">
<title>Login</title>
</head><center>
<div><jsp:include page='header.jsp'></jsp:include></div>
<div>
 <%
String	message	=	"Please Provide The Correct UserName And Password";

 %>
</div>
<center><div>
<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='indexLeft.jsp'></jsp:include></div></td>
<td>
	<form action="/PMS/login.do" method="post">
		<h1>Login Page</h1>
		<table>
		<input type=hidden name=method id=method value="authenticate">
		<input type=hidden name=userType id=userType value="<%=request.getParameter("userType")%>">
		<tr>
		<%
		
		if(message.equals((String)request.getAttribute("message")))
		{
			out.println(request.getAttribute("message"));
		 }
		
		%>
		
		</tr>
			<tr>
				<td><b>User Name</td>
				<td><input type=username name=username id=username></td>
			</tr>
			<tr>
				<td><b>Password</td>
				<td><input type=password  name=password id=password></td>
			</tr>
			<tr>
				<td><input type=button class="button"  value=Login onclick="save()"></td>
				<td><input type=button onclick="myFunction()" class="button"  value=Reset></td>
			</tr>
		</table>
</form>
</td></tr></table></div></center>
</body>

<script>
function myFunction() {
    document.forms[0].reset();
}
function save() {
	 if(document.getElementById("username").value == "" || document.getElementById("password").value == "")
	{
	   alert("Please Fill either the username or the password");
	}
	 else{
		 document.forms[0].submit();
	 }
}
</script>
</html>