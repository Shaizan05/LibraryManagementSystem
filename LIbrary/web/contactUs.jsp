<%-- 
    Document   : contactUs
    Created on : 31 Aug, 2023, 3:03:43 PM
    Author     : njuser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
        <style>
            *{
                margin:0;
                padding: 0;
                box-sizing: border-box;
            }
            h1 {
                font-family: 'Poppins', sans-serif, 'arial';
                font-weight: 600;
                font-size: 50px;
                color: #337ab7;
                text-align: center;

            }

            h4 {
                font-family: 'Roboto', sans-serif, 'arial';
                font-weight: 400;
                font-size: 20px;
                color: #9b9b9b;
                line-height: 1.5;
            }

            /* ///// inputs /////*/

            input:focus ~ label, textarea:focus ~ label, input:valid ~ label, textarea:valid ~ label {
                font-size: 0.75em;
                color: #337ab7;
                top: 5px;
                -webkit-transition: all 0.225s ease;
                transition: all 0.225s ease;
            }

            .styled-input {
                float: left;
                width: 293px;
                margin: 1rem 0;
                position: relative;
                border-radius: 4px;
            }

            @media only screen and (max-width: 768px){
                .styled-input {
                    width:100%;
                }
            }

            .styled-input label {
                color: #2d2d2d;
                padding: 1.3rem 30px 1rem 30px;
                position: absolute;
                top: 10px;
                left: 0;
                -webkit-transition: all 0.25s ease;
                transition: all 0.25s ease;
                pointer-events: none;
            }

            .styled-input.wide {
                width: 650px;
                max-width: 100%;
            }

            input,
            textarea {
                padding: 10px;
                border: 0;
                width: 100%;
                font-size: 2rem;
                background-color: #f1f1f1;
                color: black;
                border-radius: 4px;
                border: solid 1px #337ab7;
            }

            input:focus,
            textarea:focus {
                outline: 0;
            }

            input:focus ~ span,
            textarea:focus ~ span {
                width: 100%;
                -webkit-transition: all 0.075s ease;
                transition: all 0.075s ease;
            }

            textarea {
                width: 100%;
            }

            .input-container {
                width: 650px;
                max-width: 100%;
                margin: 20px auto 25px auto;
            }

            .submit-btn {
                float: right;
                padding: 7px 35px;
                border-radius: 60px;
                display: inline-block;
                background-color: #4b8cfb;
                color: white;
                font-size: 18px;
                cursor: pointer;
                box-shadow: 0 2px 5px 0 rgba(0,0,0,0.06),
                    0 2px 10px 0 rgba(0,0,0,0.07);
                -webkit-transition: all 300ms ease;
                transition: all 300ms ease;
            }

            .submit-btn:hover {
                transform: translateY(1px);
                box-shadow: 0 1px 1px 0 rgba(0,0,0,0.10),
                    0 1px 1px 0 rgba(0,0,0,0.09);
            }

            @media (max-width: 768px) {
                .submit-btn {
                    width:100%;
                    float: none;
                    text-align:center;
                }
            }

            input[type=checkbox] + label {
                color: #ccc;
                font-style: italic;
            }

            input[type=checkbox]:checked + label {
                color: #f00;
                font-style: normal;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1>contact us</h1>
            </div>
            <div class="row">
                <h4 style="text-align:center">We'd love to hear from you!</h4>
            </div>
            <form id="contactForm">
                <div class="row input-container">
                    <div class="col-xs-12">
                        <label>Name</label>
                        <div class="styled-input wide">
                            <input type="text" id="name" name="name" required/>

                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <label>Email</label> 
                        <div class="styled-input">
                            <input type="text" id="email" name="email" required/>

                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <label>Subject</label> 
                        <div class="styled-input"  style="float:right;">
                            <input type="text" id="subject" name="subject" required/>

                        </div>
                    </div>
                    <div class="col-xs-12">
                        <label>Message</label>
                        <div class="styled-input wide">
                            <textarea id="message" name="message" required></textarea>

                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="btn-lrg submit-btn" onclick="return contactus()">Send Message</div>
                    </div>
                </div>
            </form>
        </div>

        <div id="contactAjax" type="hidden">

        </div>
        <script src="js/index.js"></script>
    </body>
</html>