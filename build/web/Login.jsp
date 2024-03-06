<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="com.mongodb.*"%>
<%@page import="com.mongodb.BasicDBObject"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SYCS27 ANIKET MISHRA</title>
        
        <script>
            function loginFirst(){
                alert("Incorrect username and password");
            }
        </script>
        
    </head>
    <body>
        <%
            try{
                String email=request.getParameter("email");
                String password=request.getParameter("pass");

                //Creating a mongo Client
                MongoClient mongo=new MongoClient("localhost", 27017);

                //Accessing the database
                DB database=mongo.getDB("Project");
                
                //Trying to access the collection
                DBCollection collection=database.getCollection("User");
                
                BasicDBObject query=new BasicDBObject();
                query.put("Email ID", email);
                query.put("Password", password);
                
                DBCursor cursor=collection.find(query);
                if(cursor.hasNext()){
                    session.setAttribute("email",email);
                    response.sendRedirect("index.html");
                }
                else{
                        out.println("<script type=\"text/javascript\">");
                        out.println("loginFirst()");
                        out.println("</script>");
                        out.println("<meta http-equiv='refresh' content='0.1;URL=Login.html'>");
                }
            }
            catch(Exception e){
                System.out.println(e);
            }
        %>
    </body>
</html>


