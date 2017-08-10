package br.ufsm.csi.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "CLIENTE")
public class Cliente {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ")
    @SequenceGenerator(name = "SEQ", sequenceName = "sequencia")
    @Column(name = "IDCLI")
    private Long idCliente;

    @Column(name = "NOMECLIENTE")
    private String nomeCliente;

    @Column(name = "DATANASC")
    private String dataNasc;

    @Column(name = "LOGRADOURO")
    private String logradouro;

    @Column(name = "BAIRRO")
    private String bairro;

    @Column(name = "MUNICIPIO")
    private String municipio;

    @Column(name = "ESTADO")
    private String estado;

    @Column(name = "CEP")
    private String cep;

    @Column(name = "DESCRICAO")
    private String descricao;

    public Long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Long idCliente) {
        this.idCliente = idCliente;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(String dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
