/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Session;

import Entity.User;
import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author LENOVO
 */
@Stateless
public class UserFacade extends AbstractFacade<User> implements UserFacadeLocal {

    @PersistenceContext(unitName = "DEFAULT_PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    public User getUserByLoginPassword(String login,String password) {

		User user=null;
		List<User> users =em.createQuery("SELECT u FROM User u WHERE  u.login ='"+login+"'  and u.password ='"+password+"'").getResultList();
		for (Iterator iter = users.iterator(); iter.hasNext();) 
		{
			// récupérer l'utilisateur trouvé par son login  et son mot de passe
			 user = (User) iter.next();					
		}
		
		return user;
		
	}
}
