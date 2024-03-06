<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="jakarta.servlet.http.*"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="com.mongodb.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                      //Fetching data from the webpage
                      String fname=request.getParameter("c_fname");
                      String email=request.getParameter("c_email");
                      String lname=request.getParameter("c_lname");
                      String subject=request.getParameter("c_subject");
                      String message=request.getParameter("c_message");

                      //Creating a mongo Client
                      MongoClient mongo=new MongoClient("localhost", 27017);

                      //Accessing the database
                      MongoDatabase database=mongo.getDatabase("Project");

                      //Retrieving the collection
                      MongoCollection<Document> collection = database.getCollection("Contact");

                      //Creating the document with values fetched from the database
                      Document document=new Document("First Name",fname)
                              .append("Last Name", lname)
                              .append("Email ID", email)
                              .append("Subject", subject)
                              .append("Message", message);

                      //Inserting the document in collection
                      collection.insertOne(document);

                      response.sendRedirect("Thanks.html");
                      
              }
              catch(Exception e){
                  System.out.print(e);
              }
        %>
    </body>
</html>
