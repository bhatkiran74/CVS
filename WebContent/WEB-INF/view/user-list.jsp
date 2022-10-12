<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Customer List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }

        .container {
            width: 100vw;
            height: 100vh;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
            grid-template-rows: 1fr 8fr 1fr;
            grid-template-areas:
                "nav nav nav nav"
                "home home home home"
                "footer footer footer footer";
        }

        /* Navbar css */
        .navbar {
            background-color: #003865;
            grid-area: nav;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            height: 100px;
           
        }

        .navbar_left {
            flex: 1;
        }

        .navbar_left>img {
            width: 150px;
            margin-left: 10px;
            margin-top: 5px;
        }

        .navbar_footer>img {
            width: 80px;
            margin-left: 510px;
            margin-top: 10px;
            
        }

        .copy_footer {
            width: 750px;
            margin-left: 400px;
            margin-top: 7px;
            margin-bottom: 10px;
            
        }

        .navbar_center {
            align-self: center;
            flex: 1;
        }

        .navbar_center>a {
            padding: 10px 15px;
            text-decoration: none;
            color: #ffffff;
            margin: 5px 10px;
            background-color: #78be21;
        }

        .navbar_right {
            flex: 1;
            align-content: center;
        }

        .search {
            background-color: #fff;
            display: flex;
            width: 210px;
            padding: 3px 5px;
            position: absolute;
            right: 100px;
            top: 20px;
        }

        .search:hover {
            box-shadow: 0px -1px 1px 3px rgba(120, 190, 33, 0.66);
            -webkit-box-shadow: 0px -1px 1px 3px rgba(120, 190, 33, 0.66);
            -moz-box-shadow: 0px -1px 1px 3px rgba(120, 190, 33, 0.66);
        }

        .search>input {
            border: none;
            outline-width: 0;
        }

        .search>a>i {
            color: #78be21;
            font-size: 25px;
        }

        /* home css */
        .home {
            background-color: #eeeeee;
            grid-area: home;
            display: flex;
            padding: 10px;
        }

        .home_side_section {
            flex: 0.2;
            background-color: #fff;
            border-radius: 10px;

            box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            -webkit-box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
        }

        .home_main_section {
            flex: 0.8;
            background-color: #fff;
            margin: 0px 10px;
            border-radius: 10px;
            box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            -webkit-box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);

            padding: 10px 5px;
            display: flex;
            flex-direction: column;
        }

        .add_btn_section {
            flex: 0.1;
            padding: 15px;
        }

        .btn {
            padding: 10px 20px;
            background-color: #78be21;
            border-radius: 10px;
            text-decoration: none;
            color: #ffffff;
        }

        .update_btn {
            padding: 5px 15px;
            background-color: #438fbb;
            border-radius: 10px;
            text-decoration: none;
            color: #ffffff;
        }

        .delete_btn {
            padding: 5px 15px;
            background-color: #dc4d3c;
            border-radius: 10px;
            text-decoration: none;
            color: #ffffff;
        }

        .customers {
            flex: 0.9;
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        .customers td,
        .customers th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .customers tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .customers tr:hover {
            background-color: #ddd;
        }

        .customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #78be21;
            color: white;
        }

        /* footer css */
        .footer {
            background-color: #003865;
            grid-area: footer;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            color: #ffffff;
          
        }

        /* code for responsive lay out*/
        @media screen and (max-width: 900px) {
            .navbar_right {
                display: none;
            }
        }

        @media screen and (max-width: 768px) {
            .navbar_right {
                display: none;
            }

            .navbar_center {
                display: none;
            }
        }
    </style>
   
</head>
<body>
     
       <div class="container">
        <nav class="navbar">

            <div class="navbar_left">
                <img src="C:\Users\Akshata\OneDrive\Desktop\covid/covidLogo.jpeg" width="70" height="70">
            </div>
            <div class="navbar_center">
                <a href="#">Home </a>
                <a href="#">About </a>
                <a href="#">Contact </a>

            </div>
            <div class="navbar_right">

                <div class="search">
                    <input type="text" name="" placeholder="search">

                    <a href="#"> <i class="fa fa-search"></i></a>
                </div>

            </div>
        </nav>
          <section class="home">

           <!--   <div class="home_side_section">
                hello world
            </div>-->
            <div class="home_main_section">

              <h2 style="text:bold">User List</h2>
              
                <span><a href="http://localhost:8181/Testing/Home/index" style=" text-align: right;float: right"><i class="fa fa-sign-out" aria-hidden="true">Log out</i></a>
                </span>
                
				<table  class="customers">
						<tr>
						    <th>User Id</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>MobileNo</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Govt Id</th>
							<th>Id No</th>
							<th>Vaccine Name</th>
							<th>First Vaccine Date</th>
							<th>Second Vaccine Date</th>
							<th>Total Vaccine</th>
							<th>Vaccine Place</th>
							<th>Action</th>
						</tr>
						
						<!-- Iterate through the List of Customers for displaying -->
						
						<!-- While adding new link as <td> --- We will have embedded customer ID -->
						
						<C:forEach var="user" items="${users}">
						
							<!-- Create an Update Link with Customer Id --- By using some JSTL custom tag c:url -->
							<!-- creating a URL and will this URL to some Variable -->
							
							<C:url var="updateLink" value="/Admin/updateuser">
							 <C:param name="userId" value="${user.userId}" /> 
							</C:url>
						  	<C:url var="DeleteLink" value="/Admin/deleteuser/${user.userId}">
								<!--  Inside this we are going to embed customer Id -->
								<!--  For this we are iterating through all the customers -->
							<!--  	<C:param name="userId" value="${user.userId}" /> -->
							</C:url>  
							
							<tr>
									<td>${user.userId} </td>
									<td>${user.firstName} </td>
									 <td>${user.lastName} </td>
									 <td>${user.email} </td>
									 <td>${user.mobileNo} </td>
									 <td>${user.age} </td>
									 <td>${user.gender} </td>
									 <td>${user.govtId} </td>
									 <td>${user.idNo} </td>
									 <td>${user.vaccineName} </td>
									 <td>${user.firstVaccineDate} </td>
									 <td>${user.secondVaccineDate} </td>
									 <td>${user.totalVaccine} </td>
									 <td>${user.vaccinePlace} </td>
									<td>
										<!-- Displaying the Update Link -->
										<input type="button" value="Update" 
					   onclick="window.location.href='${updateLink}'"
							class="update_btn"/> ||
									
											<input type="button" value="Delete" 
					   onclick="window.location.href='${DeleteLink}'" class="delete_btn"/>
									
									</td>
							</tr>
						</C:forEach>
                </table>
               
            </div>
             </section>
             
         <footer class="footer">
            <div>
                <div class="navbar_footer">
                 <img src="C:\Users\Akshata\OneDrive\Desktop\covid/covidLogo.jpeg" >
                </div>
                <div class="copy_footer">
                    Copyright � 2021 Covid19. All Rights Reserved
                </div>
            </div>
        </footer>
 
    </div>
		
</body>
</html>