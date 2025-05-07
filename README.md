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

# 1. Clone o repositório:

-git clone https://github.com/seu-usuario/nome-do-repositorio.git

# 2. Abra o projeto no Xcode:

-open dti-lembretes.xcodeproj
-Conecte um simulador ou dispositivo com iOS 13+ e execute o projeto (Cmd + R)



## 📷 Capturas de Tela

As imagens abaixo são exemplos visuais da interface do app.

##✅ Tela de Criação de Lembrete

![Criar lembrete](https://drive.google.com/file/d/1vOs0Fy969jqV5OqA-hWinrct52O1czEm/view?usp=share_link)

##📅 Lista de Lembretes Agrupados por Data

![Listar lembrete](https://drive.google.com/file/d/1ryBgpY45pmOhYtBJZvpc93ERmrv2RHlR/view?usp=share_link)

##✏️ Tela de Edição de Lembrete

![Editar lembrete](https://drive.google.com/file/d/1YQqDtyKmE-y-iKcoFvA9dFmmweuSpS9_/view?usp=share_link)


