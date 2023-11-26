<%@page import="domain.model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="domain.dao.ProdutoDAO"%>
<%@page import="domain.dao.ProdutoDAO"%>
<%@page import="domain.model.EstoqueLog"%>
<%@page import="domain.dao.EstoqueLogDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Listagem de Logs do Produto</title>
        <!-- Include Bootstrap CSS -->
        <link rel="icon" href="../image/logo.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .header {
                background-color: #000; /* Cor de fundo preta */
                color: #fff; /* Cor do texto branco */
                padding: 20px 0; /* Espaçamento interno do cabeçalho */
                text-align: center; /* Alinhamento do texto no centro */
            }
            .container {
                max-width: 800px; /* Largura máxima do container */
                margin-top: 20px; /* Espaçamento superior */
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }
            th {
                background-color: #f2f2f2;
            }
            .custom-alert-color {
                background-color: #000 !important; /* Cor de fundo preta */
                color: #fff; /* Cor do texto branco */
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
            <%
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                // Recupere o ID do produto da solicitação
                int produtoId = Integer.parseInt(request.getParameter("id"));
                EstoqueLogDAO logDAO = new EstoqueLogDAO();
                List<EstoqueLog> logs = logDAO.listarLogsPorProdutoId(produtoId);
                ProdutoDAO produtoDAO = new ProdutoDAO();
                Produto produto = produtoDAO.buscarProdutoPorId(produtoId);
            %>
            <div class="header mb-5">
                <div class="d-flex align-items-center justify-content-center">
                    <a href="/ControleEstoqueMobile/listar/listar_todos.jsp">
                        <img src="/ControleEstoqueMobile/image/voltar.png" alt="voltar" class="botao-voltar"/>
                    </a>
                    <h1 class="text-center">Controle de Estoque</h1>
                </div>
            </div>
            <div class="container">
                <h2 class="text-center">Listagem de Movimentação do Produto: <%= produto.getNome()%></h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Data e Hora</th>
                            <th>Log</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (EstoqueLog log : logs) {
                        %>
                        <tr>
                            <td><%= formatter.format(log.getDataHora())%></td>
                            <td><%= log.getLog()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <div class="container mt-5">
                    <div class="alert custom-alert-color text-center mt-3">
                        <h2>TOTAL: <%= produto.getQuantidade()%></h2>
                    </div>
                </div>

            </div>
        </div>

        <!-- Include Bootstrap JavaScript (optional, depending on your needs) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>
