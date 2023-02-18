# Dino-Burguer

Participei da 9ª edição da Imersão Dart Week, ministrada por Rodrigo Rahman da Academia do Flutter. Aprendi novos conceitos e bibliotecas no mundo do Flutter, incluindo o padrão BloC como gerenciador de estado, de uma forma diferente e nova pra mim. Também apliquei minhas habilidades em desenvolvimento em um projeto de aplicativo de delivery para uma hamburgueria, onde modifiquei um pouco o visual do APP e outras pequenas modificações.

## 👾 Melhorias para o APP:
- Animação de movimento fluida
- Trocar Dio (porque foi descontinuado!)
- Navigator Bar
- Page de pedidos realizados (em andamento, concluídos)
- Deslogar perfil de usuário

repositório GitHub: https://lnkd.in/d5XWY8kz

#flutter #dart #github #desenvolvimento #ImersaoDartWeek #AcademiaDoFlutter #Flutter

Lembrar de rodar:
flutter pub run build_runner watch -d
antes de coemçar quando for adiconar comando novos!

Ta faltando fazer..
Button Navigator Pages

Eu estava lutando muito com isso. Resolvido pelas seguintes etapas usando o PowerShell:

Instalando o CHOCOLATEY em https://chocolatey.org/install#individual
Ativando dartdoc usandoflutter pub global activate dartdoc
Ativando dhttpd usandoflutter pub global activate dhttpd
Gerando a documentação dartdocna pasta do projeto
Visualizando os arquivos gerados usandodhttpd --path doc/api
Como alternativa no macOS, você pode usar Homebrewpara instalar o dartdocedhttpd