<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Nov 23, 2017, 8:39:09 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--ANTIGO METODO JSTL-->
<%--<sql:query var="categorias" dataSource="jdbc/geekadvanced">
    SELECT * FROM categoria
</sql:query>--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/geekadvanced.css">
        <title>Geek Advanced Shop</title>
    </head>
    <body>
        

            <div id="indexLeftColumn">
                <div id="welcomeText">
                    <p><h4>[ Bem vindo a Geek Advanced ]</h4>
                    <br> Utilize as categorias ao lado para encontrar produtos e adiciona-los ao seu carrinho após isso finalize a compra</p>
                </div>
            </div>

            <div id="indexRightColumn">
                <p id="Categorias">[ Categorias ]<p>
                
                <c:forEach var="categoria" items="${categorias}">
                    
                    <div class="categoryBox">
                    <a href="categoria?${categoria.id}">
                        <span class="categoryLabelText">${categoria.nome}</span>
                        <img src="${initParam.categoriasImagePath}${categoria.nome}.jpg" alt="${categoria.nome}" height="176" width="212">
                    </a>
                </div>
                </c:forEach>
 
              
            </div>

            
    </body>
</html>
