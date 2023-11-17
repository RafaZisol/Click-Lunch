/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author artem
 */
public class Validacion {
    String num;
    String str;
    
    public int valNum(String num)
    {
        try{
        int numv=Integer.parseInt(num);
            if(numv>0 && numv<5){
    return numv;
            }
            else{
                
            
            }
    
    
        
        } catch(NumberFormatException e){
        
        
        }
    return 1;
    }

}
