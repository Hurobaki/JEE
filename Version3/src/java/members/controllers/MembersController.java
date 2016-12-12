/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package members.controllers;

import java.util.ArrayList;
import javax.ejb.Stateless;

import java.util.Collection;  
import javax.ejb.Stateless;  
import javax.persistence.EntityManager;  
import javax.persistence.PersistenceContext;  
import javax.persistence.Query;  
import members.modeles.Member;  
  
@Stateless  
public class MembersController {  
    // Ici injection de code : on n'initialise pas. L'entity manager sera créé  
    // à partir du contenu de persistence.xml  
    @PersistenceContext  
    private EntityManager em;  
  
    public void createMembers() {  
        createMember("Simpson","Homer","0123456789","0612345678","0698765432","2 avenue Duff","92700","Colombes","hsimpson@gmail.com");
        createMember("Simpson","Bart","0145362787","0645362718","0611563477","10 rue des Rebelles","92270","Bois-colombes","bsimpson@gmail.com");
        createMember("Lagaffe","Gaston","0187665987","0623334256","0654778654","65 rue de la Paresse","92700","Colombes","glagaffe@yahoo.fr");
        createMember("Mafalda","Querida","0187611987","0783334256","0658878654","6 rue de Buenos Aires","75016","Paris","qmafalda@hotmail.ar");
        createMember("Woodpecker","Woody","0187384987","0622494256","0674178654","5 bvd des Picoreurs","21000","Dijon","woody@mail.co.uk");
        createMember("Brown","Charlie","0122456678","0699854673","0623445166","140 avenue Foche","90000","Nanterre","cbrown@live.com");  
    }  
  
    public Member createMember(String firstName, String lastName, String home, String mobile, String office, String adress, String postCode, String city, String email) {  
        Member m = new Member(firstName, lastName, home, mobile, office, adress, postCode, city, email);  
        em.persist(m);  
        return m;  
    }
    
    public void removeMember(String id)
    {
        int i = Integer.parseInt(id);
        Member m =em.find(Member.class, i);
        em.remove(m);
    }
    
    public Collection<Member> getSelectedMembers(String[] id)
    {
        Collection<Member> members = new ArrayList<>();
        for (String s : id)
        {
            int i = Integer.parseInt(s);
            members.add(em.find(Member.class, i));
        }
        return members;
    }

    public Collection<Member> getAllMembers() {  
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select m from Member m");  
        return q.getResultList();  
    }  
    // Add business logic below. (Right-click in editor and choose  
    // "Insert Code > Add Business Method")  
}  