<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String	message	=	"Data Added Successfully";
%>
<head>
<head> <div style="padding-left: 10%;"><h1></h1></div>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
<title>TMS</title>
</head><center>
<div><jsp:include page='header.jsp'></jsp:include></div>
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
		 if(form.password.value != "" && form.password.value == form.confirmPassword.value) {
		    if(form.password.value.length < 6) {
		      alert("Error: Password must contain at least six characters!");
		      form.pwd1.focus();
		      return false;
		    }
		  
		    re = /[0-9]/;
		    if(!re.test(form.password.value)) {
		      alert("Error: password must contain at least one number (0-9)!");
		      form.password.focus();
		      return false;
		    }
		    re = /[a-z]/;
		    if(!re.test(form.password.value)) {
		      alert("Error: password must contain at least one lowercase letter (a-z)!");
		      form.password.focus();
		      return false;
		    }
		    re = /[A-Z]/;
		    if(!re.test(form.password.value)) {
		      alert("Error: password must contain at least one uppercase letter (A-Z)!");
		      form.password.focus();
		      return false;
		    }
		  } else {
		    alert("Error: Please check that you've entered and confirmed your password!");
		    form.password.focus();
		    return false;
		  }
		var mailformat 	= 	/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var	uemail		=	document.getElementById("emailId");
		
		if(!uemail.value.match(mailformat))
		{
			alert("You have entered an invalid email address!");
			uemail.focus();
			return false;
			
		}
		document.getElementById("method").value="add";
		document.myform.submit();
	}
	function Reset(){
		window.open("/TMS/userProfiles.do?method=emptyaction","_self")
	}
</script>
<script type="text/javascript">
function init() {
	calendar.set("dateOfBirth");
}
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/TMS/css/calender.css" type="text/css" media="all" />
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
<script src="/TMS/script/calender.js" type="text/javascript"></script>
<title>PMS</title>
</head>
<body onload="init()">
<div>
<form action="/PMS/userProfiles.do" name="myform" id="myform" method="post">
<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='indexLeft.jsp'></jsp:include></div></td>
<td>
<table>
                    <tr>
                        <td><h1>Registration</h1></td>
                    </tr>
                    
                    	<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>

                <input type=hidden name=method id=method value=emptyaction>
	<input name="id" id="id" type="hidden">
                    <input name="userName" id="userName" type="hidden">
                                        <tr>
                        <td>User Name</td>
                        <td>system generates an username</td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" maxlength="20" name="password" id="password" value="" /></td>
                    </tr>
                    
    
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" maxlength="20" name="confirmPassword" id="confirmPassword" value="" /></td>
                    </tr>
    
                    
                    
                    
                    <tr>
                        <td>Full Name</td>
                        <td><input maxlength="100" type="text" name="name" id="name" value="" /></td>
                    </tr>
                    
                                        <tr>
                        <td>Phone Number</td>
                        <td><input type="text" maxlength="10" name="phoneNumber" id="phoneNumber" value="" /></td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td>Email Id</td>
                        <td><input type="text" maxlength="40" name="emailId" id="emailId" value="" /></td>
                    </tr>
                    
                                        <tr>
                        <td>Address</td>
                        <td><input type="address" maxlength="1000" name="address" id="address" value="" /></td>
                    </tr>
         
         
                    
                    
                    <tr>
                      <tr><td><input type=button  class=button value=submit onclick="add()"></td>
<td><input type=button  class=button value=Reset onclick="Reset()"></td>
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