<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><style>
.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 12px;
}
th, td {
    padding: 10px;
}



</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<div>

 <body bgcolor="ffad33">
    <center>
        <h3 style= color:yello">File Upload Form</h3>
        
        <form method="post" action="dataService" enctype="multipart/form-data" >
               <input type="text" name="action" value="insert" hidden>
        
            <table BORDER="2" align="center" bgcolor="#E8FDFF"  weight="50%" >
                <tr>
                    <td  bgcolor="ffffcc"><b>File Name: </b></td>
                    <td bgcolor="ffffcc"><input type="text" name="fname" required/></td>
                </tr>
           
                <tr>
                    <td bgcolor="ffffcc"><b> Select File: </b></td> 	
                    <td  bgcolor="ffffcc"><input type="file" name="file" required/></td>
                </tr>
                <tr>
                    <td colspan="2"  bgcolor="ffffcc">
                       <input type= "submit" value="Upload File"/>
                         
                    </td>
                </tr>
            </table>
            <div style="color: #FF0000;"><h3>${Msg}<h3></div>
           
            </form>
 <center><a href="Service?action=view"><button class="button">Show Record</button></a></center>
</body> 
</html>