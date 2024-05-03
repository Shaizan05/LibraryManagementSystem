<%-- 
    Document   : AdminUsers
    Created on : 5 Sep, 2023, 12:06:39 PM
    Author     : njuser
--%>

<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${process eq 'user'}">
    <style>
        #img{
            height: 200px;
            width: 150px
        }
        *{
            padding:0;
            margin:0;
        }



        .float{
            position:fixed;
            width:60px;
            height:60px;
            bottom:40px;
            right:40px;
            background-color:#212529;
            color:#FFF;
            border-radius:50px;
            text-align:center;
            box-shadow: 2px 2px 3px #999;
        }

        .my-float{
            margin-top:22px;
        }
    </style>
<!--    <a onclick="AdminLoader('addUser')" class="float">
        <i class="fa fa-plus my-float"></i>
    </a>-->
    <table class="table table-hover" id="myTable">
        <thead>
            <tr>
                <th>User Name</th>
                <th>User Email</th>
                <th>User Password</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>

            <%
                
                ResultSet rs = (ResultSet) request.getAttribute("ResultSet");
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("userName")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("userPass")%></td>

                <td>
<!--                    <button type="button" class="btn btn-warning" editUserValue="<%=rs.getInt("userId")%>" onclick="editUserModal(this)">Edit</button>
                </td>
                <td>
                    <button type="button" class="btn btn-danger " deleteUserValue="<%=rs.getInt("userId")%>" onclick="deleteUser(this)">Delete</button>-->
                    <div class="dropdown" style="margin-left: 50px">
                        <i data-toggle="dropdown" class="fa-solid fa-ellipsis-vertical fa-xl dropdown-toggle"  style="color: #000000;"></i>
                        <ul class="dropdown-menu" style="margin-left: -150px">
                            <li onclick="editUser(this)" editUserValue="<%=rs.getInt("userId")%>" ><a href="#">Edit</a></li>
                            <li  onclick="deleteUser(this)" deleteUserValue="<%=rs.getInt("userId")%>" ><a href="#">Delete</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
            <% }%>

        </tbody>
    </table>
    <div id="userDeleteAjax">

    </div>
</c:if>
<c:if test="${process eq 'query'}">
    <table class="table table-hover " id="myTable">
        <!--        <button type="button" class="btn btn-dark ">Add Book</button>-->
        <thead>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Subject</th>
        <th>Message</th>
        <th>Actions</th>

    </thead>
    <tbody>
        <%
            ResultSet qrs = (ResultSet) request.getAttribute("ResultSet");
            int temp = 0;
            while (qrs.next()) {
        %>
        <tr style="height:80px;align-self: center;" >
            <td><%=++temp%></td>
            <td><%=qrs.getString("Name")%></td>
            <td><%=qrs.getString("Email")%></td>
            <td><%=qrs.getString("Subject")%></td>
            <td><%=qrs.getString("Message")%></td>
            <td><i class="fa-solid fa-trash" style="color: #050506;" id="<%=qrs.getString("queryId")%>" onclick="deleteQuery(this)"></i></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
        <div type="hidden" id="deleteQueryAjax"></div>
</c:if>
<c:if test="${process eq 'addUser'}">
    <style>
        h1 {
            font-family: 'Poppins', sans-serif, 'arial';
            font-weight: 600;
            font-size: 45px;
            color: #337ab7;
            text-align: center;
        }
        
    </style>
    <center style="display:flex;width: 100%;">
        <i class="fa-solid fa-arrow-left fa-2xl" style="color: #757575; margin-top: 30px;" onclick="AdminLoader('user')"></i>
        <h1 style="margin-top: 10px; margin-left: 400px;  color: #337ab7;">Add New User</h1>
    </center>
    <hr>
    <form class="form-horizontal" style="margin-left: 180px">
        <div class="form-group">
            <label class="control-label col-xs-3" >Username:</label>
            <div class="col-xs-4">
                <input type="username" class="form-control" id="inputUsername" placeholder="Username">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="inputEmail">Email:</label>
            <div class="col-xs-4">
                <input type="email" class="form-control" id="inputEmail" placeholder="Email">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="inputPassword">Password:</label>
            <div class="col-xs-4">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password">
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="button" class="btn btn-primary" onclick="return addUser()" value="Add User">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
        </div>
    </form>
    <div id="addUserAjax">

    </div>
</c:if>
    <c:if test="${process eq 'editUser'}">
    <style>
        h1 {
            font-family: 'Poppins', sans-serif, 'arial';
            font-weight: 600;
            font-size: 45px;
            color: #337ab7;
            text-align: center;
        }
    </style>
      <center style="display:flex;width: 100%;">
        <i class="fa-solid fa-arrow-left fa-2xl" style="color: #757575; margin-top: 30px;" onclick="AdminLoader('user')"></i>
        <h1 style="margin-top: 10px; margin-left: 400px;  color: #337ab7;">Edit User</h1>
    </center>
    <hr>
    <form class="form-horizontal" style="margin-left: 180px">
<%
                ResultSet urs = (ResultSet) request.getAttribute("ResultSet");
                while (urs.next()) {
            %>        <div class="form-group">
            <label class="control-label col-xs-3" >Username:</label>
            <div class="col-xs-4">
                <input type="username" class="form-control" id="inputUsername" placeholder="Username" value="<%=urs.getString("userName")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="inputEmail">Email:</label>
            <div class="col-xs-4">
                <input type="email" class="form-control" id="inputEmail" placeholder="Email" value="<%=urs.getString("email")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="inputPassword">Password:</label>
            <div class="col-xs-4">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password" value="<%=urs.getString("userPass")%>">
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="button" class="btn btn-primary" onclick="return updateUser(this)" id="<%=urs.getString("userId")%>" value="Edit User">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
        </div>
            <% } %>
    </form>
    <div id="updateUserAjax">

    </div>
</c:if>