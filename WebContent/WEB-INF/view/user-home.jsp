<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html lang="en">
<head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="ISO-8859-1">
<title>User Home Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
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

        /* home side section */
        .home_side_section {
            flex: 0.2;
            background-color: #fff;
            border-radius: 10px;

            box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            -webkit-box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);

            display: flex;
            flex-direction: column;
            padding: 2px;
        }

        .sidebar_element {
            align-content: stretch;
            background-color: #78be21;
            margin: 2px 2px;
            border-radius: 5px;
            padding: 5px 5px;
            text-align: center;
            text-decoration: none;
            color: #ffffff;
        }

        /* home main section */
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

        /* css Code for User DashBoard */
        .user_container {
            background-color: #ffffff;
            display: flex;
            flex-direction: column;
            width: 800px;
            min-height: 300px;
            margin: auto;
            padding: 10px;
            box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.75);
            -webkit-box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.75);
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        /* user  title box */
        .user_box_title {
            flex: 0.2;
            padding: 5px;
            color: #003865;
            font-size: 10px;
        }

        /* user  detail box */
        .user_detail {
            flex: 0.6;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            border: 2px solid #707070;
            border-radius: 8px;
            padding: 5px;
            margin-top: 5px;
        }

        .user_detail_title {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 2px 10px;
            color: #003865;
            font-size: 15px;
        }

        .user_detail_title>i {
            color: #003865;
            font-size: 20px;
        }

        .user_detail>table {
            align-self: stretch;
        }

        .thead {
            padding: 5px;
            color: #707070;
            border-bottom: 2px dotted #707070;
            font-size: 12px;
        }

        td {
            padding: 10px;
            text-align: center;
            font-size: 12px;
        }

        td>a {
            color: #003865;
            text-decoration: none;
            border: 1px solid #707070;
            padding: 3px 10px;
            border-radius: 20px;
        }

        td>a>i {
            margin-right: 10px;
        }

        /* add member box */
        .add_member_user {
            flex: 0.2;
        }

        .add_member_user {
            display: flex;
            flex-direction: column;
            padding: 5px 5px;
        }

        .add_member_user {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .add_member_btn {
            text-decoration: none;
            color: #003865;
            border: 2px solid #003865;
            padding: 5px;
            border-radius: 5px;
        }

        /* css Code for User DashBoard */
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
       		 <!-- navbar -->
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
            <!-- home section  -->
        <section class="home">
 <a href="http://localhost:8181/Testing/Home/index"><i class="fa fa-sign-out" aria-hidden="true">Log out</i></a>
            <div class="user_container">
                <div class="user_box_title">
                    <h1>Account Details</h1>  
               
                    <C:forEach var="user" items="${users}">
              		 </div>
							<C:url var="updateLink" value="/Home/updateuser">
							<C:param name="userId" value="${user.userId}" />
							<C:param name="mobileNo" value="${user.mobileNo }" />
							</C:url>
							<C:url var="ScheduleLink" value="/Home/scheduleuser">
							<C:param name="userId" value="${user.userId}" /> 
							<C:param name="mobileNo" value="${user.mobileNo }" />
							</C:url>  
							<C:url var="AddLink" value="/Home/adduser">
                            <C:param name="mobileNo" value="${user.mobileNo }" />
							</C:url>
						  	<C:url var="DeleteLink" value="/Home/deleteuser/${user.userId}">
						  	<C:param name="mobileNo" value="${user.mobileNo }" />
							<!--  Inside this we are going to embed customer Id -->
							<!--  For this we are iterating through all the customers -->
							<!--  <C:param name="userId" value="${user.userId}" /> -->
							</C:url>  
                    <table>
                         <tr>  
                    <div class="user_detail">
                     <div class="user_detail_title">
                       
                       <h3>${user.firstName} ${user.lastName} <span>| RF Id :${user.userId}  </span>
                           <span>| Registered Mobile  : ${user.mobileNo}</span></th>
                        </h3> 

                        <a href="${DeleteLink}" class="fa fa-trash-o"></a>
                        
                      
                        </div>
                        
                      
                            <th class="thead">Age: <span>${user.age}</span></th>
                            <th class="thead">Photo Id : <span>${user.govtId} </span></th>
                            <th class="thead">Id Number : <span>${user.idNo}</span></th>
                            <th class="thead">Gender : <span>${user.gender}</span></th>
                            <th class="thead">vaccinated Status: <span>${user.totalVaccine}</span></th>
                        </tr>
                        <tr>
                            <td>Schedule Vaccination</td>
                            <td> </td>
                            <td>
                                <a href="${ScheduleLink}"><i class="fa fa-calendar" aria-hidden="true"></i>Schedule</a>
                            </td>

                        </tr>
                        <tr>
                            <td>Update Details</td>
                            <td> </td>
                            <td>
                                <a href="${updateLink}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Update</a>
                            </td>
                        </tr>
                        </C:forEach>
                        </table>
                       
                   
                    
               
               
               
                <!--  -->
                
                <div class="add_member_user">
                     
                  <a href="${AddLink}" class="add_member_btn"><i class="fa fa-plus" aria-hidden="true"></i>Add Members</a>

                </div>
                 
             </div>
            </div>
    
        </section>
        </div>

        <!-- footer -->

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

</body>
</html>