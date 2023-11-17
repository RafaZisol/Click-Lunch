/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import conexion.Conexion;
import entidades.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class ClienteDAO {
    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Conexion cn;

    public List imprimir() throws SQLException{
    Cliente usu=new Cliente();
    ArrayList<Cliente> list= new ArrayList<>();
        String sql="select * from cliente";
        try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                usu.setNombre(rs.getString("nombre"));
                usu.setCorreo(rs.getString("correo"));
                usu.setContraseña(rs.getString("contraseña"));
                list.add(usu);
            }
        } catch (Exception e) {
            System.err.println("Error"+e);
            return null;
        }
        con.close();
        return list;
    }
    public boolean registrar(Cliente usu) throws SQLException{
    String sql="insert into cliente values('"+usu.getNo_cuenta()+"','"+usu.getNombre()+"','"+usu.getCorreo()+"','"+usu.getContraseña()+"','"+usu.getSaldo()+"')";
    try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
            System.out.println("");
            con.close();
            return false;
        }
        System.out.println("Registro de cliente");
        System.out.println("");
        con.close();
        return true;
    }
    
    public Cliente login(String correo, String contraseña) throws SQLException{
        cn= new Conexion();
        String sql="Select * from cliente where correo='"+correo+"';";
    try{
        con=cn.getConnection();
        st=con.createStatement();
        rs=st.executeQuery(sql);
        if(rs.next()){
            if(rs.getString("password").equalsIgnoreCase(contraseña)&& rs.getString("password")!=null){
                Cliente usu=new Cliente(
                rs.getInt("no_cuenta"),
                rs.getString("nombre"),
                rs.getString("correo"),
                rs.getFloat("saldo")
                );
                System.out.println("Inicio de Sesión");
                System.out.println("");
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
    public int no_cuenta() throws SQLException{
    int no_cuenta=(int)(Math.random()*999999+100000);
    String sql="select * from cliente where no_cuenta="+no_cuenta+"";
        try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
                
             if(rs.getInt("no_cuenta")==no_cuenta){
             no_cuenta=(int)(Math.random()*999999+100000);
             }
            }
     } catch (Exception e) {
            System.err.println("Error"+e);
            con.close();
            return -1;
        }
        System.out.println("Numero de cuenta creado");
        con.close();
        return no_cuenta;
    }
    public float buscar(int no_cuenta) throws SQLException{
    String sql="select saldo from cliente where no_cuenta="+no_cuenta+";";
    try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            rs.next();
            System.out.println("Saldo obtenido");
            con.close();
            return rs.getFloat("saldo");
            
        } catch (Exception e) {
            System.err.println("Error"+e);
            con.close();
            return -1;
        }
    }
    public boolean eliminar (int id) throws SQLException{
    String sql="delete from cliente where no_cuenta="+id+";";
        try{
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
            con.close();
            return false;
        }   
        con.close();
    return true;
    }
    public boolean guardar_saldo(float saldo_anterior, float saldo, int no_cuenta) throws SQLException
    {
        float res= saldo_anterior+saldo;
        String sql="UPDATE cliente SET saldo = '"+res+"' WHERE no_cuenta = "+no_cuenta+";";
        try
        {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.execute();
            System.out.println("Saldo actualizado");
            con.close();
            return true;
        }
        catch(Exception e)
        {
            System.out.println("ERROR : "+e);
            con.close();
            return false;
        }

    }
    public boolean restar(int id, float resta) throws SQLException{
        String sql="update cliente set saldo='"+resta+"' where no_cuenta="+id+";";
    try
    {
        con=cn.getConnection();
        ps=con.prepareStatement(sql);
        ps.execute();
    }
    catch(Exception e)
    {
        System.out.println("ERROR : "+e);
        con.close();
        return false;
    }
        System.out.println("Saldo actualizado");
        con.close();
    return true;
    }
    
    public Cliente buscar_o(int id) throws SQLException
    {
        Cliente cli;
    String sql="select * from cliente where no_cuenta="+id+";";
    try {
            con=cn.getConnection();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next()){
            cli=new Cliente(
            rs.getInt("no_cuenta"),
            rs.getString("nombre"),
            rs.getString("correo"),
            rs.getFloat("saldo")
            );
                System.out.println("Cliente encontrado");
                con.close();
            return cli;
    }
            
        } catch (Exception e) {
            System.err.println("Error"+e);
            con.close();
            return null;
        }
    con.close();
    return null;
    }

}
