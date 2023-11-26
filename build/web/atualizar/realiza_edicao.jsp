<%@ page import="java.sql.SQLException" %>
<%@ page import="domain.dao.ProdutoDAO" %>
<%@ page import="domain.model.Produto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro de Produto</title>
        <!-- Inclua os links para os arquivos CSS e JavaScript do Bootstrap -->
        <link rel="icon" href="../image/logo.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .header {
                background-color: #000; /* Cor de fundo preta */
                color: #fff; /* Cor do texto branco */
                padding: 20px 0; /* Espaçamento interno do cabeçalho */
                text-align: center; /* Alinhamento do texto no centro */
            }
            .botao-voltar {
                position: relative;
                left: -2em;
                height: 2em;
                width: 2em;
            }
            @media (min-width: 768px) {
                .custom-btn {
                    width: 20%; /* Botões têm largura menor em dispositivos desktop */
                }

                .mobile {
                    display: none; /* Oculta os botões em dispositivos desktop */
                }
            }

            @media (max-width: 767px) {
                .mobile {
                    display: block; /* Exibe os botões em dispositivos móveis */
                }
            }
        </style>
    </head>
    <body>
        <div class="mobile">
            <div class="header mb-5">
                <div class="d-flex align-items-center justify-content-center">
                    <a href="/ControleEstoqueMobile/listar/listar_todos.jsp">
                        <img src="/ControleEstoqueMobile/image/voltar.png" alt="voltar" class="botao-voltar"/>
                    </a>
                    <h1 class="text-center">Controle de Estoque</h1>
                </div>
            </div>
            <%
                int produtoId = Integer.parseInt(request.getParameter("produtoId"));
                String nome = request.getParameter("nome");
                String descricao = request.getParameter("descricao");
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                double preco = Double.parseDouble(request.getParameter("preco"));
                String categoria = request.getParameter("categoria");
                String tamanho = request.getParameter("tamanho");
                String peso = request.getParameter("peso");
                String marca = request.getParameter("marca");
                String modelo = request.getParameter("modelo");

                Produto produto = new Produto(produtoId, nome, descricao, quantidade, preco, categoria, tamanho, peso, marca, modelo);

                ProdutoDAO dao = new ProdutoDAO();
                dao.atualizarProduto(produto);
            %>
            <div class="container mt-5">
                <h1 class="text-center">Atualizado com sucesso</h1>
                <div class="alert alert-success mt-3">
                    Atualizado com sucesso!
                </div>
            </div>
        </div>
    </body>

</html>
