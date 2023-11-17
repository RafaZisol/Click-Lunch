/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import conexion.Conexion;
import entidades.Comidas;
import entidades.Pedido;
import entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class PedidoDAO {
    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn= new Conexion();
    
    public List visSaldo(){
    String sql="select * from pedido where estado='saldo'";
    Pedido ped;
    ArrayList<Pedido> list=new ArrayList();
    try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                ped=new Pedido(
                rs.getInt("id_pedido"),
                rs.getInt("no_cuenta"),
                rs.getFloat("total"),
                rs.getString("estado"),
                rs.getString("fecha"),
                rs.getString("hora")
                );
                list.add(ped);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
            return null;
        }
        return list;
    }
    
    
    public List visualizar_pedidos() throws SQLException{
    String sql="select * from pedido where estado!='saldo' and estado!='cancelado'";
    Pedido ped;
    ArrayList<Pedido> list=new ArrayList();
    try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                ped=new Pedido(
                rs.getInt("id_pedido"),
                rs.getInt("no_cuenta"),
                rs.getFloat("total"),
                rs.getString("estado"),
                rs.getString("fecha"),
                rs.getString("hora")
                );
                list.add(ped);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
            con.close();
            return null;
        }
        con.close();
        return list;
    }
    public List visualizar_pedidos_vista_cliente(int no_cuenta){
    String sql="select * from pedido where no_cuenta="+no_cuenta+" and estado!='saldo';";
    Pedido ped;
    ArrayList<Pedido> list=new ArrayList();
    try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
               ped =new Pedido(
               rs.getInt("id_pedido"),
                rs.getInt("no_cuenta"),
                rs.getFloat("total"),
                rs.getString("estado"),
                rs.getString("fecha"),
                rs.getString("hora")
               );
                
                list.add(ped);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
            return null;
        }
        return list;
    }
    public boolean cambiar_stock(String estado, int id){
        String sql="  UPDATE pedido SET estado = '"+estado+"' WHERE id_pedido = "+id+";";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error "+e);
            return false;
        }
    return true;    
    }
    public int id(){
    int no_cuenta=0;
    String sql="select id_pedido from pedido";
        try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                
             if(rs.getInt("id_pedido")>=no_cuenta){
             no_cuenta=rs.getInt("id_pedido");
             }
            }
     } catch (Exception e) {
            System.err.println("Error"+e);
            return -1;
        }
    return no_cuenta+1;
    }
    public boolean pedir(Cliente usu, String hora, String fecha, int id, float total)
    {
    String sql="insert into pedido values("+id+",'"+fecha+"','"+hora+"',"+usu.getNo_cuenta()+","+total+",'hecho')";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
            return false;
        }   
        
        return true;
    }
    public boolean pedirS(Cliente usu, String hora, String fecha, int id, float total){
    String sql="insert into pedido values("+id+",'"+fecha+"','"+hora+"',"+usu.getNo_cuenta()+","+total+",'saldo')";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
            return false;
        }   
        
        return true;
    }
    public boolean eliminarPedido(int id_pedido){
    String sql="delete from pedido where id_pedido="+id_pedido+";";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
            return false;
        }   
        return true;
    }
    
}
