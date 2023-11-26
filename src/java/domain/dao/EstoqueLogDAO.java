package domain.dao;

import domain.model.EstoqueLog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import util.ConectaDB;

public class EstoqueLogDAO {

    private Connection connection;

    public EstoqueLogDAO() {
        try {
            this.connection = ConectaDB.conectar();
        } catch (ClassNotFoundException e) {
            System.out.println("ERRO: " + e.getMessage());
        }
    }

    public void cadastrarLog(EstoqueLog log) {
        String sql = "INSERT INTO estoque_log (produto_id, log, data_hora) VALUES (?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, log.getProdutoId());
            preparedStatement.setString(2, log.getLog());
            preparedStatement.setObject(3, log.getDataHora());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<EstoqueLog> listarLogsPorProdutoId(int produtoId) {
        List<EstoqueLog> logs = new ArrayList<>();
        String sql = "SELECT produto_id, log, data_hora FROM estoque_log WHERE produto_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, produtoId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String logTexto = resultSet.getString("log");
                LocalDateTime dataHora = resultSet.getObject("data_hora", LocalDateTime.class);

                EstoqueLog log = new EstoqueLog(produtoId, logTexto);
                log.setDataHora(dataHora);

                logs.add(log);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return logs;
    }

}
