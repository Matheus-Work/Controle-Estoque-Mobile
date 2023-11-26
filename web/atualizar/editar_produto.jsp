<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.model.Produto" %>
<%@ page import="domain.dao.ProdutoDAO" %>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Produto</title>
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
            <div class="container mt-5 w-75">
                <h1 class="text-center">Editar Produto</h1>

                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    ProdutoDAO produtoDAO = new ProdutoDAO();
                    Produto produto = produtoDAO.buscarProdutoPorId(id);

                    if (produto != null) {
                %>

                <form action="realiza_edicao.jsp" method="post">
                    <input type="hidden" name="produtoId" value="<%= produto.getId()%>">
                    <input type="hidden" name="quantidade" value="<%= produto.getQuantidade()%>">

                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome:</label>
                        <input type="text" class="form-control" id="nome" name="nome" value="<%= produto.getNome()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="descricao" class="form-label">Descrição:</label>
                        <input type="text" class="form-control" id="descricao" name="descricao" value="<%= produto.getDescricao()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="preco" class="form-label">Preço:</label>
                        <input type="number" step="0.01" class="form-control" id="preco" name="preco" value="<%= produto.getPreco()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="categoria" class="form-label">Categoria:</label>
                        <input type="text" class="form-control" id="categoria" name="categoria" value="<%= produto.getCategoria()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="tamanho" class="form-label">Tamanho:</label>
                        <input type="text" class="form-control" id="tamanho" name="tamanho" value="<%= produto.getTamanho()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="peso" class="form-label">Peso:</label>
                        <input type="text" class="form-control" id="peso" name="peso" value="<%= produto.getPeso()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="marca" class="form-label">Marca:</label>
                        <input type="text" class="form-control" id="marca" name="marca" value="<%= produto.getMarca()%>" required>
                    </div>

                    <div class="mb-3">
                        <label for="modelo" class="form-label">Modelo:</label>
                        <input type="text" class="form-control" id="modelo" name="modelo" value="<%= produto.getModelo()%>" required>
                    </div>

                    <div class="text-center w-100">
                        <input type="submit" class="btn btn-primary w-100" value="Atualizar">
                    </div>
                </form>


                <%
                    } else {
                        out.println("Produto não encontrado.");
                    }
                %>
            </div>
        </div>

        <!-- Inclua o JavaScript do Bootstrap (opcional, dependendo das funcionalidades que você precisa) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>
