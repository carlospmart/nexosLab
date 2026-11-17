<?php
// Recomendado usar $_GET para buscas, mas mantive $_POST conforme seu código original
$pesquisa = trim($_GET['title'] ?? '');

require "./db/conexao.php";

$produtos = [];

if (!empty($pesquisa)) {
    
    // Verifica se tem 3 caracteres ou menos
    if (mb_strlen($pesquisa, 'UTF-8') <= 3) {
        $sql = "SELECT * FROM product WHERE name LIKE ? OR description LIKE ?";
        $stmt = mysqli_prepare($db, $sql);
        
        if ($stmt) {
            $termoLike = "%" . $pesquisa . "%";
            mysqli_stmt_bind_param($stmt, "ss", $termoLike, $termoLike);
        }
    } else {
        // Mais de 3 caracteres: usa o MATCH ... AGAINST
        $sql = "SELECT * FROM product WHERE MATCH(name, description) AGAINST(? IN BOOLEAN MODE)";
        $stmt = mysqli_prepare($db, $sql);
        
        if ($stmt) {
            // O asterisco permite encontrar o início da palavra (ex: "tecl" acha "teclado")
            $termoMatch = $pesquisa . "*";
            mysqli_stmt_bind_param($stmt, "s", $termoMatch);
        }
    }

    // Executa a consulta (independente de qual IF entrou)
    if ($stmt) {
        mysqli_stmt_execute($stmt);
        $resultado = mysqli_stmt_get_result($stmt);
        
        while ($p = mysqli_fetch_assoc($resultado)) {
            $produtos[] = [
                "id" => $p["id"],
                "title" => $p["name"],
                "imgUrl" => $p["img_url"],
                "description" => $p["description"],
                "amount" => $p["amount"],
                "preco" => $p["preco"],
                "supplierId" => $p["supplier_id"],
                "tagId" => $p["tag_id"]
            ];
        }
        
        mysqli_stmt_close($stmt);
    } else {
        error_log("Erro na consulta: " . mysqli_error($db));
    }
}

mysqli_close($db);
?>