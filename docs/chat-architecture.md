flowchart TD

A[Frontend\nReact + Tailwind]

A -->|REST API| B[Backend\nRuby on Rails]

B -->|ActiveRecord| C[(PostgreSQL)]

A -->|WebSocket| D[WebSocket Server\nActionCable]

D --> B

erDiagram

USERS {
  int id
  string name
  string username
  string password_hash
  string status
  boolean enabled
  datetime created_at
}

ROOMS {
  int id
  string name
  int owner_id
  datetime created_at
}

room_users {
  int id
  int user_id
  int room_id
  datetime joined_at
}

MESSAGES {
  int id
  string content
  int user_id
  int room_id
  datetime created_at
}

USERS ||--o{ room_users : participates
ROOMS ||--o{ room_users : contains

USERS ||--o{ MESSAGES : sends
ROOMS ||--o{ MESSAGES : contains

flowchart TD

A[Usuário abre aplicação]

A --> B[Login]

B --> C{Credenciais válidas?}

C -->|Não| D[Erro login]

C -->|Sim| E[Lista de salas]

E --> F[Entrar em sala]

F --> G[Abrir conexão WebSocket]

G --> H[Usuário envia mensagem]

H --> I[Servidor salva mensagem]

I --> J[(Banco de dados)]

I --> K[Broadcast mensagem]

K --> L[Todos usuários da sala recebem]

stateDiagram-v2

[*] --> Offline

Offline --> Online : login

Online --> InRoom : entrar sala

InRoom --> SendingMessage : enviar mensagem
SendingMessage --> InRoom

InRoom --> Online : sair sala

Online --> Offline : logout

stateDiagram-v2

[*] --> Offline

Offline --> Online : login

Online --> InRoom : entrar sala

InRoom --> SendingMessage : enviar mensagem
SendingMessage --> InRoom

InRoom --> Online : sair sala

Online --> Offline : logout

sequenceDiagram

participant A as User A
participant B as Server
participant C as User B

A->>B: WebSocket message:create
B->>B: salvar mensagem no banco
B->>C: broadcast mensagem
B->>A: broadcast mensagem

flowchart TD

A[API]

A --> B[POST /login]

A --> C[Users]
C --> C1[POST /users]

A --> D[Rooms]
D --> D1[GET /rooms]
D --> D2[POST /rooms]
D --> D3[DELETE /rooms/:id]

A --> E[Participants]
E --> E1[POST /rooms/:id/invite]
E --> E2[POST /rooms/:id/leave]

A --> F[Messages]
F --> F1[GET /rooms/:id/messages]

flowchart TD

App

App --> LoginPage

App --> Dashboard

Dashboard --> RoomsList

Dashboard --> ChatRoom

ChatRoom --> MessageList
ChatRoom --> MessageInput
ChatRoom --> ParticipantsList

