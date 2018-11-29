<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"></script>
<script src="https://code.angularjs.org/1.6.9/angular.js"></script>
<link rel="stylesheet" href="mylib/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>


<style>
.container{
  margin: 20px 0;
}

</style>
</head>
<script type="text/javascript">
$(document).ready(function(){
    $('[id^=edit]').keypress(validateNumber);
});

function validateNumber(event) {
    var key = window.event ? event.keyCode : event.which;
    if (event.keyCode === 8 || event.keyCode === 46) {
        return true;
    } else if ( key < 48 || key > 57 ) {
        return false;
    } else {
    	return true;
    }
};
    
</script>
<script>
// JS code 
myApp = angular.module('myApp',[]);

<% 
Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection ("jdbc:mysql://localhost/angular", "root", "root");
 Statement stmt = conn.createStatement();
 String sql="SELECT * FROM register";
 ResultSet rs = stmt.executeQuery(sql);
 try
 {
  if(rs!=null)
  {
%> 
// JS code 
myApp.controller('empCtl',function($scope) 
   {
    $scope.empData = [
<%
    rs.next();
    while(true)
    {
%> 
     {"fname":"<%=rs.getString("firstname")%>","lname":"<%=rs.getString("lname")%>","phone":"<%=rs.getString("phone")%>"}
   
     <%if(rs.next()) {%> , <% } else break;
    }
   } 
  }
 catch(SQLException e) 
 {
  e.printStackTrace();
 }
 stmt.close();
 rs.close();
 conn.close();
 stmt=null;
 rs=null;
 conn=null;
%>
         ];
 $scope.sortField='fname';
 $scope.reverse=true;
}); 
</script>

  
     <!--  <script>
       var app = angular.module("myapp", []);
      app.controller("ListController", ['$scope', function($scope) {
          
          $scope.personalDetails = [];
          
           $scope.addNew = function(personalDetails){
             $scope.personalDetails.push({ 
                      'fname': personalDetails.fname, 
                      'lname': personalDetails.lname,
                       'phone': personalDetails.phone, 
                  });
                 
              };
          
            }]);
      
      </script>  -->
    <body ng-app="myapp" ng-controller="empCtl">   
    <div class="container">
       
                        <form ng-submit="addNew(personalDetails)" target="blank" action="register" method="post">
                  
                            <div class="form-group">
                                <input type="text" style="width:500px;" name="firstname" class="form-control" placeholder="First name" ng-model="personalDetails.fname" required>   
                            </div>
                            <div class="form-group">
                                <input type="text" style="width:500px;" name="lastname" class="form-control" placeholder="Last name" ng-model="personalDetails.lname" required>   
                            </div>
                            <div class="form-group">
                                <input type="text"  id="edit1" style="width:500px;" name="phone" class="form-control"  placeholder="Phone no. (7565939005)" ng-model="personalDetails.phone" maxlength="10" required / >  
                            </div>
                            <div class="clearfix">
                                <input type="submit" value="Submit" class="btn btn-primary"> 
                                <input type="reset" value="reset" class="btn btn-primary" style=" background-color: #008000; position: relative;">    
                                                    
                            </div>
                                             
                        </form>
        
        </div>
        Search: <input ng-model="query" type="text" />
<table border=1 cellpadding=5>
 <tr>
  <th><a href="" ng-click="sortField = 'fname'; reverse=!reverse">First Name</a></th>
  <th><a href="" ng-click="sortField = 'lname' reverse=!reverse">Last Name</a></th>
  <th>Month Year</th></tr> 
  <tr ng-repeat="emp in empData | filter:query | orderBy:sortField:reverse">
  
  <td>{{emp.fname}}</td>
  <td>{{emp.lname}}</td>
  <td>{{emp.phone}}</td>
 </tr>
</table>
		
      <!--   <div class="row" ng-hide="!personalDetails.length">
            <div class="col-md-12">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Contact</th>
                        </tr>
                    </thead>
                    <tbody>
						<tr ng-repeat="personalDetail in personalDetails">

							<td>{{personalDetail.fname}}</td>
							<td>{{personalDetail.lname}}</td>
							<td>{{personalDetail.phone}}</td>
						</tr>
					</tbody>
                </table>
          
            </div>
        </div>
    </div> -->
</body>

</html>


<%-- <!DOCTYPE html>
<html ng-app="myApp">
<head>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<script>
// JS code 
myApp = angular.module('myApp',[]);
<%@ page import = "java.sql.*" %> 
<% 
Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection ("jdbc:mysql://localhost/filedb", "root", "root");
 Statement stmt = conn.createStatement();
 String sql="SELECT * FROM fileinfo";
 ResultSet rs = stmt.executeQuery(sql);
 try
 {
  if(rs!=null)
  {
%> 
// JS code 
myApp.controller('empCtl',function($scope) 
   {
    $scope.empData = [
<%
    rs.next();
    while(true)
    {
%> 
     {"emp_code":"<%=rs.getString("filename")%>","emp_name":"<%=rs.getString("emp_name")%>","pay_month_year":"<%=rs.getString("pay_month_year")%>","gross_pay":"<%=rs.getString("gross_pay")%>","tot_pay":"<%=rs.getString("tot_pay")%>"}
   
     <%if(rs.next()) {%> , <% } else break;
    }
   } 
  }
 catch(SQLException e) 
 {
  e.printStackTrace();
 }
 stmt.close();
 rs.close();
 conn.close();
 stmt=null;
 rs=null;
 conn=null;
%>
         ];
 $scope.sortField='emp_name';
 $scope.reverse=true;
}); 
</script>
</head>
<body ng-controller="empCtl">
 Search: <input ng-model="query" type="text" />
<table border=1 cellpadding=5>
 <tr>
  <th><a href="" ng-click="sortField = 'emp_code'; reverse=!reverse">Emp Code</a></th>
  <th><a href="" ng-click="sortField = 'emp_name' reverse=!reverse">Emp Name</a></th>
  <th>Month Year</th><th>Gross Pay</th><th>Tot Pay</th></tr> 
  <tr ng-repeat="emp in empData | filter:query | orderBy:sortField:reverse">
  
  <td>{{emp.emp_code}}</td>
  <td>{{emp.emp_name}}</td>
  <td>{{emp.pay_month_year}}</td>
  <td>{{emp.gross_pay}}</td>
  <td>{{emp.tot_pay}}</td> 
 </tr>
</table>
</body>
</html> --%>