/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.resetpassword;
import services.*;
import bean.AIbean;
/**
 *
 * @author Manjit Singh
 */
@WebServlet("/AdEmailSendingServlet")
public class AdEmailSendingServlet extends HttpServlet {
        private String host;
    private String port;
    private String user;
    private String pass;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdAIservices obj=new AdAIservices();
        AIbean objbean=new AIbean();
        int passwordSize=6;
        resetpassword reset=new resetpassword(passwordSize);
        char[] resetpass=reset.get();
        String restpas=String.valueOf(resetpass);
        String userid=request.getParameter("userid");
        objbean=obj.showdata(userid);
        String recipient = objbean.getEmail();
        String subject = "Reset password";
        String content = "Password is successfully reset your reset password is : "+restpas+"";
        
        String resultMessage = "";
        try {
            /* TODO output your page here. You may use following sample code. */
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,content);
            String output=obj.forgot(userid, restpas);
            System.out.println(output);
            resultMessage = "The reset password e-mail sent successfully";
        } 
        catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: username does not match " + ex.getMessage();
        }
        finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/AdResetpass.jsp").forward(request, response);
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
