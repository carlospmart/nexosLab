<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <?php include "./components/head.php" ?>
</head>
<body class="form-body">
    <?php include './components/header.php'  ?>

    <main class="catalog">
        <h1 class="catalog__title">Produtos</h1>
        <div class="catalog__grid">
            <?php 
            
            require "./db/searchProducts.php";

            if( !empty($produtos)){
                foreach ($produtos as $produto) {
                    include './components/productCard.php';
                }
            } else {
                echo '<h2 style="color: var(--text-primary-color); text-align: center;  grid-column: span 7; width="100%">NÂO FOI ENCONTRADO NADA NA PESQUISA<h2>';
            }
            
            ?>
        </div>
    </main>

    <?php include './components/modal.php' ?>
    <script src="./static/js/themes.js"></script>
</body>

</html> 