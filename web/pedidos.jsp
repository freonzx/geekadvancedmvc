<%-- 
    Document   : pedidos
    Created on : Nov 28, 2017, 10:46:29 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div id="categoryRightColumn">
            <h3>Lista de Pedidos:</h3>
            <br>
            <br>

            <form action="pedidos.jsp" method="POST">
                Procurar por Numero de pedido:<input type="text" name="pedidoid" value="" />
                <input type="submit" value="Procurar" />
            </form>

            <table border="1">
                <tbody>
                    <tr>
                        <td>ID</td>
                        <td>VALOR</td>
                        <td>DATA PEDIDO</td>
                        <td>NUMERO CONFIRMACAO</td>
                        <td>ID CLIENTE</td>
                    </tr>
                    <c:choose>
                        <c:when test="${empty param.pedidoid}">
                            <c:forEach var="pedido" items="${pedidos}">        
                                <tr>
                                    <td>${pedido.id}</td>
                                    <td>${pedido.quantidade}</td>
                                    <td>${pedido.dateCreated}</td>
                                    <td>${pedido.confirmationNumber}</td>
                                    <td>${pedido.clienteId}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="pedido" items="${pedidos}">  
                                <c:if test="${param.pedidoid == pedido.id}">
                                <td>${pedido.id}</td>
                                <td>${pedido.quantidade}</td>
                                <td>${pedido.dateCreated}</td>
                                <td>${pedido.confirmationNumber}</td>
                                <td>${pedido.clienteId}</td>

                            </c:if>

                        </c:forEach>   
                    </c:otherwise>
                </c:choose>

                </tbody>
            </table>

        </div>
        <br>
        <br>
        <br>
        <br>
    </body>
</html>
