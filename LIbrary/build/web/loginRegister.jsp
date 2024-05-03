<%-- 
    Document   : loginRegister
    Created on : 31 Aug, 2023, 3:27:55 PM
    Author     : njuser
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN/REGISTER</title>
        <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5k44eCkQ2x61Dz11dBJ3DFcp8wPy8wghP2AvX6axsEw&s">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css"/>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
        <style>
            *{
                margin:0;
                padding: 0;
                box-sizing: border-box;
            }
            body
            {
                background: #f5f5f5;
            }

            h5
            {
                font-weight: 400;
            }

            .container
            {
                margin-top: 35px;
                width: 400px;
                height: auto;
            }

            .tabs .indicator
            {
                background-color: #e0f2f1;
                height: 60px;
                opacity: 0.3;
            }

            .form-container
            {
                padding: 40px;
                padding-top: 10px;
            }

            .confirmation-tabs-btn
            {
                position: absolute;
            }
        </style>

    </head>
    <body>
        <div class="container white z-depth-2">
            <ul class="tabs teal">
                <li class="tab col s3"><a class="white-text active" href="#login" style="background-color: #337ab7">login</a></li>
                <li class="tab col s3"><a class="white-text" href="#register" style="background-color: #337ab7">register</a></li>
            </ul>
            <div id="login" class="col s12">
                <form class="col s12">
                    <div class="form-container">
                        <h3 class="text" style="color: #337ab7">Hello</h3>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="username" type="text" class="validate">
                                <label for="username">Username</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="password" type="password" class="validate">
                                <label for="password">Password</label>
                            </div>
                        </div>
                        <br>
                        <center>
                            <button class="btn waves-effect waves-light" onclick="return login()" style="background-color: #337ab7">Connect</button>
                            <br>
                            <br>
                            <a href="index.jsp">Back to Home</a>
                        </center>
                    </div>
                </form>
            </div>
            <div id="register" class="col s12">
                <form class="col s12">
                    <div class="form-container">
                        <h3 class="text" style="color: #337ab7">Welcome</h3>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="regUsername" type="text" class="validate">
                                <label for="username">Username</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="regEmail" type="email" class="validate">
                                <label for="email">Email</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="regPassword" type="password" class="validate">
                                <label for="password">Password</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="password-confirm" type="password" class="validate">
                                <label for="password-confirm">Password Confirmation</label>
                            </div>
                        </div>
                        <center>
                            <button class="btn waves-effect waves-light " onclick="return regis()" style="background-color: #337ab7">Submit</button>
                        </center>
                    </div>
                </form>
            </div>
        </div>
        <div id="loginRegisterAjax">

        </div>
        <script src="js/index.js"></script>
    </body>
</html>

