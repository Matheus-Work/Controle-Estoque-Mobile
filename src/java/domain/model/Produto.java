package domain.model;

public class Produto {

    private int id;
    private String nome;
    private String descricao;
    private int quantidade;
    private double preco;
    private String categoria;
    private String tamanho; 
    private String peso;    
    private String marca;   
    private String modelo;  

    public Produto(int id, String nome, String descricao, int quantidade, double preco, String categoria, String tamanho, String peso, String marca, String modelo) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.preco = preco;
        this.categoria = categoria;
        this.tamanho = tamanho;
        this.peso = peso;
        this.marca = marca;
        this.modelo = modelo;
    }

    public Produto(String nome, String descricao, int quantidade, double preco, String categoria, String tamanho, String peso, String marca, String modelo) {
        this.nome = nome;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.preco = preco;
        this.categoria = categoria;
        this.tamanho = tamanho;
        this.peso = peso;
        this.marca = marca;
        this.modelo = modelo;
    }

    

    // Getters e setters para todos os atributos
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
}
    