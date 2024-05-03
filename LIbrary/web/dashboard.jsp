<%-- 
    Document   : dashboard
    Created on : 31 Aug, 2023, 3:03:15 PM
    Author     : njuser
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${process eq 'dashboard'}">
    
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Dashboard Page</title>
            <style>
                *{
                    margin:0;
                    padding: 0;
                    box-sizing: border-box;
                }
                #about{
                    padding: 10px 50px;
                    font-size: large;
                    background-color:rgba(80,80,100,0.3);
                    border-radius: 3px;
                    margin: 0px 50px;
                    margin-top: 20px;
                    transition: all ease 0.3s;

                }
                #about:hover{
                    padding: 10px 50px;
                    font-size: large;
                    background-color:rgba(80,80,100,0.4);
                    border-radius: 3px;
                    margin: 0px 50px;
                    margin-top: 20px;
                    box-shadow: 3px 3px 7px rgba(0,0,0,0.2);

                }

                .media{
                    padding: 10px;
                }
                .media:hover{
                    padding: 10px;
                    background-color: rgba(225,225,225,0.7);
                    box-shadow: 3px 3px 7px rgba(0,0,0,0.6);
                    border-radius: 5px;
                }
                .media-object{
                    border-radius: 50%;
                }
            </style>
        </head>
        <body>
            <div id="about">

                <center><h1 style="
                            font-family: monospace;
                            font-size: 40px;" class="mt-4"> ABOUT LIBRARY </h1>
                </center>

                <p onclick="dashClick('aboutUs')">
                    Learning is a lifetime journey. To make this journey enjoyable, we, Noble Library,
                    situated at Malad West, Mumbai, Maharashtra, provide an extensive list of books that 
                    you will find informative and mind-changing all at once. Reading is the best way to pass 
                    time and what better way than to borrow/purchase books from our library and liberate your 
                    mind altogether. We provide a safe, comfortable and friendly environment that enables learning 
                    and advancement of knowledge, and promotes discovery and scholarship. Sit down with a cup of coffee 
                    and unwind at our book store with a book of your choice!
                </p>
            </div>
            <div class="container"style='font-size: large;font-family: monospace;'> 
                <h2>Management Staff</h2>
                <p>Staff managers are responsible for keeping staff engaged, motivated and involved. They often handle many of the same tasks, regardless of the industry in which they work. Some of their primary responsibilities include: Interviewing and hiring employees and ensuring they're properly trained..</p>
                <br>

                <!-- Left-aligned media object -->
                <div class="media">
                    <div class="media-left">
                        <img src="https://onepiece.store/wp-content/uploads/2021/05/Monkey-D-Luffy-Merch-1.png" class="media-object" style="width:60px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">BHAVESH SHAHANE</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
                <hr>
                <div class="media">
                    <div class="media-left">
                        <img src="https://live.paloaltonetworks.com/t5/image/serverpage/image-id/16661iE57B78E379CA8022/image-size/large/is-moderation-mode/true?v=v2&px=999" class="media-object" style="width:60px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">OVESH SHAIKH</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
                <hr>
                <div class="media">
                    <div class="media-left">
                        <img src="https://www.dictionary.com/e/wp-content/uploads/2018/03/Ichigo.jpg" class="media-object" style="width:60px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">PAVAN MALI</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
                <hr>
                <div class="media">
                    <div class="media-left">
                        <img src="https://qph.cf2.quoracdn.net/main-qimg-525e8147f8b2e37f8fc1b662dbf7722f-pjlq" class="media-object" style="width:60px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">SHAIZAN KURESHI</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
                <hr>
                <div class="media">
                    <div class="media-left">
                        <img src="data:image/jpeg;base64,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" class="media-object" style="width:60px">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">PREM TALAVIYA</h4>
                        <p>Hi , I am Member of This Community and working as UI Designer . Our website and community will provide best Knowledge through source and books. </p>
                    </div>
                </div>
                <hr>
            </div>
            <!--<input type="button" class="btn-primary" value="Load Books" onclick="trendingLoader()">-->
            <div id="trendingAjax">

            </div>
        </body>
    </html>
</c:if>
<c:if test="${process eq 'userDashboard'}">
    <%
        String sEmail = (String) session.getAttribute("EmailResult");
        String sName = (String) session.getAttribute("NameResult");
        String sId = (String) session.getAttribute("IdResult");
    %>

    <style>


        .container2 {
            height: 450px;
            width: 400px;
            box-shadow: 0 10px 20px black;
            background-size: cover;
            justify-content: center;
            align-items: center;
            text-align: center;
            overflow: hidden;
            font-family: 'Abel', sans-serif;
            margin-top: 25px;
            border-radius: 12px;
        }

        .image1 {
            height: 100px;
            width: 100px;
            background-image: url('https://www.computerhope.com/jargon/g/guest-user.png');
            background-size: cover;
            border-radius: 50%;
            border: 8px solid white;
            position: relative;
            top: 200px;
            margin-left: 222px;
            box-shadow: 0 2px 15px rgb(58, 54, 54);
            transform: rotate(-20deg);
        }

        .shape1 {
            height: 250px;
            width: 600px;
            background-color: #337ab7;
            margin-left: -20px;
            position: relative;
            top: -80px;
            box-shadow: 0 2px 15px black;
            transform: rotate(25deg);
        }

        .h3 {
            margin-bottom: 10px;
            font-family: 'Montserrat', sans-serif;
            display: flex;
            margin-left: 50px;
            font-size: 1.7rem;

        }



    </style>
    <center>
        <div class="container2">
            <div class="shape1">
                <div class="image1"></div>
            </div>
            <h3 class="h3"> <lable><strong>Id</strong></lable>: 
                <%=sId%></h3><hr>

            <h3 class="h3"><lable><strong>Name</strong></lable>: 
                <%=sName%></h3><hr>

            <h3 class="h3"><lable><strong>Email</strong></lable>: 
                <%=sEmail%></h3>

        </div>
    </center>
</c:if>
<c:if test="${process eq 'adminDashboard'}">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar collapse" id="sidebar">
                <div class="list-group">
                    <a href="#" class="list-group-item active"><span class="fa fa-fw fa-dashboard"></span> Dashboard</a>
                    <a href="#" class="list-group-item"><span class="fa fa-fw fa-dashboard"></span> Products <span class="badge badge-dark badge-pill pull-right">14</span></a>
                    <a href="#" class="list-group-item"><span class="fa fa-fw fa-dashboard"></span> Categories <span class="badge badge-dark badge-pill pull-right">14</span></a>
                    <a href="#" class="list-group-item collapsed" data-target="#submenu1" data-toggle="collapse" data-parent="#sidebar"><span class="fa fa-fw fa-dashboard"></span> Categories<span class="caret arrow"></span></a>
                    <div class="list-group collapse" id="submenu1">
                        <a href="#" class="list-group-item">Category</a>
                        <a href="#" class="list-group-item">Category</a>
                    </div>
                    <a href="#" class="list-group-item"><span class="fa fa-fw fa-dashboard"></span> Users <span class="badge badge-dark badge-pill pull-right">14</span></a>
                    <a href="#" class="list-group-item"><span class="fa fa-fw fa-dashboard"></span> Orders <span class="badge badge-dark badge-pill pull-right">14</span></a>
                </div>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main mmmm">
                <h1 class="page-header">Dashboard</h1>

                <section class="row text-center placeholders">
                    <div class="col-6 col-sm-3">
                        <div class="panel panel-info">
                            <div class="panel-heading">Books</div>
                            <div class="panel-body">
                                <h4><%=request.getAttribute("BookCount")%></h4>
                                <p>Books Avalable</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-sm-3">
                        <div class="panel panel-success">
                            <div class="panel-heading">Users</div>
                            <div class="panel-body">
                                <h4><%=request.getAttribute("UserCount")%></h4>
                                <p>Active Users</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-sm-3">
                        <div class="panel panel-warning">
                            <div class="panel-heading">Books Issued</div>
                            <div class="panel-body">
                                <h4><%=request.getAttribute("IssuedBooksCount")%></h4>
                                <p>Books Issued</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-sm-3">
                        <div class="panel panel-danger">
                            <div class="panel-heading">Over Due</div>
                            <div class="panel-body">
                                <h4>0</h4>
                                <p>Return Pending</p>
                            </div>
                        </div>
                    </div>
                </section>

                <style>
                    .mmmm{
                        margin-left: 80px;
                    }
                </style>
            </c:if>