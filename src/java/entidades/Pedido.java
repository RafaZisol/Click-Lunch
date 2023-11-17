/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;
public class Pedido {
    private int id_pedido;
    private int no_cuenta;
    private float precio;
    private String estado;
    private String fecha;
    private String hora;
    public Pedido() {
    }
    
    public Pedido(int id_pedido, int no_cuenta, float precio, String estado, String fecha,String hora) {
        this.id_pedido = id_pedido;
        this.no_cuenta = no_cuenta;
        this.precio = precio;
        this.estado = estado;
        this.fecha = fecha;
        this.hora=hora;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getNo_cuenta() {
        return no_cuenta;
    }

    public void setNo_cuenta(int no_cuenta) {
        this.no_cuenta = no_cuenta;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
}
