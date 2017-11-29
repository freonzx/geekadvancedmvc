/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import cart.ShoppingCart;
import entidade.Categoria;
import entidade.Produto;
import java.io.IOException;
import java.util.Collection;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.CategoriaFacade;
import session.ClienteFacade;
import session.OrderManager;
import session.ProdutoFacade;

/**
 *
 * @author root
 */
@WebServlet(name = "ControladorServlet",
        loadOnStartup = 1,
        urlPatterns = {"/categoria",
            "/addCarrinho",
            "/verCarrinho",
            "/updateCarrinho",
            "/checkout",
            "/comprar"})
public class ControladorServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB
    private CategoriaFacade categoryFacade;
    @EJB
    private ProdutoFacade productFacade;
    @EJB
    private OrderManager orderManager;
    @EJB
    private ClienteFacade clienteFacade;

    @Override
    public void init() throws ServletException {

        // Guarda lista de categorias no servlet
        getServletContext().setAttribute("categorias", categoryFacade.findAll());
        getServletContext().setAttribute("clientes", clienteFacade.findAll());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();

        // lida com o request da categoria
        if (userPath.equals("/categoria")) {
            String categoriaId = request.getQueryString();

            if (categoriaId != null) {
                // pega categoria selecionada
                Categoria selectedCategory = categoryFacade.find(Short.parseShort(categoriaId));

                request.setAttribute("selectedCategory", selectedCategory);
                //Buscar produtos da categoria selecionada
                Collection<Produto> categoryProducts = selectedCategory.getProdutoCollection();
                request.setAttribute("categoryProducts", categoryProducts);
            }

            // if cart page is requested
        } else if (userPath.equals("/verCarrinho")) {
            String clear = request.getParameter("clear");

            if ((clear != null) && clear.equals("true")) {

                ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                cart.clear();
            }

            userPath = "/carrinho";

            // if checkout page is requested
        } else if (userPath.equals("/checkout")) {
            // TODO: Implement checkout page request

            // if user switches language
        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        // if addToCart action is called
        if (userPath.equals("/addCarrinho")) {
            if (cart == null) {

                cart = new ShoppingCart();
                session.setAttribute("cart", cart);
            }

            // get user input from request
            String productId = request.getParameter("productId");

            if (!productId.isEmpty()) {

                Produto product = productFacade.find(Integer.parseInt(productId));
                cart.addItem(product);
            }

            userPath = "/categoria";

            // if updateCart action is called
        } else if (userPath.equals("/updateCarrinho")) {
            // get input from request
            String productId = request.getParameter("productId");
            String quantity = request.getParameter("quantity");

            Produto product = productFacade.find(Integer.parseInt(productId));
            cart.update(product, quantity);

            userPath = "/carrinho";

            // se a ação de compra for chamada
        } else if (userPath.equals("/comprar")) {

            if (cart != null) {

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String cityRegion = request.getParameter("cityRegion");
                String ccNumber = request.getParameter("creditcard");
                String tipocompra = request.getParameter("tipocompra");
                int orderId = orderManager.placeOrder(name, email, phone, address, cityRegion, ccNumber, cart, tipocompra);
                
                if (orderId != 0) {

                        // dissociate shopping cart from session
                        cart = null;

                        // end session
                        session.invalidate();

                        // get order details
                        Map orderMap = orderManager.getOrderDetails(orderId);

                        // place order details in request scope
                        request.setAttribute("customer", orderMap.get("customer"));
                        request.setAttribute("products", orderMap.get("products"));
                        request.setAttribute("orderRecord", orderMap.get("orderRecord"));
                        request.setAttribute("orderedProducts", orderMap.get("orderedProducts"));

                        userPath = "/confirmation";

                    // otherwise, send back to checkout page and display error
                    } else {
                        userPath = "/checkout";
                        request.setAttribute("orderFailureFlag", true);
                    }
            }
        }

        // RequestDispatcher para encaminhar o pedido internamente
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
