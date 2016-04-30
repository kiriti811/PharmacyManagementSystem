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
	
	function reset(){
		window.open("/PMS/sellMedicines.do?method=reset", "_self" );
	}
	function add(){
	
		if(document.getElementById("uploadFile").value=="")
		{
			alert("Please Upload The Prescription");
			return false;
		}
		else{
			document.myform.submit();
		}
	}
</script>
<head>
<link rel="stylesheet" href="/PMS/css/calender.css" type="text/css" media="all" />
<script language="javascript" type="text/javascript" src="/PMS/script/datetimepicker.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/PMS/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<%
	Vector	childData	=	(Vector)session.getAttribute("childData"); 
%>
<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
 <td> <form method="post" name="myform" action="/PMS/uploadFile" enctype="multipart/form-data">
 </td>
 <tr>
<table border="1">
<tr>
<td>Medicine Name</td>
<td>Company Name</td>
<td>Batch Number</td>
<td>Expiry Date</td>
<td>Unit Cost</td>
<td>Units Purchased</td>
<td>Total Cost</td>


</tr>

<%
float	totalCost	=	0f;
for(int i=0;i<childData.size();i++){ %>
<tr>
<td><%=childData.get(i+2) %></td>
<td><%=childData.get(i+3) %></td>
<td><%=childData.get(i+4) %></td>
<td><%=childData.get(i+5) %></td>
<td><%=childData.get(i+6) %></td>
<td><%=childData.get(i+7) %></td>
<td><%=childData.get(i+9) %></td>
</tr>
<%
totalCost	=	totalCost	+	Float.valueOf((String)childData.get(i+9)) ;
i	=	i	+	13;
} %>
<tr>
<td></td><td></td><td></td><td></td>
<td></td>
<td>Total Bill Amount</td><td><%=totalCost %></td>
</tr>
 </table>
 <table>
 <tr><td>Select file to upload:</td></tr>
 
 <tr><td><input type="file" name="uploadFile" id="uploadFile"/></td></tr>    
            <tr>
<td>  <input type="button" value="Upload" class="button" onclick="add()"/></td>
<td>         <a href="" class="button" onclick="reset()">Cancel</a> </td>
       </tr>
</table>
</table>

        </form>

<tr><td>&nbsp;</td><td>	</td></tr>
</table>

</td></tr>
</table>
</form>
</div>
</body>

</html>