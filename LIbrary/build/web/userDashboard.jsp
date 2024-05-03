<%-- 
    Document   : userDashboard
    Created on : 2 Sep, 2023, 3:42:39 PM
    Author     : njuser
--%>
<%
    if (session.getAttribute("login") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User Dashboard</title>
        <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5k44eCkQ2x61Dz11dBJ3DFcp8wPy8wghP2AvX6axsEw&s">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */
            *{
                margin:0;
                padding: 0;
                box-sizing: border-box;
            }

            .navbar {
                margin-bottom: 0;
                border-radius: 0;
                background-color: #f1f1f1;
                border-bottom: solid 1px #e1e1e1;

            }

            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {
                height: 650px;
            }

            /* Set gray background color and 100% height */
            .sidenav {
                padding-top: 20px;
                background-color: #f1f1f1;
                height: 100%;
                border-right: solid 1px #e1e1e1;
            }


            /* Set black background color, white text and some padding */
            footer {
                color: black;
                padding: 15px;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 100%) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {
                    height:auto;
                }
            }
            #loginRegister{
                text-decoration: none;

            }
        </style>
    </head>
    <body onload="Loader('userDashboard')">
        <nav class="navbar navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button  type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <!--                        <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>                        -->
                        <i class="fa-solid fa-bars-staggered fa-2xl" style="color: #000000;"></i> 

                    </button>
                    <h3><img id="mainLogo" src="ASSETS/person-reading-book-icon-vector.jpg"/>BOOK BUDDY</h3>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right input-group">

                        <li style="margin-top:15px;">

                            <i  class="fa-solid fa-right-from-bracket"  style="color: black; margin: 20px;cursor: pointer; " onclick="logOut()">LOG OUT</i>



                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid text-center ">    
            <div class="row content ">
                <div class="col-sm-2 sidenav hidden-xs " id="myScrollspy">
                    <h3>Welcome, <%=session.getAttribute("NameResult")%></h3>
                    <ul class="nav nav-pills nav-stacked " id="pills-tab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section1" onclick="Loader('dashboard')">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section2" onclick="Loader('book')">Book</a></li>
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section3" onclick="Loader('contactUs')">Contact Us</a></li>
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section3" onclick="Loader('aboutUs')">About Us</a></li>
                        <li class="nav-item">  <a class="nav-link active" id="pills-home-tab" data-toggle="pill"onclick="Loader('userDashboard')">Profile</a></li>
                    </ul><br>
                </div>
                <div class="col-sm-10 text-left " style="height: 650px; overflow: auto;"> 
                    <div id="Ajax">

                    </div>
                    <style>
                        #mainLogo{
                            width: 50px;
                            background-color: #f1f1f1;
                            border-radius: 50%;
                            cursor: pointer;
                        }
                    </style>
                    <footer style="margin-top:  30px; " class="container p-4 rounded" style="background-color: rgba(0,0,0,0.1);">
                        <hr style="margin-top:  100px"> 
                        <div class="d-lg-flex justify-content-between">

                            <div style="width: 550px; padding: 5px;">
                                <div style="display: flex; justify-content: space-between; align-items: center; font-size: 17px; ">
                                    <img id="mainLogo" src="ASSETS/person-reading-book-icon-vector.jpg">Book Buddy
                                    <a style="cursor:pointer;" onclick="Loader('userDashboard')">Profile</a>
                                    <a style="cursor:pointer;" onclick="Loader('book')">Books</a>
                                    <a style="cursor:pointer;" onclick="Loader('contactUs')">Contact us</a>
                                    <a style="cursor:pointer;" onclick="Loader('aboutUs')">About us</a>
                                </div>
                            </div>
                        </div>                                        
                        <div  style="margin-top: 30px;display: flex; justify-content: center; align-items: center" class="copyright">
                            <p>THANKS FOR VISITING OUR WEBSITE <a href="#" target="_blank">bookbuddy.org</a></p>
                        </div>
                    </footer>
                    <input type="hidden" id="userAjax">
                </div>
            </div>
        </div>




        <script src="js/index.js"></script>
    </body>
</html>