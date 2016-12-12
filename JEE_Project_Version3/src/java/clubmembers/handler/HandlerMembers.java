/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clubmembers.handler;

import clubmembers.model.Clubmember;
import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Theo
 */
@Stateless
public class HandlerMembers {

    @PersistenceContext
    private EntityManager em;
    
    public void createClubTest()
    {
        /*createClubMember("Jean", "Paul","02");
        createClubMember("Jean", "Michel","02");*/
    }
    
    public Clubmember createClubMember(String firstname, String lastname, String telhome,String telmob, String telpro, String address, String postal, String city, String email)
    {
        Clubmember member = new Clubmember(firstname, lastname, telhome, telmob, telpro, address, postal, city, email);
        em.persist(member);
        return member;
    }
    
    public Collection<Clubmember> getAllMembers()
    {
        Query q = em.createQuery("SELECT m FROM Clubmember m ");
        return q.getResultList();
    }
}
