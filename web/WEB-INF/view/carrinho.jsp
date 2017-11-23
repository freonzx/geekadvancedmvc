<%-- 
    Document   : carrinho
    Created on : Nov 23, 2017, 9:50:58 AM
    Author     : root
--%>



<div id="centerColumn">

    <p>Seu carrinho contem x items.</p>

    <div id="actionBar">
        <a href="#" class="bubble hMargin">Limpar carrinho</a>
        <a href="#" class="bubble hMargin">Continuar Comprando</a>
        <a href="#" class="bubble hMargin">Finalizar a compra</a>
    </div>

    <h4 id="subtotal">[ Subtotal: xxx ]</h4>

    <table id="cartTable">

        <tr class="header">
            <th>Produto</th>
            <th>Nome</th>
            <th>Preço</th>
            <th>Quantidade</th>
        </tr>

        <tr>
            <td class="lightBlue">
                <img src="#" alt="product image">
            </td>
            <td class="lightBlue">[ Nome Produto ]</td>
            <td class="lightBlue">[ Preco ]</td>
            <td class="lightBlue">

                <form action="updateCart" method="post">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="1"
                           name="quantity">
                    <input type="submit"
                           name="submit"
                           value="update button">
                </form>
            </td>
        </tr>

        <tr>
            <td class="white">
                <img src="#" alt="product image">
            </td>
            <td class="white">[ Nome Produto ]</td>
            <td class="white">[ Preco ]</td>
            <td class="white">

                <form action="updateCart" method="post">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="1"
                           name="quantity">
                    <input type="submit"
                           name="submit"
                           value="update button">
                </form>
            </td>
        </tr>

        <tr>
            <td class="lightBlue">
                <img src="#" alt="product image">
            </td>
            <td class="lightBlue">[ Nome Produto ]</td>
            <td class="lightBlue">[ Preco ]</td>
            <td class="lightBlue">

                <form action="updateCart" method="post">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="1"
                           name="quantity">
                    <input type="submit"
                           name="submit"
                           value="update button">
                </form>
            </td>
        </tr>

    </table>

</div>