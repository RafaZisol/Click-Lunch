/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import conexion.Conexion;
import entidades.Cliente;
import entidades.Comidas;
import entidades.Detalle;
import entidades.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DetalleDAO {

    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn= new Conexion();
    
    
    public List visualizar_detalle(int no_cuenta) throws SQLException{
    String sql="select * from detalle where pedido_id="+no_cuenta+";";
    Detalle det;
    ArrayList<Detalle> list=new ArrayList();
    try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                det=new Detalle(
                        rs.getInt("producto_id"),
                        rs.getInt("pedido_id"),
                        rs.getInt("cantidad")
                );
                list.add(det);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
            con.close();
            return null;
        }
        con.close();
        return list;
    }
   
    public int id() throws SQLException{
    int no_cuenta=0;
    String sql="select pedido_id from pedido";
        try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                
             if(rs.getInt("pedido_id")>=no_cuenta){
             no_cuenta=rs.getInt("pedido_id");
             }
            }
     } catch (Exception e) {
            System.err.println("Error"+e);
            con.close();
            return -1;
        }
        con.close();
    return no_cuenta+1;
    }
    
    public boolean pedir(int id,int id_pedido, int cantidad) throws SQLException
    {
    String sql = "INSERT INTO detalle (pedido_id, producto_id, cantidad) VALUES ('"+id_pedido+"','"+id+"','"+cantidad+"')";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }   
        con.close();
        return false;
    }
    
    public boolean eliminarDetalle(int id_pedido) throws SQLException{
    String sql="delete from detalle where pedido_id="+id_pedido+";";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        con.close();
        return false;
    }
    
    public float buscar(int id_pedido) throws SQLException
    {
    float total=0;
    String sql="select * from pedido where id_pedido="+id_pedido+";";
    try{
    con=cn.getConnection();
    st=con.createStatement();
    rs=st.executeQuery(sql);
    while(rs.next()){
        con.close();
    return rs.getFloat("total");
    }
    }
    catch(Exception e){
            System.err.println("Error"+e);
            con.close();
            return -1;
        }  
    return total;
    }
}