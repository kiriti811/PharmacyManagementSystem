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
		var	form	=	document.myform;
		var inputtxt	=	document.getElementById("phoneNumber");
		var phoneno = /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
		if(!inputtxt.value.match(phoneno))
		{
		        alert("Enter a valid phone number");
		        return false;
		}
		document.getElementById("method").value="edit";
		document.myform.submit();
	}
</script>
<script type="text/javascript">
function init() {
	calendar.set("dateOfBirth");
}
</script>

<head>
<div style="padding-left: 10%;"><h1></h1></div>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/TMS/css/calender.css" type="text/css" media="all" />
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
<script src="/TMS/script/calender.js" type="text/javascript"></script>
<title>TMS</title>
</head><center>	
<body onload="init()">
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/TMS/userProfiles.do" name="myform" id="myform" method="post">
<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td>
<table>
<%	
	Vector vec = (Vector) request.getAttribute("Values");
	System.out.println(vec);
 %>
                    <tr>
                        <td><h1>User Edit</h1></td>
                    </tr>
                <input type=hidden name=method id=method value=emptyaction>
	<input name="id" id="id" type="hidden" value="<%=request.getParameter("id")%>">
                                        <tr>
                        <td>User Name</td>
                        <td><input type=text name=userName id=userName readonly="readonly" value=<%=vec.get(1) %>></td>
                    </tr>
                        <input type="hidden" name="password" id="password" value="<%=vec.get(2) %>" />
                    
                     <input type="hidden" name="confirmPassword" id="confirmPassword" value="<%=vec.get(3) %>" />
                    
                    
                    
                    <tr>
                        <td>Full Name</td>
                        <td><input type="text"  maxlength="100" name="name" id="name" value="<%=vec.get(4) %>" /></td>
                    </tr>
                    
                                        <tr>
                        <td>Phone Number</td>
                        <td><input type="text" maxlength="10" name="phoneNumber" id="phoneNumber" value="<%=vec.get(5) %>"/></td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td>Email Id</td>
                        <td><input type="text" maxlength="40"  name="emailId" id="emailId" value="<%=vec.get(6) %>" /></td>
                    </tr>
                    
                                        <tr>
                        <td>Address</td>
                        <td><input type="text" maxlength="1000"  name="address" id="address" value="<%=vec.get(7) %>" /></td>
                    </tr>
         
         
                    
                    
                    <tr>
                      <tr><td><input type=button  class=button value=submit onclick="add()"></td>
                    </tr>
                    </tr>
                </tbody>
            </table>
</td></tr>
</table>
</form>
</div>
</body>

</html>