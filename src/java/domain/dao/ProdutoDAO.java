package domain.dao;

import domain.model.EstoqueLog;
import domain.model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConectaDB;

public class ProdutoDAO {

    private Connection connection;
    private final EstoqueLogDAO log;

    public ProdutoDAO() {
        try {
            this.connection = ConectaDB.conectar();
        } catch (ClassNotFoundException e) {
            System.out.println("ERRO: " + e.getMessage());
        }
        
        this.log = new EstoqueLogDAO();
    }

    public void cadastrarProduto(Produto produto) throws SQLException {
        String sql = "INSERT INTO produtos (nome, descricao, quantidade, preco, categoria, tamanho, peso, marca, modelo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, produto.getNome());
        ps.setString(2, produto.getDescricao());
        ps.setInt(3, produto.getQuantidade());
        ps.setDouble(4, produto.getPreco());
        ps.setString(5, produto.getCategoria());
        ps.setString(6, produto.getTamanho());
        ps.setString(7, produto.getPeso());
        ps.setString(8, produto.getMarca());
        ps.setString(9, produto.getModelo());
        ps.execute();
    }

    public void atualizarProduto(Produto produto) throws SQLException {
        String sql = "UPDATE produtos SET nome=?, descricao=?, quantidade=?, preco=?, categoria=?, tamanho=?, peso=?, marca=?, modelo=? WHERE id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, produto.getNome());
        ps.setString(2, produto.getDescricao());
        ps.setInt(3, produto.getQuantidade());
        ps.setDouble(4, produto.getPreco());
        ps.setString(5, produto.getCategoria());
        ps.setString(6, produto.getTamanho());
        ps.setString(7, produto.getPeso());
        ps.setString(8, produto.getMarca());
        ps.setString(9, produto.getModelo());
        ps.setInt(10, produto.getId());
        ps.execute();
    }

    public List<Produto> listarProdutos() throws SQLException {
        List<Produto> produtos = new ArrayList<>();
        String sql = "SELECT * FROM produtos";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String nome = resultSet.getString("nome");
            String descricao = resultSet.getString("descricao");
            int quantidade = resultSet.getInt("quantidade");
            double preco = resultSet.getDouble("preco");
            String categoria = resultSet.getString("categoria");
            String tamanho = resultSet.getString("tamanho");
            String peso = resultSet.getString("peso");
            String marca = resultSet.getString("marca");
            String modelo = resultSet.getString("modelo");

            Produto produto = new Produto(id, nome, descricao, quantidade, preco, categoria, tamanho, peso, marca, modelo);
            produtos.add(produto);
        }
        return produtos;
    }

    public Produto buscarProdutoPorId(int id) throws SQLException {
        String sql = "SELECT * FROM produtos WHERE id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet resultSet = ps.executeQuery();
        if (resultSet.next()) {
            String nome = resultSet.getString("nome");
            String descricao = resultSet.getString("descricao");
            int quantidade = resultSet.getInt("quantidade");
            double preco = resultSet.getDouble("preco");
            String categoria = resultSet.getString("categoria");
            String tamanho = resultSet.getString("tamanho");
            String peso = resultSet.getString("peso");
            String marca = resultSet.getString("marca");
            String modelo = resultSet.getString("modelo");

            Produto produto = new Produto(id, nome, descricao, quantidade, preco, categoria, tamanho, peso, marca, modelo);
            return produto;
        }
        return null;
    }

    public void excluirProduto(int id) throws SQLException {
        String sql = "DELETE FROM produtos WHERE id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);
        ps.execute();
    }

    public void adicionarQuantidadeAoProdutoPorId(int id, int quantidadeAdicional) throws SQLException {
        Produto produto = buscarProdutoPorId(id);

        if (produto != null) {
            int novaQuantidade = produto.getQuantidade() + quantidadeAdicional;
            produto.setQuantidade(novaQuantidade);
            atualizarProduto(produto);
            log.cadastrarLog(new EstoqueLog(id, "FOI ADICIONADO " + quantidadeAdicional + " UNIDADES"));
        }
    }

    public void removerQuantidadeDoProdutoPorId(int id, int quantidadeRemovida) throws SQLException {
        Produto produto = buscarProdutoPorId(id);

        if (produto != null) {
            int quantidadeAtual = produto.getQuantidade();

            if (quantidadeRemovida <= quantidadeAtual) {
                int novaQuantidade = quantidadeAtual - quantidadeRemovida;
                produto.setQuantidade(novaQuantidade);
                atualizarProduto(produto);
                log.cadastrarLog(new EstoqueLog(id, "FOI REMOVIDO " + quantidadeRemovida + " UNIDADES"));
            } else {
                throw new IllegalArgumentException("Quantidade a ser removida maior do que a quantidade atual.");
            }
        }
    }
}
