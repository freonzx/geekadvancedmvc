/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author root
 */
@Entity
@Table(name = "cliente_pedido")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ClientePedido.findAll", query = "SELECT c FROM ClientePedido c")
    , @NamedQuery(name = "ClientePedido.findById", query = "SELECT c FROM ClientePedido c WHERE c.id = :id")
    , @NamedQuery(name = "ClientePedido.findByQuantidade", query = "SELECT c FROM ClientePedido c WHERE c.quantidade = :quantidade")
    , @NamedQuery(name = "ClientePedido.findByDateCreated", query = "SELECT c FROM ClientePedido c WHERE c.dateCreated = :dateCreated")
    , @NamedQuery(name = "ClientePedido.findByConfirmationNumber", query = "SELECT c FROM ClientePedido c WHERE c.confirmationNumber = :confirmationNumber")})
public class ClientePedido implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantidade")
    private BigDecimal quantidade;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    @Basic(optional = false)
    @NotNull
    @Column(name = "confirmation_number")
    private int confirmationNumber;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "clientePedido")
    private Collection<OrderedProduto> orderedProdutoCollection;
    @JoinColumn(name = "cliente_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Cliente clienteId;

    public ClientePedido() {
    }

    public ClientePedido(Integer id) {
        this.id = id;
    }

    public ClientePedido(Integer id, BigDecimal quantidade, Date dateCreated, int confirmationNumber) {
        this.id = id;
        this.quantidade = quantidade;
        this.dateCreated = dateCreated;
        this.confirmationNumber = confirmationNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(BigDecimal quantidade) {
        this.quantidade = quantidade;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getConfirmationNumber() {
        return confirmationNumber;
    }

    public void setConfirmationNumber(int confirmationNumber) {
        this.confirmationNumber = confirmationNumber;
    }

    @XmlTransient
    public Collection<OrderedProduto> getOrderedProdutoCollection() {
        return orderedProdutoCollection;
    }

    public void setOrderedProdutoCollection(Collection<OrderedProduto> orderedProdutoCollection) {
        this.orderedProdutoCollection = orderedProdutoCollection;
    }

    public Cliente getClienteId() {
        return clienteId;
    }

    public void setClienteId(Cliente clienteId) {
        this.clienteId = clienteId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ClientePedido)) {
            return false;
        }
        ClientePedido other = (ClientePedido) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidade.ClientePedido[ id=" + id + " ]";
    }
    
}
