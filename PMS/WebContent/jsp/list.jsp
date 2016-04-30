<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Vector columns = (Vector) request.getAttribute("columns");
	int columnCount = Integer.valueOf(request.getAttribute(
			"columnCount").toString());
	Vector rows = (Vector) request.getAttribute("rows");
	String className = (String) request.getAttribute("className");
	String originalFormName = (String) request.getAttribute("formName");
	Vector referredColumns = new Vector();
	Vector vec = ReadConfig.dropDownColumns(originalFormName);
	for (int i = 0; i < vec.size(); i++) {
		String column = (String) vec.get(i);
		int count = 0;
		for (int j = 0; j < columns.size(); j++) {
			if ((columns.get(j)).equals(column.toUpperCase())) {
				referredColumns.add(j);
			}
		}
	}
%>
<html>
<link REL="StyleSheet" TYPE="text/css" HREF="/PMS/css/styles.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body id="test1">
	<table border=1>
		<tr>
			<th>EDIT</th>
		 <%
				for (int i = 0; i < columnCount; i++) {
			%>
			<th><%=columns.get(i)%></th>
			<%
				}
			%>
		</tr>
		
		
		<%
		System.out.println(rows);
		if(rows==null){
			
			
		}
		
		else{
			int count = 0;
			for (int i = 0; i < rows.size() / columnCount; i++) {
		%>
		<tr>

			<%
				for (int j = 0; j < columnCount; j++) {
						if (j == 0) {
			%>
		<td><a target="_parent" href=/PMS/<%=className%>.do?method=listId&id=<%=rows.get(count)%>&cc=<%=columnCount%>><img src="" alt="E"></a></td>
	<td><%=rows.get(count)%></td>
			<%
				count = count + 1;
						} else {
							if(referredColumns.size()!=0)
							{
							for(int k	=	0	;	k	<	referredColumns.size();	k	++)
							{
								String	str	=	(String)rows.get(count);
								if(Integer.valueOf(referredColumns.get(k).toString())==j){
									System.out.println("str"+str);
									System.out.println("org"+originalFormName);
									
									%>
									<td><%=dropDown.dropDownReference(str,originalFormName)%></td>
								<%
								}
								else{
									%>
									<td><%=rows.get(count)%></td>
									<%
								}
							}
							}
							else{
								%>
								<td><%=rows.get(count)%></td>
								<%
							}
				count = count + 1;
						}
					}
			%>

		</tr>
		<%
			}
		}
		%>
	</table>
</body>
</html>