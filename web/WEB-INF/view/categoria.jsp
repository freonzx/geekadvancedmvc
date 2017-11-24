<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : categoria
    Created on : Nov 23, 2017, 9:51:10 AM
    Author     : root
--%>

<body>

    <sql:query var="categorias" dataSource="jdbc/geekadvanced">
        SELECT * FROM categoria
    </sql:query>

    <sql:query var="categoriaAtual" dataSource="jdbc/geekadvanced">
        SELECT nome FROM categoria WHERE id = ?
        <sql:param value="${pageContext.request.queryString}" />
    </sql:query>

    <sql:query var="produtosCategoria" dataSource="jdbc/geekadvanced">
        SELECT * FROM produto WHERE categoria_id = ?
        <sql:param value="${pageContext.request.queryString}" />
    </sql:query>


    <div id="categoryLeftColumn">
        <c:forEach var="categoria" items="${categorias.rows}">

            <c:choose>
                <c:when test="${categoria.id == pageContext.request.queryString}">
                    <div class="categoryButton" id="selectedCategory">
                        <span class="categoryText">
                            ${categoria.nome}
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
        <p id="categoryTitle">[ ${categoriaAtual.rows[0].nome} ]</p>

        <table id="productTable">
            <c:forEach var="produto" items="${produtosCategoria.rows}" varStatus="iter">
                <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                    <td>
                        <img src="${initParam.produtosImagePath}${produto.nome}.png" alt="${produto.nome}}">
                    </td>
                    <td>
                        ${produto.nome}
                        <br>
                        <span class="smallText"><p class="bg-info">[ ${produto.description} ]</p></span>
                    </td>
                    <td class="H-preco">R$ ${produto.preco}</td>
                    <td>
                        <form action="addCarrinho" method="post">
                            <input type="hidden" name="produtoId" value="${produto.nome}">
                            <input type="submit" class="btn btn-info" value="Comprar">
                        </form>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>

</body>