<%-- 
    Document   : AdminDashboard
    Created on : 5 Sep, 2023, 10:38:48 AM
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
        <title>Admin Dashboard</title>
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
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    </head>
    <body onload="AdminLoader('adminDashboard')">
        <nav class="navbar navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button  type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <!--                        <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span> -->
                        <i class="fa-solid fa-bars-staggered fa-2xl" style="color: #000000;"></i> 

                    </button>
                    <h3><img id="mainLogo" src="ASSETS/person-reading-book-icon-vector.jpg"/>BOOK BUDDY</h3>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right input-group">
                        <!--                        <li class="mt-3" style="margin-top: 7px">  
                                                    <div class="form-group ">
                                                        <input type="text" class="form-control" placeholder="Search">
                                                    </div>  
                                                </li>
                                                <li class="mt-3 input-group-append" style="margin-top: 7px">
                                                    <button type="submit" class="btn btn-primary"><i class="fas fa-search" style="color: #f2f2f3;"></i></button>
                                                </li>-->
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
                    <h3>Welcome, <%=session.getAttribute("username")%></h3>
                    <ul class="nav nav-pills nav-stacked " id="pills-tab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section1" onclick="AdminLoader('adminDashboard')">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section2" onclick="AdminLoader('user')">User Manager</a></li>
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section2" onclick="AdminLoader('book')">Book Manager</a></li>
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section3" onclick="AdminLoader('issued')">Issued Book</a></li>

                        <!--<li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section3" onclick="AdminLoader('bookRecords')">Books Record</a></li>-->
                        <li class="nav-item"><a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#section3" onclick="AdminLoader('query')">Query</a></li>
                        <li class="nav-item"><div class="dropdown">
                                <a style="text-decoration: none; color: black" class="nav-link active dropdown-toggle" id="pills-home-tab" data-toggle="dropdown">Opreations
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#" onclick="AdminLoader('addUser')">Add User</a></li>
                                    <li><a href="#" onclick="AdminLoader('addBook')">Add Book</a></li>
                                </ul>
                            </div></li>
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
                                    <a style="cursor:pointer;" onclick="AdminLoader('adminDashboard')">Dashboard</a>
                                    <a style="cursor:pointer;" onclick="AdminLoader('user')">User</a>
                                    <a style="cursor:pointer;" onclick="AdminLoader('book')">Book </a>
                                    <a style="cursor:pointer;" onclick="AdminLoader('issued')">Issued </a>
                                </div>
                            </div>
                        </div>                                        
                        <div  style="margin-top: 30px;display: flex; justify-content: center; align-items: center" class="copyright">
                            <p>THANKS FOR VISITING OUR WEBSITE <a href="#" target="_blank">bookbuddy.org</a></p>
                        </div>
                    </footer>
                </div>
            </div>
        </div>




        <script src="js/index.js"></script>
    </body>
</html>