<%-- 
    Document   : carrinho
    Created on : Nov 23, 2017, 9:50:58 AM
    Author     : root
--%>



<div id="singleColumn">

    <c:choose>
        <c:when test="${cart.numberOfItems > 1}">
            <p>Seu carrinho contem ${cart.numberOfItems} items.</p>
        </c:when>
        <c:when test="${cart.numberOfItems == 1}">
            <p>Seu carrinho contem ${cart.numberOfItems} item.</p>
        </c:when>
        <c:otherwise>
            <p>Seu carrinho está vazio.</p>
        </c:otherwise>
    </c:choose>

    <div id="actionBar">
        <%-- ferramenta de limpar carrinho --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="verCarrinho?clear=true" class="bubble hMargin">Limpar carrinho</a>
        </c:if>

        <%-- ferramenta continuar comprando--%>
        <c:set var="value">
            <c:choose>
                <%-- se o objeto de sessão 'selectedCategory' existir, envie o usuário para a categoria visualizada anteriormente--%>
                <c:when test="${!empty selectedCategory}">
                    category
                </c:when>
                <%-- ou então manda pro index --%>
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <a href="${value}" class="bubble hMargin">Continuar comprando</a>

        <%-- checkout --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="checkout" class="bubble hMargin">Finalizar a compra &#x279f;</a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.numberOfItems != 0}">

      <h4 id="subtotal">Subtotal: R$ ${cart.subtotal}</h4>

      <table id="cartTable">

        <tr class="header">
            <th>Produto</th>
            <th>Nome</th>
            <th>Preco</th>
            <th>Quantidade</th>
        </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

          <c:set var="product" value="${cartItem.produto}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
            <td>
              <img src="${initParam.produtosImagePath}${product.nome}.jpeg"
                   alt="${product.nome}"
                   class="prodImg">
            </td>

            <td>${product.nome}</td>

            <td>
                R$ ${cartItem.total}
                <br>
                <span class="smallText">( R$ ${product.preco} / cada )</span>
            </td>

            <td>
                <form action="updateCarrinho" method="post">
                    <input type="hidden"
                           name="productId"
                           value="${product.id}">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="${cartItem.quantity}"
                           name="quantity"
                           style="margin:5px">
                    <input type="submit"
                           name="submit"
                           value="Atualizar Qtd">
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>