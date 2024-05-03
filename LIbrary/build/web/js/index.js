/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//ajax function
function ajaxcall(method, url, data, show, ishtml) {
    var xhttp = new XMLHttpRequest();
    //event
    xhttp.onload = function () {
        if (ishtml) {
            document.getElementById(show).innerHTML = this.responseText;
        } else {
            document.getElementById(show).value = this.responseText;
        }
    };
    xhttp.open(method, url, false);
    xhttp.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
    xhttp.send(data);
}

//process loader for main dashboard
function Loader(process) {

    ajaxcall('POST', 'ProcessServlet', 'process=' + process, 'Ajax', 'isHtml');
    if (process === "dashboard") {
        ajaxcall('POST', 'ProcessServlet', 'process=trendingBooks', 'trendingAjax', 'isHtml');
    }
}

//process loader for login and register
function loginRegister(process) {
    ajaxcall('POST', 'ProcessServlet', 'process=' + process, 'loginAjax', 'isHtml');
}

//validation function
function validate(elementId, caption) {
    var check = document.getElementById(elementId).value;
    if (check === '') {
        alert(caption + " Cannot be empty !");
        document.getElementById(elementId).focus();
        return false;
    }
    return true;
}


//login function
function login() {
    var result = validate("username", "Username")
            && validate("password", "Password");
    if (result) {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        ajaxcall('POST', 'loginRegisterServlet', 'username=' + username + '&password=' + password + '&process=login', 'loginRegisterAjax', 'isHtml');
        var div = document.getElementById('loginRegisterAjax').innerHTML;
        if (div == 2) {
            window.location.href = "AdminDashboard.jsp";
        } else if (div == 1) {
            alert("Welcome " + username);
            window.location.href = "userDashboard.jsp";
        } else {
            alert("Username or Password is Wrong !");
        }

    }
    document.getElementsByTagName("body")[0].style = "padding:0px";
    return false;
}

//logout function
function logOut() {
    var result = confirm("Do you want to Log Out ?");
    if (result) {
        ajaxcall('POST', 'loginRegisterServlet', 'process=logOut', 'userAjax');

        window.location.href = "index.jsp";
    }

}

//register function
function regis() {
    var result = validate("regUsername", "Username")
            && validate("regEmail", "Email")
            && validate("regPassword", "Password")
            && validate("password-confirm", "Confirm Password");
    if (result) {

        var validRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var username = document.getElementById('regUsername').value;
        var email = document.getElementById('regEmail').value;
        var password = document.getElementById('regPassword').value;
        var confirmPassword = document.getElementById('password-confirm').value;
        var data = 'username=' + username + '&email=' + email + '&password=' + password + '&process=register';
        if (email.match(validRegex)) {
            if (password === confirmPassword) {
                ajaxcall('POST', 'loginRegisterServlet', data, 'loginRegisterAjax', 'isHtml');

                var div = document.getElementById('loginRegisterAjax').innerHTML;
                if (div > 0) {
                    alert("Submmited Successfully");
                    form.reset();
                    return false;
                } else {
                    alert("Try Again !");
                }
            } else {
                alert("Confirm Password should be same as Password.");
            }
        } else {
            alert("Email is not Valid");
        }

    }
    return false;
}

//contact us form validation
function contactus() {
    var result = validate("name", "Name")
            && validate("email", "Email")
            && validate("subject", "Subject")
            && validate("message", "message");
    if (result) {
        var validRegexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

        var name = document.getElementById('name').value;
        var email = document.getElementById('email').value;
        var subject = document.getElementById('subject').value;
        var message = document.getElementById('message').value;
        if (email.match(validRegexEmail)) {

            ajaxcall('POST', 'ProcessServlet', 'process=query&name=' + name + '&email=' + email + '&subject=' + subject + '&message=' + message, 'contactAjax');
            var div = document.getElementById('contactAjax').value;
            if (div > 0) {
                alert("Message Sent Successfully!");
                document.getElementById('contactForm').reset();
            } else {
                alert('Message is not sended proprly Try Again!');
            }
        } else {
            alert("Email is not Valid");
        }
        return false;

    }

    return false;

}
//validation of book when user's not login
function bookvalid() {
    var msg = confirm("To See The Detail Login First !");
if(msg){
  window.location.href = "loginRegister.jsp";
}


}
//show details of user's who rent book
function showRent(elementId) {
    var bookId = elementId.getAttribute("data-bookId");
    var bookName = elementId.getAttribute("data-bookName");
    ajaxcall('POST', 'UsersServlet', 'process=rentBook&bookId=' + bookId +'&bookName='+bookName, 'Ajax', 'ishtml');
}

//insert data into the issuedBook
function issuedBook(a) {
    var uname = a.getAttribute("uName");
    var uid = a.getAttribute("uid");
    var status = "issued";
    var result = validate("emaill", "Email") &&
            validate("snumber", "Serial number");

    if (result) {
        
        var date = document.getElementById("dp").value;
        var bname = document.getElementById("bname").value;
        var bid = document.getElementById("snumber").value;
        var date1 = new Date();
        var dy = date1.getDate();
        var month = date1.getMonth() + 1;
        var yy = date1.getFullYear();
        var date2 = yy + "-" + month + "-" + dy;
        var data = "uid="+uid+"&uname="+uname+"&bid=" + bid +"&bname="+bname+"&startdate="+ date2+"&enddate=" + date + "&process=issubook"+ "&status=" + status;

        ajaxcall('POST', "UsersServlet", data, 'rentAjax', 'isHtml');
        var aj = document.getElementById("rentAjax").innerHTML;
        if (aj > 0) {
            ajaxcall('POST', "UsersServlet", 'process=countBook&bookId=' + bid, 'rentAjax');
            alert("Book Rented!");
            document.getElementById("rentbook").reset();

        }
        else{
            alert("book is not rented....");
        }
    }
    return false;
}

//give the date of book rent
function datevalid() {

    const date = new Date();
    let day = date.getDate();
    var select = document.getElementById("select").value;
    if (select === "3") {
        date.setDate(day + 3);
    }
    if (select === "5") {
        date.setDate(day + 5);
    }
    if (select === "7") {
        date.setDate(day + 7);
    }
    var dd = date.toLocaleDateString();
    var dy = date.getDate();

    var month = date.getMonth() + 1;

    var yy = date.getFullYear();

    var date2 = yy + "-" + month + "-" + dy;


    var rd = document.getElementById("dp");
    rd.value = date2;

}

//all admin process
function AdminLoader(process) {
    ajaxcall('POST', 'AdminServlet', 'process=' + process, 'Ajax', 'isHtml');
    if (process === "user" || process === "book" || process === "issued" || process === "query") {
        let table = new DataTable('#myTable');
    }
}

//insert user's into the userDetail table
function addUser() {
    var result = validate('inputUsername', 'Username')
            && validate('inputEmail', 'Email')
            && validate('inputPassword', 'Password');
    if (result) {
        var username = document.getElementById('inputUsername').value;
        var email = document.getElementById('inputEmail').value;
        var password = document.getElementById('inputPassword').value;

        ajaxcall('POST', 'AdminServlet', 'process=insertUser&username=' + username + '&email=' + email + '&password=' + password, 'addUserAjax', 'isHtml');
        var div = document.getElementById('addUserAjax').innerHTML;
        if (div > 0) {

            alert('User Added');

        } else {
            alert('User is not added please try Again!');
        }
        AdminLoader('user');


    }
}

//delete user's from userDetail table
function deleteUser(elementId) {
    var userId = elementId.getAttribute("deleteUserValue");
    var result = confirm("Do You Want to Delete This User ?");
    if (result) {
        ajaxcall('POST', 'AdminServlet', 'process=deleteUser&userId=' + userId, 'userDeleteAjax', 'ishtml');
        var div = document.getElementById('userDeleteAjax').innerHTML;
        if (div > 0) {
            alert('User Deleted');
        } else {
            alert('user is not deleted please try Again!');
        }
    }
    AdminLoader('user');
}

//insert book's into the bookDetail table
function addBook() {
    var result = validate("bookName", "Book Name")
            && validate("authorName", "Author Name")
            && validate("imgUrl", "Url")
            && validate("desc", "Description")
            && validate("category", "Category")
            && validate("price", "Price")
            && validate("stock", "Quantity");
    if (result) {
        var name = document.getElementById('bookName').value;
        var author = document.getElementById('authorName').value;
        var url = document.getElementById('imgUrl').value;
        var desc = document.getElementById('desc').value;
        var category = document.getElementById('category').value;
        var price = document.getElementById('price').value;
        var stock = document.getElementById('stock').value;

        var data = 'name=' + name + '&author=' + author + '&url=' + url + '&desc=' + desc + '&category=' + category + '&price=' + price + '&stock=' + stock;
        ajaxcall('POST', 'AdminServlet', data + '&process=addBooksInDb', 'addBookAjax', 'ishtml');
        var div = document.getElementById('addBookAjax').innerHTML;
        if (div > 0) {
            alert('Book Added');
        } else {
            alert('Book is Not Added ,Try Again please');
        }
    }
    var btn = document.getElementById('bookClose');
    btn.click();
    AdminLoader('book');
}


//delete book's from bookDetail table
function deleteBook(elementId) {
    var bookId = elementId.getAttribute("delete-value");
    var result = confirm("Do You Want to Delete This Book ?");
    if (result) {
        ajaxcall('POST', 'AdminServlet', 'process=deleteBook&bookId=' + bookId, 'BooksAjax', 'ishtml');
        var div = document.getElementById('BooksAjax').innerHTML;
        if (div > 0) {
            alert('Book Deleted');
        } else {
            alert('Book is not deleted please try Again!');
        }
    }
    AdminLoader('book');
}

//give the edit book form 
function editBook(elementId) {
    var bookId = elementId.getAttribute("edit-value");
    ajaxcall('POST', 'AdminServlet', 'process=editBook&bookId=' + bookId, 'Ajax', 'ishtml');

}

//update book's into the bookDetail table
function updateBook() {
    var bookId = document.getElementById('bookId').value;

    var result = validate("bookName", "Book Name")
            && validate("authorName", "Author Name")
            && validate("imgUrl", "Url")
            && validate("desc", "Description")
            && validate("category", "Category")
            && validate("price", "Price")
            && validate("stock", "Quantity");
    if (result) {
        var name = document.getElementById('bookName').value;
        var author = document.getElementById('authorName').value;
        var url = document.getElementById('imgUrl').value;
        var desc = document.getElementById('desc').value;
        var category = document.getElementById('category').value;
        var price = document.getElementById('price').value;
        var stock = document.getElementById('stock').value;

        var data = 'name=' + name + '&author=' + author + '&url=' + url + '&desc=' + desc + '&category=' + category + '&price=' + price + '&stock=' + stock;
        ajaxcall('POST', 'AdminServlet', data + '&process=updateBook' + '&bookId=' + bookId, 'editBookAjax', 'ishtml');
        var div = document.getElementById('editBookAjax').innerHTML;

        if (div > 0) {

            alert('Book Edited');

        } else {
            alert('Book is Not Edited Try Again!');
        }

        AdminLoader('book');
    }

}

//delete query from userQuery table
function deleteQuery(element) {
    var id = element.getAttribute("id");
    var msg = confirm("Aru you sure!");
    if (msg) {
        ajaxcall('POST', 'AdminServlet', 'id=' + id + '&process=deleteQuery', 'deleteQueryAjax', 'ishtml');
        AdminLoader('query');
    }
}

//give the edit user form 
function editUser(element) {
    var id = element.getAttribute("editUserValue");
    ajaxcall('POST', 'AdminServlet', 'id=' + id + '&process=editUser', 'Ajax', 'ishtml');
}

//update user's into the userDetail table
function updateUser(element) {
    var id = element.getAttribute("id");

    var result = validate('inputUsername', 'Username')
            && validate('inputEmail', 'Email')
            && validate('inputPassword', 'Password');
    if (result) {
        var username = document.getElementById('inputUsername').value;
        var email = document.getElementById('inputEmail').value;
        var password = document.getElementById('inputPassword').value;

        ajaxcall('POST', 'AdminServlet', 'id=' + id + '&process=updateUser&username=' + username + '&email=' + email + '&password=' + password, 'updateUserAjax', 'isHtml');
        var div = document.getElementById('updateUserAjax').innerHTML;
        if (div > 0) {

            alert('User Updated');

        } else {
            alert('User is not added please try Again!');
        }
        AdminLoader('user');


    }
}


//delete form issueBook table
function deleteIssueBook(button){
    var id = button.getAttribute("deleteIssueValue");
    var msg = confirm("Aru you sure!");
    if (msg) {
        ajaxcall('POST', 'AdminServlet', 'id=' + id + '&process=deleteIssue', 'issueBookAjax', 'ishtml');
        AdminLoader('issued');
    }
}