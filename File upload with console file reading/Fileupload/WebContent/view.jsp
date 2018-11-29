<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="Vo.vo"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
h3 {
    text-shadow: 0 0 3px #FF0000;
}
.button {
   
    padding: 8px 18px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 2px 1px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 12px;
}
.button1 {
    background-color: white; 
    color: black; 
    border: 2px solid #80d4ff;
}

.button1:hover {
    background-color: #80d4ff;
    color: white;
}
.button3 {
    background-color: white; 
    color: black; 
    border: 2px solid #f44336;
}

.button3:hover {
    background-color: #f44336;
    color: white;
}

#a {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#a td, #a th {
    border: 1px solid #ddd;
    padding: 6px;
}

#a tr:nth-child(even){background-color: #f2f2f2;}

#a tr:hover {background-color: #ddd;}

#a th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
</head><center><h3><b>File Record</b><h3></center>
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
		$('#a').DataTable({
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
	
		<table id="a" class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><b>ID</b></td>
				<th><b>FILE NAME</b></th>
				<th><b>FILE PATH</b></th>
				<th><b>FILE SIZE</b></th>
				<th><b>CREATE DATE</b></th>
				<th><b>UPDATE DATE</b></th>
				<th><b>&emsp;&emsp;ACTION</b></th>
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
				                <i class="fa fa-trash"  style="font-size:20px;color:black;"></i></button></a>&nbsp;
				<a href="Service?action=edit&id=<%=data.getId()%>"><button class="button button1" ><i class="fa fa-edit"  style="font-size:20px;color:black;"></i></button></a> </td>
				
			</tr>
			<%
			}%>
			</tbody>
			
		</table>	
</body>
</html>