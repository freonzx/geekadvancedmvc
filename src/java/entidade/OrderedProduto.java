/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidade;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author root
 */
@Entity
@Table(name = "ordered_produto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderedProduto.findAll", query = "SELECT o FROM OrderedProduto o")
    , @NamedQuery(name = "OrderedProduto.findByClientePedidoId", query = "SELECT o FROM OrderedProduto o WHERE o.orderedProdutoPK.clientePedidoId = :clientePedidoId")
    , @NamedQuery(name = "OrderedProduto.findByProdutoId", query = "SELECT o FROM OrderedProduto o WHERE o.orderedProdutoPK.produtoId = :produtoId")
    , @NamedQuery(name = "OrderedProduto.findByQuantity", query = "SELECT o FROM OrderedProduto o WHERE o.quantity = :quantity")})
public class OrderedProduto implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderedProdutoPK orderedProdutoPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private short quantity;
    @JoinColumn(name = "cliente_pedido_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private ClientePedido clientePedido;
    @JoinColumn(name = "produto_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Produto produto;

    public OrderedProduto() {
    }

    public OrderedProduto(OrderedProdutoPK orderedProdutoPK) {
        this.orderedProdutoPK = orderedProdutoPK;
    }

    public OrderedProduto(OrderedProdutoPK orderedProdutoPK, short quantity) {
        this.orderedProdutoPK = orderedProdutoPK;
        this.quantity = quantity;
    }

    public OrderedProduto(int clientePedidoId, int produtoId) {
        this.orderedProdutoPK = new OrderedProdutoPK(clientePedidoId, produtoId);
    }

    public OrderedProdutoPK getOrderedProdutoPK() {
        return orderedProdutoPK;
    }

    public void setOrderedProdutoPK(OrderedProdutoPK orderedProdutoPK) {
        this.orderedProdutoPK = orderedProdutoPK;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    public ClientePedido getClientePedido() {
        return clientePedido;
    }

    public void setClientePedido(ClientePedido clientePedido) {
        this.clientePedido = clientePedido;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderedProdutoPK != null ? orderedProdutoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderedProduto)) {
            return false;
        }
        OrderedProduto other = (OrderedProduto) object;
        if ((this.orderedProdutoPK == null && other.orderedProdutoPK != null) || (this.orderedProdutoPK != null && !this.orderedProdutoPK.equals(other.orderedProdutoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidade.OrderedProduto[ orderedProdutoPK=" + orderedProdutoPK + " ]";
    }
    
}
