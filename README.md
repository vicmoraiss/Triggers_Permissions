# 💼 Projeto SQL - Views, Permissões e Triggers

Este projeto foi desenvolvido como parte de um desafio prático para reforçar os conceitos de **Views**, **Permissões de Acesso** e **Triggers** no banco de dados MySQL.

---

## 📌 Parte 1 – Personalizando Acessos com Views

Nesta etapa, foram criadas **views (visões)** para os seguintes cenários:

- ✅ Número de empregados por departamento e localidade
- ✅ Lista de departamentos e seus gerentes
- ✅ Projetos com maior número de empregados (ordenados de forma decrescente)
- ✅ Lista de projetos, departamentos e respectivos gerentes
- ✅ Quais empregados possuem dependentes e se são também gerentes

### 🔐 Permissões de Acesso

As permissões de acesso foram definidas de acordo com o tipo de conta dos usuários:

- `gerente`: tem acesso às informações de **empregados** e **departamentos**
- `employee`: **não** tem acesso a dados de **departamentos** ou **gerentes**

> 📌 As views são armazenadas no banco como "tabelas", permitindo atribuição de permissões específicas sobre elas.

#### 📎 Exemplo de Criação de Usuário e Permissões

> Referência: curso *Explorando Cláusulas de DDL e Esquemas de Banco de Dados no MySQL*  
> (Ver exemplo no arquivo `code1.sql`)

---

## 🛒 Parte 2 – Criando Triggers para Cenário de E-commerce

Nesta parte do desafio, foram criadas **triggers** (gatilhos) associadas a ações de **remoção** e **atualização** de dados no banco.

### 🔄 Tipos de Triggers Criadas

- `BEFORE DELETE`: Para capturar e armazenar informações antes da exclusão de usuários
- `BEFORE UPDATE`: Para registrar alterações no salário base e inserções de novos colaboradores

#### 📎 Exemplos de Triggers Criadas

- `code2.sql`: Trigger base de exemplo
- `code3.sql`: Trigger de remoção de usuários
- `code4.sql`: Trigger de atualização de salário/inserção de colaboradores

---

## ✅ Entrega Final

O projeto contempla:

- Criação de Views com escopo e permissões
- Criação de Usuários e configuração de acessos no MySQL
- Triggers de atualização e remoção para um cenário de e-commerce

### 📎 Submissão

Adicione o link do repositório GitHub contendo o projeto e submeta para avaliação conforme solicitado.

---

## 🛠️ Tecnologias Utilizadas

- MySQL
- SQL DDL e DML
- Triggers e Views
- Gerenciamento de permissões

---

## 📁 Estrutura do Repositório

