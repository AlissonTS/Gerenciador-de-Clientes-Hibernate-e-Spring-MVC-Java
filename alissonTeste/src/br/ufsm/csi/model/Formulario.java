package br.ufsm.csi.model;

import java.util.ArrayList;

public class Formulario {

    // Atributos do Formulários
    private ArrayList<Atributo> atributos;

    public ArrayList<Atributo> getAtributos() {
        return atributos;
    }

    public void setAtributos(int opcao) {
        // String path, String type, String label, String placeholder, String required
        // String path, String type, String label, String placeholder, String required, String other
        this.atributos = new ArrayList();

        if(opcao>0){
            Atributo idCliente = new Atributo("idCliente", "hidden", "", "", "true", "readonly");
            this.atributos.add(idCliente);
        }

        Atributo nome = new Atributo("nomeCliente", "text", "Nome do Cliente", "Digite o nome completo do cliente", "required", "");
        this.atributos.add(nome);
        Atributo dataNasc = new Atributo("dataNasc", "text", "Data de Nascimento", "Ano-Mês-Dia", "required", "");
        this.atributos.add(dataNasc);
        Atributo cep = new Atributo("cep", "text", "CEP", "Digite o CEP do cliente", "required", "");
        this.atributos.add(cep);
        Atributo logradouro = new Atributo("logradouro", "text", "Logradouro", "Digite o logradouro do cliente", "required", "");
        this.atributos.add(logradouro);
        Atributo bairro = new Atributo("bairro", "text", "Bairro", "Digite o bairro do cliente", "required", "");
        this.atributos.add(bairro);
        Atributo municipio = new Atributo("municipio", "Cidade", "Município", "Digite o município do cliente", "required", "");
        this.atributos.add(municipio);
        Atributo estado = new Atributo("estado", "text", "Estado", "Digite a sigla do Estado do cliente", "required", "");
        this.atributos.add(estado);
        Atributo descricao = new Atributo("descricao", "text", "Descrição", "Digite uma descrição sobre o cliente", "", "");
        this.atributos.add(descricao);
    }
}
