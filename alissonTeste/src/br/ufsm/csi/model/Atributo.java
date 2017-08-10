package br.ufsm.csi.model;

public class Atributo {

    private String path;
    private String type;
    private String label;
    private String placeholder;
    private String required;
    private String other;

    public Atributo(String path, String type, String label, String placeholder, String required, String other){
        this.path = path;
        this.type = type;
        this.label = label;
        this.placeholder = placeholder;
        this.required = required;
        this.setOther(other);
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getPlaceholder() {
        return placeholder;
    }

    public void setPlaceholder(String placeholder) {
        this.placeholder = placeholder;
    }

    public String getRequired() {
        return required;
    }

    public void setRequired(String required) {
        this.required = required;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }
}
