/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import conexion.Conexion;
import entidades.Comidas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class ComidaDAO {
    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn= new Conexion();
    
    public List imprimir() throws SQLException{
    ArrayList<Comidas> list= new ArrayList<>();
        String sql="select * from comidas;";
        try {
            Comidas com;

            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                com=new Comidas(
                rs.getInt("id_comidas"),
                rs.getString("nombre"),
                rs.getString("descripcion"),
                rs.getFloat("precio"),
                rs.getInt("stock"),
                rs.getString("tipo"),
                rs.getString("imanesnes")
                );
                list.add(com);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        con.close();
        return list;
    }
    public List imprimirDia() throws SQLException{
    Comidas com;
    ArrayList<Comidas> list= new ArrayList<>();
        String sql="select * from comidas where tipo='dia' and stock>0";
        try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                com=new Comidas();
                com.setId(rs.getInt("id_comidas"));
                com.setNombre(rs.getString("nombre"));
                com.setDescripcion(rs.getString("descripcion"));
                com.setPrecio(rs.getFloat("precio"));
                com.setEstado(rs.getInt("stock"));
                com.setImg(rs.getString("imanesnes"));
                list.add(com);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        con.close();
        return list;
    }
    public List imprimirNormal() throws SQLException{
    Comidas com;
    ArrayList<Comidas> list= new ArrayList<>();
        String sql="select * from comidas where tipo='normal' and stock>0";
        try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                com=new Comidas();
                com.setId(rs.getInt("id_comidas"));
                com.setNombre(rs.getString("nombre"));
                com.setDescripcion(rs.getString("descripcion"));
                com.setPrecio(rs.getFloat("precio"));
                com.setEstado(rs.getInt("stock"));
                com.setImg(rs.getString("imanesnes"));
                list.add(com);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        con.close();
        return list;
    }
    
    public boolean insertar(Comidas com) throws SQLException
    {    
    String sql="insert into comidas values('"+com.getId()+"','"+com.getNombre()+"','"+com.getDescripcion()+"',"+com.getPrecio()+","+com.getEstado()+",'"+com.getImg()+"','"+com.getTipo()+"')";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }   
        System.out.println("Comida nueva");
        con.close();
    return false;
    }
    
    public boolean eliminar (int id) throws SQLException{
    String sql="delete from comidas where id_comidas="+id+";";
        try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }   
        System.out.println("Comida elminada");
        con.close();
    return false;
    }

    public boolean cambiar_stock(int estado, int id) throws SQLException{
        String sql="  UPDATE comidas SET stock = '"+estado+"' WHERE id_comidas = "+id+";";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error "+e);
        }
        System.out.println("stock actualizado");
        con.close();
    return false;    
    }
    
    public String buscar_por_id(int id) throws SQLException{
        String sql="Select nombre from comidas where id_comidas='"+id+"';";
        try{
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            if(rs.next()){
                if(rs.getString("nombre")!=null ){
                    con.close();
                    return rs.getString("nombre");
                }
            }
        }
        catch(Exception e)
        {
            System.out.println("Error: "+e);
        }
        con.close();
    return "ho";
    }
    
    public Comidas buscarss(int id) throws SQLException{
    String sql="Select * from comidas where id_comidas='"+id+"';";
    try{
        con=cn.getConnection();
        st=con.createStatement();
        rs=st.executeQuery(sql);
        if(rs.next()){
        if(rs.getString("nombre")!=null){
            Comidas com=new Comidas(
            rs.getInt("id_comidas"),
            rs.getString("nombre"),
            rs.getString("descripcion"),
            rs.getFloat("precio"),
            rs.getInt("stock"),
            rs.getString("tipo"),
            rs.getString("imanesnes")
            );
            con.close();
            return com; 
        }
        }
    }
    catch(Exception e)
    {
        System.out.println("Error: "+e);
    }
    con.close();
    return null;
    }
    
    public int id() throws SQLException{
    int no_cuenta=0;
    String sql="select id_comidas from comidas";
        try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                
             if(rs.getInt("id_comidas")>=no_cuenta){
             no_cuenta=rs.getInt("id_comidas");
             }
            }
     } catch (Exception e) {
            System.err.println("Error"+e);
        }
        con.close();
    return no_cuenta+1;
    }
    
    public int buscarStock(int id) throws SQLException{
    String sql="select stock from comidas where id_comidas="+id+"";
    try{
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            if(rs.next()){
                if(rs.getString("stock")!=null ){
                    con.close();
                    return rs.getInt("stock");
                }
            }
        }
        catch(Exception e)
        {
            System.out.println("Error: "+e);
        }
    con.close();
    return -1;
    }
}


