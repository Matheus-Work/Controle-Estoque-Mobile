<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Remover Produto</title>
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
            .botao-voltar {
                position: relative;
                left: -2em;
                height: 2em;
                width: 2em;
            } /* Your custom styles here */
            .container {
                max-width: 500px; /* Largura máxima do container */
            }
            .btn-danger {
                width: 100%; /* Botão de largura total */
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
                    <a href="/ControleEstoqueMobile/index.html">
                        <img src="/ControleEstoqueMobile/image/voltar.png" alt="voltar" class="botao-voltar"/>
                    </a>
                    <h1 class="text-center">Controle de Estoque</h1>
                </div>
            </div>
            <div class="container mt-5 w-75">
                <h2 class="text-center">Remover Estoque</h2>
                <form action="remover_estoque.jsp" method="post">
                    <div class="mb-3">
                        <label for="produtoId" class="form-label">ID do Produto:</label>
                        <input type="text" class="form-control" id="produtoId" name="produtoId" required>
                    </div>
                    <div class="mb-3">
                        <label for="quantidade" class="form-label">Quantidade:</label>
                        <input type="number" class="form-control" id="quantidade" name="quantidade" required>
                    </div>
                    <div class="text-center">
                        <input type="submit" class="btn btn-danger" value="Remover">
                    </div>
                </form>
            </div>
        </div>

        <!-- Include Bootstrap JavaScript (optional, depending on your needs) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>
