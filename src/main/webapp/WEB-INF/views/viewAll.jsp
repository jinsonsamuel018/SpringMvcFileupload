<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
  <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#width{
		width: 10%;
		height: 50px;
	}
</style>
</head>
<body>
	<table width="70%" style="border: 3px;background: rgb(243, 244, 248);">
		<tr>
			<th id="width">Id</th>			
			<th id="width">Title</th>
			<th id="width">Description</th>
			<th id="width">File</th>
			<th id="width">Action</th>
		</tr>
		<c:if test="${empty uploadList}">
			<tr>
				<td id="width1" height="100" colspan="5"><div align="center">---no result found--</div></td>				
			</tr>
			
		</c:if>
		
		<c:forEach items="${uploadList}" var="row" >
		<tr>
			<td id="width" align="center"><div align="center">${row.uploadId }</div></td>
			<td id="width"><div align="center">${row.title }</div></td>
			<td id="width" align="center">${row.description }</td>
			<td id="width" align="center">${row.image }</td>
			<td id="width"><div align="center"><a href="download.html?id=${row.uploadId }">download</a></div></td>
		</tr>
		</c:forEach>
	</table>
	
 
 
 
</body>
</html>