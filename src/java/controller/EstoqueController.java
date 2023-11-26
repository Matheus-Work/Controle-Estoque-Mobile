/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import domain.dao.ProdutoDAO;
import java.sql.SQLException;

/**
 *
 * @author alunos
 */
public class EstoqueController {
    
    public void adicionar(int produtoId, int quantidade) {
        ProdutoDAO produtoDAO = new ProdutoDAO();
        
        try {
            produtoDAO.adicionarQuantidadeAoProdutoPorId(produtoId, quantidade);
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        }
        
    }
    
    public void remover(int produtoId, int quantidade) {
        ProdutoDAO produtoDAO = new ProdutoDAO();
        
        try {
            produtoDAO.removerQuantidadeDoProdutoPorId(produtoId, quantidade);
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        }
        
    }
}
