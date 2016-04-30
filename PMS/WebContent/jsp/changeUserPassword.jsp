<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script>
function checkForm()
{
	var	form	=	document.myform;
  if(form.userName.value == "") {
    alert("Error: userName cannot be blank!");
    form.userName.focus();
    return false;
  }
  re = /^\w+$/;
  if(!re.test(form.userName.value)) {
    alert("Error: Username must contain only letters, numbers and underscores!");
    form.userName.focus();
    return false;
  }

  if(form.password.value != "" && form.password.value == form.rePassword.value) {
    if(form.password.value.length < 6) {
      alert("Error: Password must contain at least six characters!");
      form.pwd1.focus();
      return false;
    }
    if(form.password.value == form.userName.value) {
      alert("Error: Password must be different from Username!");
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
	document.forms[0].submit();
}


function checkPassword(){
	var pass1=document.getElementById("password").value;
	var pass2=document.getElementById("rePassword").value;
	if(pass1==pass2){
		document.forms[0].submit();
	}
	else{
		document.getElementById("password").value	=	"";
		document.getElementById("rePassword").value	=	"";
		alert("passwords entered do not match");
		return false;
	}
}
function checkReset(){
	alert("Reset");
	window.open("/TMS/jsp/changeUserPassword.jsp","_self")
}
<%
String	message	=	"Password Reset Successful"; %>
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
<title>TMS</title>
</head>
<center><body>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action=/TMS/changePassword.do name=myform method=post>
<table style="width: 100%;height: 90%"><tr>
<td valign="top" width="30%">
<div><jsp:include page='left.jsp'></jsp:include>
</div>
</td>

<td>
<h1>Change Password</h1>
<table>
<tr>

<%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%>
</tr>
<tr><td>Login Id</td><td><%= session.getAttribute("userName")%></td></tr><input type="hidden" id="userName" name="userName" value="<%= session.getAttribute("userName")%>">
<tr><td>New Password:</td><td><input type="password" name="password" id="password"  value=""></td></tr>
<tr><td>Re Enter Password:</td><td><input type="password" name="rePassword" id="rePassword" value=""></td></tr>
</textarea></td></tr>
<input type="hidden" name="method" value="edit">
<tr><td><input class="button"  type="button" value="submit" onclick="checkForm()"></td>
<td><input class="button"  type="button" value="Reset" onclick="checkReset()"></td>
<td></td>
</tr>
</table>
</td>
<td style="vertical-align: top"> 
</div></td>
</tr></table>

</form>

</body>
</html>