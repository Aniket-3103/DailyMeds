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
        <title>SYCS27 ANIKET MISHRA</title>
    </head>
    <body>
        <%
            try{
                      //Fetching data from the webpage
                      String name=request.getParameter("name");
                      String email=request.getParameter("emailID");
                      String phone=request.getParameter("phone");
                      String password=request.getParameter("password");
                      String gender=request.getParameter("gender");

                      //Creating a mongo Client
                      MongoClient mongo=new MongoClient("localhost", 27017);

                      //Accessing the database
                      MongoDatabase database=mongo.getDatabase("Project");

                      //Retrieving the collection
                      MongoCollection<Document> collection = database.getCollection("User");

                      //Creating the document with values fetched from the database
                      Document document=new Document("Name",name)
                              .append("Email ID", email)
                              .append("Phone Number", phone)
                              .append("Password", password)
                              .append("Gender", gender);

                      //Inserting the document in collection
                      collection.insertOne(document);

                      out.println("Insertion successful");
              }
              catch(Exception e){
                  System.out.print(e);
              }
        %>
    </body>
</html>
