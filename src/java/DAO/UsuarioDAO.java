/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import conexion.Conexion;
import entidades.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UsuarioDAO {
        Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn= new Conexion();
    
    
    public Usuario buscarPorCorreo(String correo, String contraseña) throws SQLException{
        String sql="Select * from caja where correo='"+correo+"';";
    try{
        con=cn.getConnection();
        st=con.createStatement();
        rs=st.executeQuery(sql);
        if(rs.next()){
            if(rs.getString("password").equalsIgnoreCase(contraseña)&& rs.getString("password")!=null){
                Usuario usu=new Usuario(
                rs.getString("correo")
                );
                con.close();
            return usu;
            }            
            else{
            con.close();
                return null;
            }
            
        }
        }catch(Exception e){
            System.err.println("Error"+e);
            con.close();
            return null;
        }
    con.close();
    return null;
    }
}
