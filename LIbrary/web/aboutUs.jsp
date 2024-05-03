<%-- 
    Document   : aboutUs
    Created on : 31 Aug, 2023, 3:03:35 PM
    Author     : njuser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Page</title>
        <style>   
            *{
                margin:0;
                padding: 0;
                box-sizing: border-box;
            }
            .head1{
                font-family: 'Poppins', sans-serif, 'arial';
                font-weight: 600;
                font-size: 50px;
                color: #337ab7;
                text-align: center;
            }
            .abouthead{
                text-align: center;              
                clear: left;
                font-family: 'Roboto', sans-serif, 'arial';
                font-weight: 400;
                font-size: 2.2em;
                color: #9b9b9b;
                line-height: 1.5;
            }
            .ggcolor{
                background-color: #d9d9d9;
            }
            .ab_con{
                display: flex;
                height: auto;
                padding: 15px;
                border-radius: 7px;
                
            }
            #ab_content1{
                
            }
            #ab_content2{
                margin-bottom: 20px;
            }
            .para{
                padding: 10px;
                font-size: medium;
                font-family: sans-serif;
            }
            #list{
                list-style-type: none;
                font-size: medium;
                font-family: sans-serif;
                padding: 5px;
            }
        </style>
    </head>
    <body>
    <body>
        <section>
            <h1 class="head1">About Us</h1>
            <h2 class="abouthead">We're amazing...</h2>
            
            <div class="ab_con ggcolor" id="ab_content1">
                <p class="para">I am convinced that there can be luxury in simplicity. Elegance is not the prerogative of those who have just escaped from adolescence, but of those who have already taken possession of their future. I sometimes feel that a pattern is almost a fashion
                statement in itself. I think the idea of mixing luxury and mass-market fashion is very modern, very now - no one wears head-to-toe designer anymore. You have to always work against what you did before, and even against your taste. </p>
            <p class="para">I always thought what you wore underneath was as important as what you wear on top. All I did my first year at Vogue was Xerox. It's sometimes said that I'm rebellious and I do things to push people's buttons, but I just like the challenge. My learning
                process is by eye alone; it's not at all scientific. We must never confuse elegance with snobbery.
            </p>
            <p class="para">
                I think God is the most fantastic designer. Beauty is perfect in its imperfections, so you just have to go with the imperfections. Being one step ahead of a fashion trend is not so important to me. What matters is to always forge ahead. We have got to
                change our ethics and our financial system and our whole way of understanding the world. It has to be a world in which people live rather than die; a sustainable world. It could be great. Being one step ahead of a fashion trend is not so important
                to me. What matters is to always forge ahead.</p>
            </div>
        </section>
        <section>
            <h2 class="abouthead">More things that you should know...</h2>
            <div class="ab_con ggcolor" id="ab_content2">
                <ul id="list">
                <li>Tropical wrap front essential cut classic sartorial details feminine peplum-style shirt white.</li>
                <li>Leather detail shoulder contrastic colour contour stunning silhouette working peplum.</li>
                <li>Faux real sexy split up the back pockets cut out detail on the front strappy brown paisley print. </li>
                <li>Pocket detail to sides jacquard fabric fully lined notch lapel three-button cuffs contrast stitching classic colar.</li>
            </ul>
            </div>    
        </section>
    </body>
    <!-- Text is from http://fashionipsum.com/ -->
</body>
</html>