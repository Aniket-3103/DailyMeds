<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="jakarta.servlet.http.*"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SYCS27 ANIKET MISHRA</title>
        <script type="text/javascript">
            function fun(){
                alert("Your purchase has been successful!!!");
            }
            function loginFirst(){
                alert("You need to login to purchase this item");
            }
        </script>
    </head>
    <body>
        
        <%
           try{
                    //Fetching data from the webpage
                    String username=(String)session.getAttribute("email");
                    if(username!=null){
                      String medicine="Ampicillin";
                      int quantity=Integer.valueOf(request.getParameter("quantity"));
                      int Price=quantity*110;
                      String price=Integer.toString(Price);

                      //Creating a mongo Client
                      MongoClient mongo=new MongoClient("localhost", 27017);

                      //Accessing the database
                      MongoDatabase database=mongo.getDatabase("Project");

                      //Retrieving the collection
                      MongoCollection<Document> collection = database.getCollection("My Orders");

                      //Creating the document with values fetched from the database
                      Document document=new Document("Email ID",username)
                              .append("Medicine", medicine)
                              .append("Quantity", quantity)
                              .append("Total Cost", price);

                      //Inserting the document in collection
                      collection.insertOne(document);
                      
                      out.println("<script type=\"text/javascript\">");
                      out.println("fun()");
                      out.println("</script>");
                    }
                    else{
                      out.println("<script type=\"text/javascript\">");
                      out.println("loginFirst()");
                      out.println("</script>");
                    }
                    
              }
              catch(Exception e){
                  System.out.print(e);
              } 
        %>
          
        <%   
          out.println("<meta http-equiv='refresh' content='0.1;URL=Store.html'>");
        %>
    </body>
</html>
