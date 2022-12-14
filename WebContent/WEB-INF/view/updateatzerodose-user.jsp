<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <!-- <link rel="stylesheet" href="style.css"> -->
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

        .navbar {
            background-color: #003865;
            grid-area: nav;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

        .home {
            background-color: #eeeeee;
            grid-area: home;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .footer {
            background-color: #003865;
            grid-area: footer;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            color: #ffffff;
            
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

        /* code for login */
        .register_form_container {

            width: 400px;
            background-color: #eeeeee;
            padding: 10px 10px;

            box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            -webkit-box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            -moz-box-shadow: 0px 5px 9px 0px rgba(0, 0, 0, 0.75);
            margin: 20px 20px;
        }

        .form_group {
            margin: 2px 2px;
            display: flex;
            flex-direction: column;
            padding: 5px 5px;
        }

        .form_group>h3 {
            text-align: center;
            font-size: 25px;
            color: #003865;
            font-weight: bold;
        }

        .form_group>p {
            text-align: center;
            font-size: 15px;
            margin-bottom: 5px;
            color: #78be21;
        }

        .form_group>input {
            padding: 5px 10px;
        }

        .form_group>select {
            padding: 5px 10px;
        }

        .form_group>.btn {
            background-color: #78be21;
        }



        /* responsive for mobile */
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
               <img src="C:\Users\Akshata\OneDrive\Desktop\covid/covidLogo.jpeg"width="70" height="70">
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




            <div class="register_form_container">

                <div class="form_group title">
                    <h3>Update Form</h3>
                    <p>Covid Vaccination Data Update Form</p>
                </div>
               <form:form action="saveuser" modelAttribute="user" method="GET">
		
				<form:hidden path="userId"/>
				
				
				
                <div class="form_group">
                    <label for="firstName">First Name</label>
                    <form:input path="firstName"/>
                </div>

                <div class="form_group">
                    <label for="lastName">Last Name</label>
                    <form:input path="lastName"/>
                </div>

                <div class="form_group">
                    <label for="email">Email</label>
                    <form:input path="email"/>
                </div>
                
                      <form:hidden path="mobileNo"/>
                  
                <div class="form_group">
                    <label for="age">Age</label>
                    <form:input path="age"/>
                </div>
                <div class="form_group">
                    <label for="gender">Gender</label>
                    <form:select name="gender" id="gender" path="gender">
                        <form:option value="Male" />
                        <form:option value="Female" />
                        <form:option value="Other"/>
                        <form:hidden path="vaccineName"/>
				  
                 <form:hidden path="totalVaccine"/>
				<form:hidden path="vaccinePlace"/>
                    </form:select>
                </div>

                <div class="form_group">
                    <label for="govtIdType">Govt Id Type</label>
                    <form:select name="govtId" id="govtIdType" path="govtId">
                        <form:option value="Aaddhar"/>
                        <form:option value="Pan"/>
                        <form:option value="Passport"/>
                        <form:option value="Voter"/>
                    </form:select>
                </div>
                <div class="form_group">
                    <label for="govtIdNo">Govt Id No</label>
                    <form:input path="idNo"/>
                </div>
                <div class="form_group">
                    <input type="submit" class="btn" value="Update">
                </div>
                 <div class="form_group">
              <input type="button" value="Back" 
					   onclick="window.location.href='./backuser?mobileNo=<%= request.getParameter("mobileNo") %>'"/>
           
              
					   </div>
                 </form:form>
            </div>
          

        </section>
        <footer class="footer">
            <div>
            <div class="navbar_footer">
                <img src="C:\Users\Akshata\OneDrive\Desktop\covid/covidLogo.jpeg" >
            </div>
                <div class="copy_footer">
                     Copyright ??? 2021 Covid19. All Rights Reserved   
                </div>
            </div>
        </footer>

    </div>


</body>
</html>