/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m1.jee.ctrl;

import java.sql.*;
import static m1.jee.ctrl.DBConstants.*;

public class DBConnection {
    private static Connection conn = null;
    private static Statement st = null;
    private static ResultSet rs = null;
    
    /**
     *
     */
    public static void dbConnect()
    {
        try
        {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
            st = getConn().createStatement();
        }
        catch(ClassNotFoundException | SQLException e)
        {
            System.out.println("Error"+ e.getMessage());
        }
    }
    
    
    
    public static ResultSet selectData(String sql) throws SQLException
    {
        rs = getSt().executeQuery(sql);
        return getRs();
    }
    
    public static int insertData(String sql) throws SQLException
    {
        int i = getSt().executeUpdate(sql);
        return i;
    }
    
    public static int deleteData(String sql) throws SQLException
    {
        int i = getSt().executeUpdate(sql);
        return i;
    }

    /**
     * @return the conn
     */
    public static Connection getConn() {
        return conn;
    }

    /**
     * @return the st
     */
    public static Statement getSt() {
        return st;
    }

    /**
     * @return the rs
     */
    public static ResultSet getRs() {
        return rs;
    }
}
