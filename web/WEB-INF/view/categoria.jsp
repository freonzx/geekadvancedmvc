<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : categoria
    Created on : Nov 23, 2017, 9:51:10 AM
    Author     : root
--%>

<body>

    <div id="categoryLeftColumn">
        <c:forEach var="categoria" items="${categorias}">

            <c:choose>
                <c:when test="${categoria.id == pageContext.request.queryString}">
                    <div class="categoryButton" id="selectedCategory">
                        <span class="categoryText">
                            ${selectedCategory.nome}
                        </span>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="categoria?${categoria.id}" class="categoryButton">
                        <div class="categoryText">
                            ${categoria.nome}
                        </div>
                    </a>
                </c:otherwise>
            </c:choose>

        </c:forEach>

    </div>



    <div id="categoryRightColumn">
        <p id="categoryTitle">[ ${selectedCategory.nome} ]</p>

        <table id="productTable">
            <c:forEach var="produto" items="${categoryProducts}" varStatus="iter">
                <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                    <td>
                        <img src="${initParam.produtosImagePath}${produto.nome}.jpeg" class="prodImg" alt="${produto.nome}}">
                    </td>
                    <td>
                        ${produto.nome}
                        <br>
                        <span class="smallText"><p class="bg-info">[ ${produto.description} ]</p></span>
                    </td>
                    <td class="H-preco">R$ ${produto.preco}</td>
                    <td>
                        <form action="addCarrinho" method="post">
                            <input type="hidden" name="productId" value="${produto.id}">
                            <input type="submit" class="btn btn-info" value="Comprar">
                        </form>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>

</body>