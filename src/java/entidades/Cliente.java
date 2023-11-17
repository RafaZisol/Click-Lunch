/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

public class Cliente {
    private int no_cuenta;
    private String nombre;
    private String correo;
    private String contraseña;
    private float saldo;
    public Cliente() {
    }

    public Cliente(int no_cuenta, String nombre, String correo, String contraseña, float saldo) {
        this.no_cuenta = no_cuenta;
        this.nombre = nombre;
        this.correo = correo;
        this.contraseña = contraseña;
        this.saldo = saldo;
    }

    public Cliente(int no_cuenta, String nombre, String correo, float saldo) {
        this.no_cuenta = no_cuenta;
        this.nombre = nombre;
        this.correo = correo;
        this.saldo = saldo;
    }

    

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int getNo_cuenta() {
        return no_cuenta;
    }

    public void setNo_cuenta(int no_cuenta) {
        this.no_cuenta = no_cuenta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    public String toString(){
    return this.nombre+this.correo;
    }

}
