/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package connection;
import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author Manjit Singh
 */
public class connect {
    Connection con=null;
    public static Connection javaconnect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql:///ai","root","jack");
            return con;
        }
        catch(ClassNotFoundException e){
            JOptionPane.showMessageDialog(null, e);
            return null;
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }

}
