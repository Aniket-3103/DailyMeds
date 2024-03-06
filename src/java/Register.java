import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import com.mongodb.MongoClient;
import jakarta.servlet.RequestDispatcher;


public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
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
            out.println("Record inserted successfully");
            
            RequestDispatcher rd=request.getRequestDispatcher("Login.html");
            rd.forward(request,response);
            response.sendRedirect("Login.html");  
            
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
       processRequest(request, response); 
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
       processRequest(request, response); 
    }
    
    @Override
    public String getServletInfo(){
        return "Short description";
    }
}


