/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import entidade.ClientePedido;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author root
 */
@Stateless
public class ClientePedidoFacade extends AbstractFacade<ClientePedido> {

    @PersistenceContext(unitName = "GeekAdvancedPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ClientePedidoFacade() {
        super(ClientePedido.class);
    }
    
}
