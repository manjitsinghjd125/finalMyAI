/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package services;
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
/**
 *
 * @author Manjit Singh
 */
public class AIservices {
    
    public String Auth(AIbean object){
     
         Connection con=null;
      PreparedStatement pst=null;
      ResultSet rs=null;
      String result="";
      try{
          
          con=connect.javaconnect();
          String adu="admin",adpas="admin";
          String u="",pas="";
          String na=object.getUserid();
          String pa=object.getPassword();
         
       
          String sql="select * from users where username=?";
              pst=con.prepareStatement(sql);
              pst.setString(1, object.getUserid());
              rs=pst.executeQuery();
              while(rs.next()){
                  u=rs.getString("username");
                  pas=rs.getString("password");
              
              }
                  if(na.equals(adu))
          {
              if(pa.equals(adpas)){
          result="admin";
              }
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
    public String Admin(AIbean object){
     
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
              return "adminacc";
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
          String sql="select * from usersinfo where username='"+val+"'";
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
      String data="select * from users";
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
     public String updation(AIbean object)
        {
            PreparedStatement pstmt=null;
            Connection conn=null;
            String result="failed to add";
            try
            {
                conn=connect.javaconnect();;
          
                pstmt=conn.prepareStatement("insert into usersinfo(Fname,Lname,Fullname,dob,gender,username,password,address,email,contact) values(?,?,?,?,?,?,?,?,?,?)");
                
                 pstmt.setString(1,object.getFname());
                 pstmt.setString(2,object.getLname());
                 pstmt.setString(3,object.getFname().concat(" "+object.getLname()));
                 pstmt.setString(4,object.getDob());
                 pstmt.setString(5,object.getGender());
                 pstmt.setString(6,object.getUserid());
                 pstmt.setString(7,object.getPassword());
                // pstmt.setString(1,object.get);
                 pstmt.setString(8,object.getAddress());
                 pstmt.setString(9,object.getEmail());
                 //pstmt.setLong(11,object.getPno());
                 long pno;
                pno = Integer.parseInt(object.getPno());
                 pstmt.setLong(10,pno);
                
                 int i=pstmt.executeUpdate();
                 if(i>0)
                 {
                     result="inserted successfully";
                     
                 }
            }
                 catch(Exception e)
                 {
                     System.out.println("addrecord()"+e);
                 }
            finally
            {
                try
                {
                    pstmt.close();
                    conn.close();
                }
                catch(SQLException e)
                {
                    
                }
            }
            return result;
        }
     
     
     public String passupdate(AIbean object,String ur){
         Connection con=null;
      ResultSet rs=null;
         String u="", p="";
         try{
             con=connect.javaconnect();
             String pas=object.getPassword();
          String usr=ur;
          
             
           String sqlp="select * from usersinfo where username=?";
          PreparedStatement st=con.prepareStatement(sqlp);
          st.setString(1, usr);
           rs=st.executeQuery();
              while(rs.next()){
                  u=rs.getString("username");
                  p=rs.getString("password");
              }
              if(usr.equals(u)&&pas.equals(p)){
              
             String sql="update usersinfo set password=? where username=?";
             PreparedStatement pst=con.prepareStatement(sql);
             pst.setString(1, object.getForgotpass());
             pst.setString(2, usr);
             pst.executeUpdate();
             
             String sql1="update users set password=? where username=?";
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
           String sql="update users set password=? where username=?";
         
           con=connect.javaconnect();
          PreparedStatement pst=con.prepareStatement(sql);
          pst.setString(1, pass);
           pst.setString(2, userid);
          pst.executeUpdate();
          String sql1="update usersinfo set password=? where username=?";
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
