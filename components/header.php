<header class="header">
    <div class="header__left">
        <button id="btn-theme" class="btn"></button>
        <a href="./" class="header__logo">
            <div class="header__logo-img">
                <?php include './icons/logo.php'; ?>
            </div>
            <span class="header__logo-title">Nexos Lab</span>
        </a>
    </div>

    <form action="./search.php" method="GET" class="form-pesquisar">
        <label class="form-pesquisar__label">
            <span class="form-pesquisar__sepadador">
                <input name="title" type="text" placeholder="Pesquisar..." value="<?= htmlspecialchars($_GET['title'] ?? '') ?>">
                <button type="submit">
                    <?php include "./icons/search.php"; ?>
                </button>
            </span>
        </label>
    </form>

   <?php 
    if (isset($btn)) {
        echo '<a href="./" class="btn header__btn-voltar">
            Voltar
        </a>';
    } else {
        echo '<button id="open-modal" class="btn header__btn">
            <span class="header__btn-plus">+</span>cadastrar
        </button>';
    }
   ?>
</header>
