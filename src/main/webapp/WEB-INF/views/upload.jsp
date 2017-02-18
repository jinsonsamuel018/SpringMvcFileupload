<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.error {
	color: #ff0000;
}
	
</style>

</head>
<body>
	<div align="center"><h2>Upload Image</h2></div><br><br>
	
	<div style="margin-left: 450px;">
	<form action="uploadValidation.html" method="post"  enctype="multipart/form-data">
		<table>
		<tr>
			<td><h5 class="error"><c:out value="${errorFailed }"></c:out></h5></td>
		</tr>
			<tr>
				<td><label>Title :</label></td>
				<td><input type="text" name="title" maxlength="20"></td>
				<td><c:out value="${errorTitle }"></c:out></td>
			</tr>
			<tr>
				<td><label>Description :</label></td>
				<td><textarea  rows="5" cols="20" name="description" ></textarea> </td>
				<td><c:out value="${errorDescription }"></c:out></td>
			</tr>
			<tr>
				<td><label>fileUpload :</label></td>
				<td><input type="file" name="image"></td>
				<td><c:out value="${errorUpload }"></c:out></td>
			</tr>
			<tr>
				<td><a href="view.html">ViewAll</a></td>
				<td><input type="submit" value="submit"></td>				
			</tr>
			
		</table>
	</form>
	</div>

	
<%
/* String context = request.getServletContext().getRealPath("");
String path = context+"/"+"download";

String jj = request.getContextPath()+"/src/main/webapp/download";

System.out.println(jj); */

%>


	<img alt="df" src="<c:url value = '/download/screenshot.png'></c:url>"  width="100" height="100"  />
	
	
</body>
</html>