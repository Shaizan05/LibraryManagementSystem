
<%-- 
    Document   : AdminBooks
    Created on : 5 Sep, 2023, 12:06:47 PM
    Author     : njuser
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:if test="${process eq 'book'}">
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
<!--    <a onclick="AdminLoader('addBook')" class="float">
        <i class="fa fa-plus my-float"></i>
    </a>-->
    <table class="table table-hover " id="myTable">
        <!--        <button type="button" class="btn btn-dark ">Add Book</button>-->
        <thead>
        <th>Id</th>
        <th>Cover</th>
        <th>Name</th>
        <th>Author Name</th>
        <th>Description</th>
        <th>Category</th>
        <th>Price</th>
        <th>Stock</th>
        <th>Actions</th>
    </thead>
    <tbody>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("ResultSet");
            int temp = 0;
            while (rs.next()) {
        %>
        <tr>
            <td><%=++temp%></td>
            <td><img id="img" src="<%=rs.getString("image")%>" alt="Cover"></td>
            <td><%=rs.getString("bookName")%></td>
            <td><%=rs.getString("authorName")%></td>
            <td><%=rs.getString("descp")%></td>
            <td><%=rs.getString("btype")%></td>
            <td><%=rs.getInt("price")%></td>
            <td><%=rs.getInt("stock")%></td>
            <td >
                <!--                <div class="d-flex flex-column">
                                    <button type="button" class="btn btn-warning" edit-value="<%=rs.getInt("bookId")%>" onclick="editBookModal(this)" >Edit</button>
                                    <button type="button" class="btn btn-danger mt-2" delete-value="<%=rs.getInt("bookId")%>" onclick="deleteBook(this)" >Delete</button>
                                </div>-->

                <div class="dropdown" style="margin-left: 50px">
                    <i data-toggle="dropdown" class="fa-solid fa-ellipsis-vertical fa-xl dropdown-toggle"  style="color: #000000;"></i>
                    <ul class="dropdown-menu" style="margin-left: -150px">
                        <li edit-value="<%=rs.getInt("bookId")%>" onclick="editBook(this)" ><a href="#">Edit</a></li>
                        <li delete-value="<%=rs.getInt("bookId")%>" onclick="deleteBook(this)" ><a href="#">Delete</a></li>
                    </ul>
                </div>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
<div id="BooksAjax">

</div>
</c:if>

<c:if test="${process eq 'addBook'}">
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
        <i class="fa-solid fa-arrow-left fa-2xl" style="color: #757575; margin-top: 30px;" onclick="AdminLoader('book')"></i>
        <h1 style="margin-top: 10px; margin-left: 400px;  color: #337ab7;">Add New Book</h1>
    </center>
    <hr>
    <form class="form-horizontal" style="margin-left: 180px">
        <div class="form-group">
            <label class="control-label col-xs-3" >Book Name:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="bookName" placeholder="Book Name">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="authorName">Author Name:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="authorName" placeholder="Author Name">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="imgUrl">image URL:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="imgUrl" placeholder=" image url">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="desc">Description:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="desc" placeholder="Description">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="Category">Category:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="category" placeholder="Category">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="Price">Price:</label>
            <div class="col-xs-4">
                <input type="number" class="form-control" id="price" placeholder="Price">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="Stock">Stock:</label>
            <div class="col-xs-4">
                <input type="number" class="form-control" id="stock" placeholder="Stock">
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="button" class="btn btn-primary" onclick="return addBook()" value="Add Books">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
        </div>
    </form>
    <div id="addBookAjax">

    </div>
</c:if>

<c:if test="${process eq 'editBook'}">
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
        <i class="fa-solid fa-arrow-left fa-2xl" style="color: #757575; margin-top: 30px;" onclick="AdminLoader('book')"></i>
        <h1 style="margin-top: 10px; margin-left: 400px;  color: #337ab7;">Edit Book</h1>
    </center>
    <hr>
    <form class="form-horizontal" style="margin-left: 180px">
        <%
            ResultSet ers = (ResultSet) request.getAttribute("ResultSet");
            while (ers.next()) {%>
        <input type="hidden" value="<%=ers.getString("bookId")%>" id="bookId">
        <div class="form-group">
            <label class="control-label col-xs-3" >Book Name:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="bookName" placeholder="Book Name" value="<%=ers.getString("bookName")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="authorName">Author Name:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="authorName" placeholder="Author Name" value="<%=ers.getString("authorName")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="imgUrl">image URL:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="imgUrl" placeholder=" image url" value="<%=ers.getString("image")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="desc">Description:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="desc" placeholder="Description" value="<%=ers.getString("descp")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="Category">Category:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="category" placeholder="Category" value="<%=ers.getString("btype")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="Price">Price:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="price" placeholder="Price" value="<%=ers.getString("price")%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3" for="Stock">Stock:</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="stock" placeholder="Stock" value="<%=ers.getString("stock")%>">
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="button" class="btn btn-primary" onclick="return updateBook()" value="Edit Books">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
        </div>
        <% }%>
    </form>
    <div id="editBookAjax">

    </div>
</c:if>
<c:if test="${process eq 'issued'}">
    <table class="table table-hover" id="myTable">
        <thead>
            <tr>
                <th>User Id</th>
                <th>User Name</th>
                <th>Book Id</th>
                <th>Book Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Status</th>
                <th>Actions</th>
                
                
            </tr>
        </thead>
        <tbody>

            <%

                ResultSet irs = (ResultSet) request.getAttribute("IssuedResultSet");
                while (irs.next()) {
            %>
            <tr>
                <td><%=irs.getString("userId")%></td>
                <td><%=irs.getString("userName")%></td>
                <td><%=irs.getString("bookId")%></td>
                <td><%=irs.getString("bookName")%></td>
                <td><%=irs.getString("startDate")%></td>
                <td><%=irs.getString("endDate")%></td>
                <td><%=irs.getString("issueStatus")%></td>
                <td>

                    <div class="dropdown" style="margin-left: 50px">
                        <i data-toggle="dropdown" class="fa-solid fa-ellipsis-vertical fa-xl dropdown-toggle"  style="color: #000000;"></i>
                        <ul class="dropdown-menu" style="margin-left: -150px">
                            <li onclick="editUser(this)" editUserValue="<%=irs.getInt("issueId")%>" ><a href="#">Edit</a></li>
                            <li  onclick="deleteIssueBook(this)" deleteIssueValue="<%=irs.getInt("issueId")%>" ><a href="#">Delete</a></li>
                        </ul>
                    </div>
                </td>

               
            </tr>
            <% }%>

        </tbody>
    </table>
            <div id="issueBookAjax"></div>
</c:if>