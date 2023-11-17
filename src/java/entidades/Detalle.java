/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

public class Detalle {
 private int id_detalle;
 private int id_comida;
 private int id_pedido;
 private int cantidad;
 private String nombre;
 private float precio;

    public Detalle(int id_comida, int cantidad, String nombre, float precio) {
        this.id_comida = id_comida;
        this.cantidad = cantidad;
        this.nombre = nombre;
        this.precio = precio;
    }

    public Detalle(int id_comida, int id_pedido, int cantidad) {
        this.id_comida = id_comida;
        this.id_pedido = id_pedido;
        this.cantidad = cantidad;
    }


  

    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }

    public int getId_comida() {
        return id_comida;
    }

    public void setId_comida(int id_comida) {
        this.id_comida = id_comida;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    public String toString(){
    return this.id_comida+" "+this.cantidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
}
