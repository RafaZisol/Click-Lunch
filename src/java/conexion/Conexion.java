/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
        Connection con;
       public Conexion() {
            try {
                String dbDriver = "com.mysql.jdbc.Driver";
                String dbURL = "jdbc:mysql://buhcbq5usrfejafgbi3f-mysql.services.clever-cloud.com:3306/";
                // Database name to accessline
                String dbName = "buhcbq5usrfejafgbi3f";
                String dbUsername = "u5tushrmfovflkmk";
                String dbPassword = "KlJSy6VOMQANO5OcetkV";
                
                Class.forName(dbDriver).newInstance();
                con = DriverManager.getConnection(dbURL + dbName,
                        dbUsername,
                        dbPassword);
                System.out.println("se conecto");
            } catch (Exception e ) {
                System.err.println("Error"+e);
            }
        
        }
       public Connection getConnection(){
           return con;
       }
}

///
///mysql> create table extras(
   /// -> bebida varchar(30) not null,
   // -> pasta varchar(30) not null,
    //-> costo_bebida float not null,
    //-> costo_pasta float not null);
