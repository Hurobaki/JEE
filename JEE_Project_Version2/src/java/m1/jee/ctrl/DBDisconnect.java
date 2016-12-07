/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m1.jee.ctrl;

import java.sql.SQLException;


/**
 *
 * @author Theo
 */
public class DBDisconnect {
    
        public static void dbDisconnect()
        {
            try
            {
                if(DBConnection.getConn() != null)
                    DBConnection.getConn().close();
                if(DBConnection.getRs() != null)
                    DBConnection.getRs().close();
                if(DBConnection.getSt() != null)
                    DBConnection.getSt().close();
            }
            catch(SQLException e)
            {
                System.out.println(e.getMessage());
            }
        }
        

}
