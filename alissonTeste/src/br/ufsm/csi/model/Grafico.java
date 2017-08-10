package br.ufsm.csi.model;

public class Grafico {

    private String coluna;
    private int quantidade;

    public Grafico(String coluna, int quantidade){
        this.setColuna(coluna);
        this.setQuantidade(quantidade);
    }

    public String getColuna() {
        return coluna;
    }

    public void setColuna(String coluna) {
        this.coluna = coluna;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
