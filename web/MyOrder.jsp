<%@page import="java.io.*"%>

<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="com.mongodb.*"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.client.MongoCursor"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <script src="Bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">

        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

         <script>
            function loginFirst(){
                alert("You need to login first");
            }
            
            function noRecord(){
                alert("You don't have any record");
            }
        </script>
    </head>
    <body>  
        <div class="navbar">
            <ul>
                <li><img src="images/dailyMed.png" alt="Loading..." class="Logo"></li>
                <li><a href="index.html">Home</a></li>
                <li><a href="Login.html">Login</a></li>
                <li><a href="Store.html">Store</a></li>
                <li><a href="contact.html">Contact Us</a></li>
                <li><a href="MyOrder.jsp">My Orders</a></li>
            </ul>
        </div>

    <center>
        <table style="border: 3px solid black; margin: 20px;">
            <thead style="border: 3px solid black;">
                <tr style="border: 3px solid black;">
                    <th style="border: 3px solid black;">Email ID</th>
                    <th style="border: 3px solid black;">Medicine</th>
                    <th style="border: 3px solid black;">Quantity</th>
                    <th style="border: 3px solid black;">Total Cost</th>
                </tr>
            </thead>
            <tbody>
        <%
           try{
                String username=(String)session.getAttribute("email");
                
                if(username!=null){
                    MongoClient mongoClient = new MongoClient("localhost", 27017);
                    MongoDatabase db = mongoClient.getDatabase("Project");
                    MongoCollection<Document> col = db.getCollection("MyOrders");
                    BasicDBObject query=new BasicDBObject();
                    query.put("Email ID", username);

                    FindIterable<Document> iterDoc=col.find(query);
                    MongoCursor<Document> it=iterDoc.iterator();

                    if(it.hasNext()){
                        while(it.hasNext()){
                            Document doc=(Document) it.next();

                            String email=doc.getString("Email ID");
                            String medicine=doc.getString("Medicine");
                            String quantity=doc.getString("Quantity");
                            String cost=doc.getString("Total Cost");
                            
                            out.println("<tr style=\"border: 3px solid black;\">"
                                        + "<td style=\"border: 3px solid black;\">" + email + "</td>"
                                        + "<td style=\"border: 3px solid black;\">" + medicine + "</td>"
                                        + "<td style=\"border: 3px solid black;\">" + quantity + "</td>"
                                        + "<td style=\"border: 3px solid black;\">" + cost + "</td>"
                                        + "</tr>");
                        }
                    }
                    else{

                        out.println("<script type=\"text/javascript\">");
                        out.println("noRecord();");
                        out.println("</script>");
                    }
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("loginFirst()");
                    out.println("</script>");
                    response.sendRedirect("Login.html");
                }
            }
           catch(Exception e){
               
            }
        %>
            </tbody>
        </table>
    </center>
        <div class="site-section bg-secondary bg-image" style="background-image: url('images/bg_2.jpg');">
            <div class="container">
                <div class="row align-items-stretch">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <a href="#" class="banner-1 h-100 d-flex" style="background-image: url('images/bg_1.jpg');">
                            <div class="banner-1-inner align-self-center">
                                <h2>Pharma Products</h2>
                                <p>You name it and we have it all.</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <a href="#" class="banner-1 h-100 d-flex" style="background-image: url('images/bg_2.jpg');">
                            <div class="banner-1-inner ml-auto  align-self-center">
                                <h2>Rated by Experts</h2>
                                <p>DailyMed provides best quality medicines with fastest delivery services at a very reasonable price.</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <footer class="site-footer" style="margin-bottom: -73px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-3 mb-4 mb-lg-0"  >
                        <div class="block-7">
                            <h3 class="footer-heading mb-4">About Us</h3>
                            <p><strong>DailyMed was built in 2022. It was built with ambition to provide everyone with low cost medicines
                                    and make medicine available to local masses who are unable to purchase it due to their high costs. 
                                    It also provides shipping 
                                    free of cost.</strong></p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3" style="margin-left:300px;">
                        <div class="block-5 mb-5">
                            <h3 class="footer-heading mb-4">Contact Info</h3>
                            <ul class="list-unstyled">
                                <li class="address">Khatra Mahal, Andher galli, Shamshan ghat ke saamne</li>
                                <li class="phone"><a href="tel://23923929210">+91 8303089988</a></li>
                                <li class="email">aniket@bhavans.ac.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row pt-5 mt-5 text-center">
                    <div class="col-md-12">
                        <p>
                            Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script> All rights reserved 
                            by <a href="https://dailyMed.com" target="_blank" class="text-primary">DailyMed</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>


        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>


        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <script src="js/plugin.js"></script>
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/owl.carousel.js"></script>
        <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    </body>
</html>