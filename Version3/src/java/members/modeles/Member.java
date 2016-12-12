/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package members.modeles;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Chocobouc
 */
@Entity
public class Member implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String firstName;
    private String name;
    private String telhome;
    private String telmob;
    private String telpro;
    private String adress;
    private String postalCode;
    private String city;
    private String email;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Member(){}

    public Member(String firstName, String name, String telhome, String telmob, String telpro, String adress, String postalCode, String city, String email) {
        this.firstName = firstName;
        this.name = name;
        this.telhome = telhome;
        this.telmob = telmob;
        this.telpro = telpro;
        this.adress = adress;
        this.postalCode = postalCode;
        this.city = city;
        this.email = email;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelhome() {
        return telhome;
    }

    public void setTelhome(String telhome) {
        this.telhome = telhome;
    }

    public String getTelmob() {
        return telmob;
    }

    public void setTelmob(String telmob) {
        this.telmob = telmob;
    }

    public String getTelpro() {
        return telpro;
    }

    public void setTelpro(String telpro) {
        this.telpro = telpro;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    } 
}