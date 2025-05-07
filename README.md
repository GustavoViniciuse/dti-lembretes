# 📝 Sistema de Lembretes

Aplicativo iOS desenvolvido em Swift que permite criar, visualizar, editar e excluir lembretes agrupados por data. 
Os lembretes são organizados em ordem cronológica e contam com validação de campos obrigatórios e datas futuras.

## 🚀 Funcionalidades

- ✅ Adicionar lembrete com **nome** e **data**.
- ✅ Validar:
  - Campo "Nome" deve estar preenchido
  - Campo "Data" deve ser válida e estar no futuro
- ✅ Editar nome, data e descrição do lembrete (respeitando as validações)
- ✅ Excluir lembrete individualmente
  - Na listagem de lembretes, há uma opção Editar, que exibe o botão de exclusão ao lado de cada lembrete
- ✅ Exibir os dias em ordem cronológica
- ✅ Visualizar detalhes do lembrete ao clicar sobre ele

## 🛠️ Código construído com

- Swift
- SwiftUI
- Xcode 
- Compatível com iOS 13+

## 📌 Premissas Assumidas

- O usuário preencherá os campos na ordem correta: nome → data → horas
- Datas no passado não são permitidas
- As regras de validação são aplicadas tanto na criação quanto na edição
- Os lembretes são automaticamente reagrupados por data, que é exibida de forma cronológica

## 📐 Decisões de Projeto

- O agrupamento por data facilita a visualização dos lembretes organizadamente
- A experiência do usuário foi priorizada com mensagens de erro claras para campos inválidos
- O código foi mantido limpo e modular, facilitando manutenção e escalabilidade
- Optou-se por usar estruturas nativas do Swift para manipulação de datas e listas

## ▶️ Como executar o projeto

### 1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/nome-do-repositorio.git
```
### 2. Abra o projeto no Xcode:
```bash
-open dti-lembretes.xcodeproj
-Conecte um simulador ou dispositivo com iOS 13+ e execute o projeto (Cmd + R)
```

## 📷 Capturas de Tela

As imagens abaixo são exemplos visuais da interface do app.

### ✅ Tela de Criação de Lembrete

<img src="https://github.com/user-attachments/assets/8d8557a8-2971-4b32-8bb9-c7177defa4dc" width="200"/>


### 📅 Lista de Lembretes Agrupados por Data

<img src="https://github.com/user-attachments/assets/d93a6807-0161-45c5-8eb0-5afab8a8798e" width="200"/>


### ✏️ Tela de Edição de Lembrete

<img src="https://github.com/user-attachments/assets/6a7fabfd-4906-4f7c-9aaf-9e1221d68a71" width="200"/>




