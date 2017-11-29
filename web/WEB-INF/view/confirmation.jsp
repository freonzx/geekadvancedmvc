<%--
    
--%>


<div id="singleColumn">

    <p id="confirmationText">
        <strong>O seu pedido foi processado com sucesso e será entregue no prazo de 24 horas.</strong>
        <br><br>
        Mantenha sua nota do seu número de confirmação:
        <strong>${orderRecord.confirmationNumber}</strong>
        <br>
        Se você tiver alguma duvida sobre o seu pedido, fique à vontade para nos <a href="#">contatar</a>.
        <br><br>
        Obrigado por fazer compras no GeekAdvanced!
    </p>

    <div class="summaryColumn" >

        <table id="orderSummaryTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">Resumo do Pedido</th>
            </tr>

            <tr class="tableHeading">
                <td>Produto</td>
                <td>Quantidade</td>
                <td>Preco</td>
            </tr>

            <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                <tr class="${((iter.index % 2) != 0) ? 'lightBlue' : 'white'}">
                    <td>${products[iter.index].nome}</td>
                    <td class="quantityColumn">
                        ${orderedProduct.quantity}
                    </td>
                    <td class="confirmationPriceColumn">
                        R$ ${products[iter.index].preco * orderedProduct.quantity}
                    </td>
                </tr>

            </c:forEach>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="2" id="deliverySurchargeCellLeft"><strong>Frete:</strong></td>
                <td id="deliverySurchargeCellRight">R$ TBD</td>
            </tr>

            <tr class="lightBlue">
                <td colspan="2" id="totalCellLeft"><strong>Total:</strong></td>
                <td id="totalCellRight">R$ ${orderRecord.quantidade}</td>
            </tr>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="3" id="dateProcessedRow"><strong>Data do pedido:</strong>
                    ${orderRecord.dateCreated}
                </td>
            </tr>
        </table>

    </div>

    <div class="summaryColumn" >

        <table id="deliveryAddressTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">Endereço de Entrega:</th>
            </tr>

            <tr>
                <td colspan="3" class="lightBlue">
                    ${customer.name}
                    <br>
                    ${customer.endereco}
                    <br>
                    Cidade ${customer.cidade}
                    <br>
                    <hr>
                    <strong>Email:</strong> ${customer.email}
                    <br>
                    <strong>Telefone:</strong> ${customer.telefone}
                </td>
            </tr>
        </table>

    </div>
</div>