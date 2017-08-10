package br.ufsm.csi.dao;

import br.ufsm.csi.model.Usuario;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.Collection;

@Repository
public class UsuarioDAO {

    @Autowired
    private SessionFactory sessionFactory; // Singleton da sessionFactory

    @Transactional
    public void inserirUsuario(Usuario usuario)throws Exception{ // Método que executa a transação de de inserção de usuário passado por parâmetro
        Session session =  sessionFactory.getCurrentSession();
        session.save(usuario); // Save o usuário
    }

    @Transactional
    public Usuario getUsuario(String emailUsuario)throws Exception{ // Método que busca um usuário de acordo com o e-mail passado por parâmetro informado no formulário de login
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Usuario.class); // Instancia criteria
        crit.add(Restrictions.eq("emailUsuario", emailUsuario)); // Adiciona na criteria a restrição de login
        return (Usuario) crit.uniqueResult(); // Retorna usuário único de acordo com a criteria de único resultado
    }

    @Transactional
    public boolean alterarUsuario(Usuario usuario){ // Método que executa a transação de alteração de usuário no gerenciamento de conta
        Session session = sessionFactory.getCurrentSession();
        try {
            session.update(usuario); // Alteração do usuário
        } catch(Exception e)
        {
            return false;
        }
        return true;
    }
}