<%@page import="controller.EstoqueController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.dao.ProdutoDAO" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Adicionar Estoque</title>
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
            .container {
                max-width: 500px; /* Largura máxima do container */
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
                    <a href="/ControleEstoqueMobile/estoque/form_adicionar_estoque.jsp">
                        <img src="/ControleEstoqueMobile/image/voltar.png" alt="voltar" class="botao-voltar"/>
                    </a>
                    <h1 class="text-center">Controle de Estoque</h1>
                </div>
            </div>
            <%
                int produtoId = Integer.parseInt(request.getParameter("produtoId"));
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));

                EstoqueController estoqueController = new EstoqueController();
                estoqueController.adicionar(produtoId, quantidade);
            %>
            <div class="container mt-5">
                <h2 class="text-center">Adicionar Estoque</h2>
                <div class="alert alert-success mt-3">
                    Adicionado com sucesso!
                </div>
            </div>
        </div>
    </body>
</html>
