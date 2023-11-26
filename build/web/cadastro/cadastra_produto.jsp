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
            @media (min-width: 768px) {
                .desktop-message {
                    display: block; /* Exibe a mensagem em dispositivos desktop */
                    background-color: #ff0000; /* Cor de fundo vermelha (pode ajustar conforme preferir) */
                    color: #fff; /* Cor do texto branco */
                    padding: 20px; /* Espaçamento interno da mensagem */
                    position: fixed;
                    top:7em;
                    width:100%;
                    font-size: 25px;

                }
            }
        </style>
    </head>

    <body>
        <div class="desktop-message d-none d-md-block text-center mt-5">
            <p>Não há suporte para desktop. Por favor, redirecione para a versão móvel.</p>
        </div>
        <div class="mobile">
            <div class="header mb-5">
                <div class="d-flex align-items-center justify-content-center">
                    <a href="/ControleEstoqueMobile/listar/listar_todos.jsp">
                        <img src="/ControleEstoqueMobile/image/voltar.png" alt="voltar" class="botao-voltar"/>
                    </a>
                    <h1 class="text-center">Controle de Estoque</h1>
                </div>
            </div>
            <div class="container mt-5">
                <h1 class="text-center">Cadastro de Produto</h1>
                <%
                    boolean cadastroSucesso = false;

                    String nome = request.getParameter("nome");
                    String descricao = request.getParameter("descricao");
                    double preco = Double.parseDouble(request.getParameter("preco"));
                    String categoria = request.getParameter("categoria");
                    String tamanho = request.getParameter("tamanho");
                    String peso = request.getParameter("peso");
                    String marca = request.getParameter("marca");
                    String modelo = request.getParameter("modelo");

                    Produto produto = new Produto(nome, descricao, 0, preco, categoria, tamanho, peso, marca, modelo);

                    ProdutoDAO produtoDAO = new ProdutoDAO();

                    try {
                        produtoDAO.cadastrarProduto(produto);
                        cadastroSucesso = true;
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                %>

                <div class="alert <% if (cadastroSucesso) { %>alert-success<% } else { %>alert-danger<% } %> mt-3">
                    <% if (cadastroSucesso) { %>
                    Cadastro realizado com sucesso!
                    <% } else { %>
                    Ocorreu um erro durante o cadastro.
                    <% }%>
                </div>
            </div>
        </div>

        <!-- Inclua o JavaScript do Bootstrap (opcional, dependendo das funcionalidades que você precisa) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>

</html>
