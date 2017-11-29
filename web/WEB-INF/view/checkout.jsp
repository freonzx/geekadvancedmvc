<%-- 
    Document   : checkout
    Created on : Nov 23, 2017, 9:51:31 AM
    Author     : root
--%>

<div id="singleColumn">

    <h2>Checkout</h2>

    <p>Para comprar os itens em seu carrinho de compras, forneça-nos as seguintes informações:</p>

    <form action="comprar" method="post">
        <table id="checkoutTable">
            <tr>
                <td><label for="name">Nome:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="name"
                           name="name"
                           value="${param.name}">
                </td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </td>
            </tr>
            <tr>
                <td><label for="phone">Telefone:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="16"
                           id="phone"
                           name="phone"
                           value="${param.phone}">
                </td>
            </tr>
            <tr>
                <td><label for="address">Endereço:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="address"
                           name="address"
                           value="${param.address}">

                    <br>
                    
                </td>
            </tr>
            
            <tr>
                <td><label for="cityRegion">Cidade:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="address"
                           name="cityRegion"
                           value="${param.cityRegion}">

                    <br>
                    
                </td>
            </tr>
            
            <tr>
                <td><label for="creditcard">Número de Cartão de Crédito:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="19"
                           id="creditcard"
                           name="creditcard"
                           value="${param.creditcard}">
                    <input type="radio" name="tipocompra" value="avista"> A Vista<br>
                    <input type="radio" name="tipocompra" value="parcelado"> Parcelado<br>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Confirmar Compra">
                </td>
            </tr>
        </table>
    </form>

    <div id="infoBox">

        <ul>
            <li>Entrega em até 7 dias úteis garantida.</li>
            <li>Nas compras <b>a vista um desconto de 10% é aplicado.</b></li>
        </ul>

        <table id="priceBox">
            <tr>
                <td>Subtotal:</td>
                <td class="checkoutPriceColumn">
                    R$ ${cart.subtotal}</td>
            </tr>
            <tr>
                <td>Frete:</td>
                <td class="checkoutPriceColumn">
                    R$ TBD</td>
            </tr>
            <tr>
                <td class="total">Total:</td>
                <td class="total checkoutPriceColumn">
                    R$ ${cart.subtotal}</td>
            </tr>
        </table>
    </div>
</div>