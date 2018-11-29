<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="Vo.vo"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="mylib/bootstrap.min.css">
<link rel="stylesheet" href="mylib/datatables.min.css">
<script type="text/javascript"	src="mylib/jquery-2.1.4.js"></script>
<!-- <script type="text/javascript"   src="/mylib/popper.min.js"></script> -->
<script type="text/javascript"	src="mylib/bootstrap.min.js"></script>
<script type="text/javascript"   src="mylib/datatables.min.js"></script>

<script>
	jQuery(function ($){
		$('#tbSearch').DataTable({
			"bSort":false,
	    "bFilter":true,
	
		});		
	});
</script>
<body>

	<%!
	List<vo> dataList ;
	%>
	<% dataList=(List<vo>) request.getAttribute("details"); %>
	
		<table id="tbSearch" class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><b>ID</b></td>
				<th><b>FILE NAME</b></th>
				<th><b>FILE PATH</b></th>
				<th><b>FILE SIZE</b></th>
				<th><b>CREATE DATE</b></th>
				<th><b>UPDATE DATE</b></th>
				<th><b>ACTION</b></th>
			</tr></thead>
			
			<tbody>
					<%
				for (int i = 0; i < dataList.size(); i++)
				{	
					vo data = (vo) dataList.get(i);
			%>
			<tr>
				<td><%=data.getId()%></td>
				<td><%=data.getFilename()%></td>
				<td><%=data.getFilepath()%></td>
				<td><%=data.getFilesize()%></td>
				<td><%=data.getCreateddate()%></td>
				<td><%=data.getUpdateddate()%></td>
				<td><a href="Service?action=delete&id=<%=data.getId()%>" ><button class="button button3"  onclick ="return confirm('Are You Really Want to Delete This Record?')">
				                <i class="fa fa-trash"  style="font-size:20px;color:black;"></i></button></a>&nbsp;&nbsp;&nbsp;
				<a href="Service?action=edit&id=<%=data.getId()%>"><button class="button button1" ><i class="fa fa-edit"  style="font-size:20px;color:black;"></i></button></a> </td>
				
			</tr>
			<%
			}%>
			</tbody>
			
		</table>	
</body>


</html>