<%-- 
    Document   : clientes
    Created on : Nov 28, 2017, 8:23:35 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
    
    <head>
    <div id="categoryRightColumn">

        <h3>Lista de Clientes:</h3>
        <br>
        <br>
        
        <form action="clientes.jsp" method="POST">
            Procurar por ID:<input type="text" name="clienteid" value="" />
            <input type="submit" value="Procurar" />
        </form>
        
        <table border="1">
            <tbody>
                <tr>
                    <td>ID</td>
                    <td>Nome</td>
                    <td>Email</td>
                    <td>Telefone</td>
                    <td>Endereco</td>
                    <td>Cidade</td>
                </tr>

                <c:forEach var="cliente" items="${clientes}">        
                    <tr>
                        <td>${cliente.id}</td>
                        <td>${cliente.name}</td>
                        <td>${cliente.email}</td>
                        <td>${cliente.telefone}</td>
                        <td>${cliente.endereco}</td>
                        <td>${cliente.cidade}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

    </div>
</body>
</html>
