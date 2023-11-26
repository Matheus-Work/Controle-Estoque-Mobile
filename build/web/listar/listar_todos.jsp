<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="domain.model.Produto" %>
<%@ page import="domain.dao.ProdutoDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de Produtos</title>
        <link rel="icon" href="../image/logo.png" type="image/x-icon">
        <!-- Inclua os links para os arquivos CSS e JavaScript do Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .header {
                background-color: #000;
                color: #fff;
                padding: 20px 0;
                text-align: center;
            }

            .botao-voltar {
                position: relative;
                left: -2em;
                height: 2em;
                width: 2em;
            }

            table {
                position: relative;
            }

            @media (min-width: 768px) {
                .custom-btn {
                    width: 20%;
                }

                .mobile {
                    display: none;
                }
            }

            @media (max-width: 767px) {
                .desktop {
                    display: none;
                }

                .mobile {
                    display: block;
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
    <body class="w-100">
        <div class="desktop-message d-none d-md-block text-center mt-5">
            <p>Não há suporte para desktop. Por favor, redirecione para a versão móvel.</p>
        </div>
        <div class="mobile">
            <div class="header mb-5">
                <div class="d-flex align-items-center justify-content-center">
                    <a href="/ControleEstoqueMobile/index.html">
                        <img src="/ControleEstoqueMobile/image/voltar.png" alt="voltar" class="botao-voltar"/>
                    </a>
                    <h1 class="text-center">Controle de Estoque</h1>
                </div>
            </div>
            <div class="container mt-5">
                <h1 class="text-center">Lista de Produtos</h1>

                <%
                    ProdutoDAO produtoDAO = new ProdutoDAO();
                    List<Produto> listaDeProdutos = produtoDAO.listarProdutos();
                %>

                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Editar</th>
                            <th>Excluir</th>
                            <th>Registros</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Produto produto : listaDeProdutos) {
                        %>
                        <tr>
                            <td><%= produto.getId()%></td>
                            <td><%= produto.getNome()%></td>
                            <td>
                                <a href="/ControleEstoqueMobile/atualizar/editar_produto.jsp?id=<%= produto.getId()%>" class="btn btn-primary btn-sm">Editar</a>
                            </td>
                            <td>
                                <a href="/ControleEstoqueMobile/deletar/excluir_produto.jsp?id=<%= produto.getId()%>" class="btn btn-danger btn-sm">Excluir</a>
                            </td>
                            <td>
                                <a href="/ControleEstoqueMobile/estoque/log.jsp?id=<%= produto.getId()%>" class="btn btn-success btn-sm">Listar</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Inclua o JavaScript do Bootstrap (opcional, dependendo das funcionalidades que você precisa) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>
