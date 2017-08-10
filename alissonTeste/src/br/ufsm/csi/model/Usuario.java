package br.ufsm.csi.model;

import javax.persistence.*;

@Entity
@Table(name = "USUARIO")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ")
    @SequenceGenerator(name = "SEQ", sequenceName = "sequencia")
    @Column(name = "IDUSUARIO")
    private Long idUsuario;

    @Column(name = "NOMEUSUARIO", length = 50)
    private String nomeUsuario;

    @Column(name = "EMAILUSUARIO", unique = true)
    private String emailUsuario;

    @Column(name = "SENHAUSUARIO")
    private String senhaUsuario;

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getSenhaUsuario() {
        return senhaUsuario;
    }

    public void setSenhaUsuario(String senhaUsuario) {
        this.senhaUsuario = senhaUsuario;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }
}
