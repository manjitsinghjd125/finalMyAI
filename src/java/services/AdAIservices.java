/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package services;

/**
 *
 * @author Manjit Singh
 */
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import connection.connect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import connection.connect;
import bean.*;
import javax.servlet.http.HttpSession;
import servlet.sessionhandling;
public class AdAIservices {
    public String Auth(AIbean object){
     
         Connection con=null;
      PreparedStatement pst=null;
      ResultSet rs=null;
      String result="";
      try{
          
          con=connect.javaconnect();
         
          String u="",pas="";
          String na=object.getUserid();
          String pa=object.getPassword();
         
       
          String sql="select * from admin where adminid=?";
              pst=con.prepareStatement(sql);
              pst.setString(1, object.getUserid());
              rs=pst.executeQuery();
              while(rs.next()){
                  u=rs.getString("adminid");
                  pas=rs.getString("password");
              
              }
              if(na.equals(u)&&pa.equals(pas)){
              return "welcome";
              }
          
      }
      catch(SQLException e){
          e.getErrorCode();
      }
       finally
        {
            try
            {
                rs.close();
                con.close();
                pst.close();
            }
            catch(SQLException e)
            {

            }
        }
        return result;
       
    }
   
    public AIbean showdata(String val){
      Connection con=null;
      Statement st=null;
      ResultSet rs=null;
      AIbean objAIbean=new AIbean();
      try{
          String sql="select * from admininfo where username='"+val+"'";
      con=connect.javaconnect();
           st=con.createStatement();
           rs=st.executeQuery(sql);
           while(rs.next()){
                objAIbean.setUserid(rs.getString("username"));
                objAIbean.setFname(rs.getString("Fname"));
                objAIbean.setAddress(rs.getString("address"));
                objAIbean.setDob(rs.getString("dob"));
                objAIbean.setGender(rs.getString("gender"));
                objAIbean.setEmail(rs.getString("email"));
                objAIbean.setLname(rs.getString("Lname"));
                objAIbean.setFullname(rs.getString("Fullname"));
                objAIbean.setPno(rs.getString("contact"));
                objAIbean.setPassword(rs.getString("password"));
           
           }
      }  
      catch(Exception e){
           
      }
      finally
        {
            try{
                rs.close();
                st.close();
                con.close();
                
            }
            catch(SQLException ex){
                
            }
        }
      return objAIbean;
    }
     public List getrecord() throws SQLException{
      Connection con=null;
      PreparedStatement pst=null;
      Statement st=null;
      ResultSet rs=null;
      List list=new ArrayList();
      AIbean object;
      String data="select * from admin";
      try{
           con=connect.javaconnect();
           st=con.createStatement();
           rs=pst.executeQuery(data);
           while(rs.next()){
               object=new AIbean();
                object.setUserid(rs.getString("Id"));
                object.setFname(rs.getString("Name"));
                object.setDob(rs.getString("Branch"));
                object.setGender(rs.getString("gender"));
                //object.setPno(rs.getLong("contact"));
                
                list.add(object);
           }
      }
      catch(SQLException e){
          
      }
       finally
        {
            try
            {
                rs.close();
                st.close();
                con.close();
                pst.close();
            }
            catch(SQLException e)
            {

            }
        }
        return list;
    }
     
     
     
     public String passupdate(AIbean object,String ur){
         Connection con=null;
      ResultSet rs=null;
         String u="", p="";
         try{
             con=connect.javaconnect();
             String pas=object.getPassword();
          String usr=ur;
          
             
           String sqlp="select * from admininfo where username=?";
          PreparedStatement st=con.prepareStatement(sqlp);
          st.setString(1, usr);
           rs=st.executeQuery();
              while(rs.next()){
                  u=rs.getString("username");
                  p=rs.getString("password");
              }
              if(usr.equals(u)&&pas.equals(p)){
              
             String sql="update admininfo set password=? where username=?";
             PreparedStatement pst=con.prepareStatement(sql);
             pst.setString(1, object.getForgotpass());
             pst.setString(2, usr);
             pst.executeUpdate();
             
             String sql1="update admin set password=? where adminid=?";
             PreparedStatement pst1=con.prepareStatement(sql1);
             pst1.setString(1, object.getForgotpass());
             pst1.setString(2, usr);
             pst1.executeUpdate();
             return "successful";
         }
         }
         catch(SQLException e){
             e.printStackTrace();
     }
         return "wrong old password";
     }
     public String forgot(String userid,String pass){
       Connection con=null;
        
       String result="unsuccessfull";
       try{
           String sql="update admin set password=? where adminid=?";
         
           con=connect.javaconnect();
          PreparedStatement pst=con.prepareStatement(sql);
          pst.setString(1, pass);
           pst.setString(2, userid);
          pst.executeUpdate();
          String sql1="update admininfo set password=? where username=?";
         PreparedStatement pst1=con.prepareStatement(sql1);
           pst1.setString(1, pass);
         pst1.setString(2, userid);
          int row=pst1.executeUpdate();
          if(row>0){
              result="successfully";
          }
       }
       catch(SQLException ex){
           ex.getMessage();
       }
       return result;
   }
}
