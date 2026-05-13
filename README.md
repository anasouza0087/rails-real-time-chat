# ⚙️ Rails Real Time Chat

<p align="center">
  API RESTful autenticada desenvolvida com Ruby on Rails para gerenciamento de usuários e salas de chat, com suporte a comunicação em tempo real via WebSockets.
</p>

---

## 📌 Sobre o projeto

O **Rails Real Time Chat** é o backend responsável por sustentar a aplicação de chat em tempo real, oferecendo endpoints RESTful autenticados para gerenciamento de usuários e salas, além de comunicação bidirecional instantânea utilizando ActionCable.

O projeto foi desenvolvido com foco em organização arquitetural, autenticação, comunicação em tempo real e documentação completa da API com Swagger.

---

## ✨ Funcionalidades

### 🔐 Autenticação
- Geração de token de acesso
- Proteção de rotas via Bearer Token
- Validação de requisições autenticadas

---

### 👤 Usuários
- Criação de usuários
- Listagem de usuários
- Exibição individual de usuários

---

### 💬 Salas de chat
- Criação de salas
- Listagem de salas
- Consulta individual
- Atualização
- Remoção

---

### ⚡ Comunicação em tempo real
- WebSockets via ActionCable
- Broadcast de mensagens
- Atualização instantânea para usuários conectados
- Comunicação bidirecional sem polling

---

### 📄 Documentação da API
- Documentação interativa com Swagger
- Visualização e teste de endpoints

---

## 🏗️ Arquitetura

A aplicação foi construída seguindo princípios RESTful e organização modular do ecossistema Rails.

### Estrutura principal

```txt
app/
 ├── controllers/
 ├── models/
 ├── channels/
 └── views/

config/
 └── routes.rb

spec/
 └── swagger/

swagger/
```

---

### REST + Tempo Real

A aplicação combina duas abordagens complementares:

**REST API**  
Responsável por operações autenticadas de usuários e salas.

**ActionCable**  
Responsável pela comunicação em tempo real entre clientes conectados.

---

### Documentação automatizada

A documentação foi implementada com **rswag**, permitindo:

- Padronização dos endpoints
- Testes integrados
- Interface interativa para exploração da API

---

## 🛠️ Tecnologias utilizadas

- **Ruby**
- **Ruby on Rails**
- **PostgreSQL**
- **ActionCable**
- **JWT Authentication**
- **Rswag / Swagger**
- **WebSockets**

---

## 🚀 Como executar

### Clone o repositório

```bash
git clone git@github.com:anasouza0087/rails-real-time-chat.git
```

---

### Acesse a pasta

```bash
cd rails-real-time-chat
```

---

### Instale as dependências

```bash
bundle install
```

---

### Configure o banco de dados

```bash
rails db:create
rails db:migrate
```

---

### Inicie o servidor

```bash
rails server
```

---

A aplicação estará disponível em:

```txt
http://localhost:3000
```

---

## 📘 Documentação da API

Após iniciar o servidor, acesse:

```txt
http://localhost:3000/api-docs
```

A interface Swagger permite visualizar e testar os endpoints disponíveis.

---

## 🔑 Autenticação

A API protege seus endpoints utilizando autenticação baseada em token.

As requisições autenticadas devem incluir o header:

```http
Authorization: Bearer <token>
```

O token deve ser obtido através do endpoint de autenticação.

---

## 🔌 Comunicação em tempo real

A comunicação instantânea é realizada via **ActionCable**, permitindo que múltiplos clientes conectados recebam atualizações em tempo real dentro das salas de chat.

---

## 🧠 Principais desafios

Durante o desenvolvimento, os principais desafios foram:

- Configuração inicial do ActionCable
- Integração entre autenticação e WebSockets
- Estruturação da comunicação em tempo real
- Geração da documentação Swagger com rswag
- Organização da arquitetura para múltiplas salas

---

## 📚 Aprendizados

Este projeto permitiu aprofundar conhecimentos em:

- Arquitetura backend com Rails
- Comunicação em tempo real com ActionCable
- Estruturação de APIs RESTful autenticadas
- Documentação automatizada
- Integração backend + frontend em aplicações interativas

---

## 👩‍💻 Autora

**Ana Bezerra**

Backend / Frontend Developer

📫 Contato: **anabezerra.dev@gmail.com**

---

## 🔗 Projeto relacionado

Frontend da aplicação:

[react-real-time-chat](git@github.com:anasouza0087/react-real-time-chat.git)