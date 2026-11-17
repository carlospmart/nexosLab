🔗 **Acesse o projeto online:** [nexos-lab.infinityfreeapp.com](http://nexos-lab.infinityfreeapp.com/)

# 🧪 nexosLab

Sistema web de gerenciamento de catálogo e estoque desenvolvido em **PHP** puro, **MySQL**, **SCSS** e **JavaScript**, com suporte a upload de imagens, cadastro de produtos, categorias, fornecedores, pesquisa dinâmica, ícones SVG parametrizáveis e alternância automática/manual de temas (Claro e Escuro).

![PHP](https://img.shields.io/badge/PHP-8.x-777BB4?style=flat&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=flat&logo=mysql&logoColor=white)
![Sass](https://img.shields.io/badge/Sass%2FSCSS-CC6699?style=flat&logo=sass&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)

---

## 📋 Sobre o Projeto

O **nexosLab** é uma aplicação web modular construída para organizar, pesquisar e gerenciar produtos de uma loja ou inventário. O projeto foi estruturado sem frameworks externos, priorizando organização e performance:
- **Componentização em PHP:** Reaproveitamento de interface através de blocos (`head`, `header`, `productCard`, `modal`, `option`).
- **Ícones SVG Inline Parametrizáveis:** Ícones armazenados em arquivos `.php` dentro de `icons/`, permitindo injeção direta no HTML e manipulação dinâmica de tamanho e estilo via variáveis PHP.
- **Arquitetura SCSS Modular (BEM):** Estilização dividida em `abstracts`, `base` e `components`, com suporte nativo a **Light/Dark Mode** via CSS Custom Properties e `prefers-color-scheme`.

---

## ✨ Funcionalidades

- **Catálogo de Produtos:** Exibição responsiva em grade (`catalog__grid`) com imagem, título, descrição e preço dos itens cadastrados.
- **Pesquisa de Produtos:** Busca dinâmica de itens com mensagem de feedback caso nenhum produto seja encontrado.
- **Cadastro de Produtos:** Formulário (`multipart/form-data`) com upload de imagens (`JPG`, `JPEG`, `PNG`, `WEBP`, `AVIF`), controle de estoque, preço, categoria e fornecedor.
- **Gestão de Categorias (Tags):** Cadastro de categorias para organização do catálogo.
- **Gestão de Fornecedores:** Cadastro de fornecedores com nome, e-mail e telefone.
- **Sistema de Temas (Light / Dark):** Alternância dinâmica de tema com detecção automática da preferência do sistema operacional.

---

## 🛠️ Tecnologias Utilizadas

- **Back-end:** PHP (Procedural com `mysqli` e Prepared Statements no cadastro de produtos)
- **Banco de Dados:** MySQL (`nexos_lab`)
- **Estilização:** Sass / SCSS (arquitetura modular + metodologia BEM + CSS Variables)
- **Front-end:** HTML5, SVG Inline e JavaScript Vanilla

---

## 📂 Estrutura do Projeto

```text
nexosLab/
├── components/                  # Componentes visuais reutilizáveis
│   ├── head.php                 # Metadados, favicon, fontes (Inter) e CSS
│   ├── header.php               # Cabeçalho, barra de pesquisa e botão de tema
│   ├── modal.php                # Modal de seleção de cadastros
│   ├── option.php               # Opções dinâmicas para selects
│   └── productCard.php          # Card individual de produto
├── db/                          # Camada de banco de dados (MySQLi)
│   ├── conexao.php              # Conexão com o banco nexos_lab
│   ├── createProduct.php        # Inserção de produto e upload de imagem
│   ├── createSupplier.php       # Inserção de fornecedor
│   ├── createTag.php            # Inserção de categoria/tag
│   ├── getAllProducts.php       # Listagem de produtos
│   ├── getAllSupplier.php       # Listagem de fornecedores
│   ├── getAllTags.php           # Listagem de categorias
│   └── searchProducts.php       # Consulta filtrada de produtos
├── icons/                       # Arquivos .php com SVGs puros parametrizados por variáveis
├── static/                      # Recursos estáticos
│   ├── icons/                   # Favicon / ícone da aba do navegador (<title>)
│   └── js/
│       ├── form.js              # Validações e máscaras de formulário
│       └── themes.js            # Alternância entre temas Claro e Escuro
├── style/                       # Arquitetura SCSS e CSS compilado
│   ├── abstracts/
│   │   ├── _functions.scss      # Funções auxiliares Sass (ex: conversão px -> rem)
│   │   └── _mixins.scss         # Mixins reutilizáveis
│   ├── base/
│   │   ├── _base.scss           # Reset global, tipografia e transições
│   │   └── _variables.scss      # Tokens de cores e temas (:root, .light, .dark)
│   ├── components/
│   │   ├── _btn.scss            # Estilos de botões e animações
│   │   ├── _catalog.scss        # Layout e grid do catálogo
│   │   ├── _form.scss           # Formulários de cadastro e barra de pesquisa
│   │   ├── _header.scss         # Estilos do cabeçalho
│   │   ├── _modal.scss          # Estilos e animações (@keyframes) do modal
│   │   └── _product-card.scss   # Estilos dos cards de produto
│   ├── style.scss               # Arquivo principal de importação SCSS
│   ├── style.css                # Folha de estilo compilada
│   └── style.css.map            # Source map para depuração
├── uploads/                     # Diretório onde as imagens dos produtos são salvas
├── index.php                    # Página inicial (Catálogo de Produtos)
├── products.php                 # Cadastro de produtos
├── search.php                   # Resultados da pesquisa
├── supplier.php                 # Cadastro de fornecedores
└── tag.php                      # Cadastro de categorias (tags)
```

---

## 🗄️ Estrutura do Banco de Dados

O sistema utiliza um banco de dados MySQL chamado **`nexos_lab`** com as seguintes tabelas:

- **`tag`**: `id`, `name`
- **`supplier`**: `id`, `name`, `telephone`, `email`
- **`product`**: `id`, `name`, `img_url`, `description`, `amount`, `preco`, `supplier_id`, `tag_id`

Script SQL para criação da estrutura:

```sql
CREATE DATABASE IF NOT EXISTS nexos_lab;
USE nexos_lab;

CREATE TABLE tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE supplier (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    telephone VARCHAR(14) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    img_url VARCHAR(255) NOT NULL,
    description VARCHAR(500),
    amount INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    supplier_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);
```

---

## 🚀 Como Executar Localmente

### Pré-requisitos

- Servidor local com **PHP** e **MySQL** (ex: XAMPP, WAMP, Laragon ou Docker).
- Compilador **Sass** (opcional, caso deseje modificar os arquivos `.scss` em `style/`).

### Passo a passo

1. **Clone o repositório** na pasta pública do seu servidor local (ex: `htdocs` no XAMPP):
   ```bash
   git clone https://github.com/carlospmart/nexosLab.git
   cd nexosLab
   ```

2. **Configure o Banco de Dados:**
   - Inicie os serviços **Apache** e **MySQL**.
   - Crie o banco `nexos_lab` e execute o script SQL acima.

3. **Verifique a conexão em `db/conexao.php`:**
   ```php
   $hostname = 'localhost';
   $username = 'root';
   $pass     = '';
   $banco    = 'nexos_lab';
   ```

4. *(Opcional)* **Compilar SCSS em modo watch:**
   ```bash
   sass --watch style/style.scss:style/style.css
   ```

5. **Acesse no navegador:**
   ```text
   http://localhost/nexosLab/
   ```

---

## 📄 Licença

Este projeto está sob a licença MIT. Sinta-se livre para estudar, modificar e evoluir o código.

---

Desenvolvido por **[Carlos P. Martins](https://github.com/carlospmart)**.
