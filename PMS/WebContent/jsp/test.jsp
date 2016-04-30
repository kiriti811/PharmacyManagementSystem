<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jquery Autocomplete with Multiple select</title>
 
<script type="text/javascript"
src="{pageContext.request.contextPath}/assets/js/jquery-1.7.2.min.js">
</script>
<script type="text/javascript"
src="{pageContext.request.contextPath}/assets/jquery-ui/jquery-ui-1.8.11.custom.min.js">
</script>
<link type="text/css" rel="stylesheet" media="all"
href="${pageContext.request.contextPath}/assets/jquery-ui/jquery-ui-1.8.18.custom.css" >
 
<script type="text/javascript">
$(document).ready(function(){
	alert();
var month = [ "January","Febuary","March","April","May","June",
"July","August","September","October","November",
"December"
];
function split( val ){
return val.split( /,s*/ );
}
 
function extractLast( term ) {
return split( term ).pop();
}
 
$("input#autocomplete").autocomplete({
source:
function( request, response ) {
//delegate back to autocomplete, but extract the last term
response( $.ui.autocomplete.filter(
month,extractLast(request.term )));
},
select: function( event, ui ) {
var terms = split( this.value );
// remove the current input
terms.pop();
// add the selected item
terms.push( ui.item.value );
// add placeholder to get the comma-and-space
terms.push( "" );
this.value = terms.join( ", " );
return false;
}
});
});
 
</script>
 
<form action="TestFramwork">
<h3>Jquery Autocomplete with Multiple select</h3>
<div class="ui-widget"><label for="autocomplete">Search for Months: </label>
<input id="autocomplete" type="text" size="40" /></div>
</form>