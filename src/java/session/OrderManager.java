/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import cart.ShoppingCart;
import cart.ShoppingCartItem;
import entidade.Cliente;
import entidade.ClientePedido;
import entidade.OrderedProduto;
import entidade.OrderedProdutoPK;
import entidade.Produto;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author root
 */
@Stateless
public class OrderManager {
    
    @PersistenceContext(unitName = "GeekAdvancedPU")
    private EntityManager em;
    
    @Resource
    private SessionContext context;
    @EJB
    private ProdutoFacade productFacade;
    @EJB
    private ClientePedidoFacade customerOrderFacade;
    @EJB
    private OrderedProdutoFacade orderedProductFacade;

    public int placeOrder(String name, String email, String phone, String address, String cityRegion, String ccNumber, ShoppingCart cart, String tipocompra) {
        Cliente customer = addCustomer(name, email, phone, address, cityRegion, ccNumber);
        ClientePedido order = addOrder(customer, cart, tipocompra);
        addOrderedItems(order, cart);

        return order.getId();
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    private Cliente addCustomer(String name, String email, String phone, String address, String cityRegion, String ccNumber) {
        Cliente customer = new Cliente();
        customer.setName(name);
        customer.setEmail(email);
        customer.setTelefone(phone);
        customer.setEndereco(address);
        customer.setCidade(cityRegion);
        customer.setCcNumero(ccNumber);
        
        
        em.persist(customer);

        return customer;
    }

    private ClientePedido addOrder(Cliente customer, ShoppingCart cart, String tipocompra) {
        ClientePedido order = new ClientePedido();
        order.setClienteId(customer);
        if(tipocompra.equals("avista")){
            order.setQuantidade(BigDecimal.valueOf(cart.getSubtotal()*0.90));
        }else{
            order.setQuantidade(BigDecimal.valueOf(cart.getSubtotal()));
        }
        

        // create confirmation number
        Random random = new Random();
        int i = random.nextInt(999999999);
        order.setConfirmationNumber(i);

        em.persist(order);
        
        return order;
    }

    private void addOrderedItems(ClientePedido order, ShoppingCart cart) {
        em.flush();
        
        List<ShoppingCartItem> items = cart.getItems();


        // iterate through shopping cart and create OrderedProducts
        for (ShoppingCartItem scItem : items) {

            int productId = scItem.getProduto().getId();

            // set up primary key object
            OrderedProdutoPK orderedProductPK = new OrderedProdutoPK();
            orderedProductPK.setClientePedidoId(order.getId());
            orderedProductPK.setProdutoId(productId);

            // create ordered item using PK object
            OrderedProduto orderedItem = new OrderedProduto(orderedProductPK);

            // set quantity
            orderedItem.setQuantity(scItem.getQuantity());
            
            em.persist(orderedItem);
        }
    }
    
    public Map getOrderDetails(int orderId) {

        Map orderMap = new HashMap();

        // get order
        ClientePedido order = customerOrderFacade.find(orderId);

        // get customer
        Cliente customer = order.getClienteId();

        // get all ordered products
        List<OrderedProduto> orderedProducts = orderedProductFacade.findByOrderId(orderId);

        // get product details for ordered items
        List<Produto> products = new ArrayList<Produto>();

        for (OrderedProduto op : orderedProducts) {

            Produto p = (Produto) productFacade.find(op.getOrderedProdutoPK().getProdutoId());
            products.add(p);
        }

        // add each item to orderMap
        orderMap.put("orderRecord", order);
        orderMap.put("customer", customer);
        orderMap.put("orderedProducts", orderedProducts);
        orderMap.put("products", products);

        return orderMap;
    }
}
