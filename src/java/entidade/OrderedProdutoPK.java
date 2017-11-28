/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidade;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author root
 */
@Embeddable
public class OrderedProdutoPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "cliente_pedido_id")
    private int clientePedidoId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "produto_id")
    private int produtoId;

    public OrderedProdutoPK() {
    }

    public OrderedProdutoPK(int clientePedidoId, int produtoId) {
        this.clientePedidoId = clientePedidoId;
        this.produtoId = produtoId;
    }

    public int getClientePedidoId() {
        return clientePedidoId;
    }

    public void setClientePedidoId(int clientePedidoId) {
        this.clientePedidoId = clientePedidoId;
    }

    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) clientePedidoId;
        hash += (int) produtoId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderedProdutoPK)) {
            return false;
        }
        OrderedProdutoPK other = (OrderedProdutoPK) object;
        if (this.clientePedidoId != other.clientePedidoId) {
            return false;
        }
        if (this.produtoId != other.produtoId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidade.OrderedProdutoPK[ clientePedidoId=" + clientePedidoId + ", produtoId=" + produtoId + " ]";
    }
    
}
