# Projetos em ADVPL/TL++
<p>Este repositório foi criado com o objetivo de armazenar meus fontes criados durante meus estudos na linguagem ADVPL e Sistema ERP Protheus, bem como ser uma fonte de conhecimento para auxiliar no desenvolvimento de customizações futuras.</p>


- [Executor de fontes: ](executorFontes.tlpp)  Criado para executar rotinas costumizadas pelo usuário e padrões do Protheus.

<p align="center"><img src="Resource/executor.png"></p>

 - [Tela de Cadastro: ](CadastroAluno/projeto01.tlpp)  Interface de cadastro de alunos criada com elementos visuais do ADVPL, utiliza caixa de diálogo (TDialog) e pastas (TFolders) para organizar as seções da tela, como dados pessoais e endereço. Contando com validação de entrada dos dados, o fonte funciona como um CRUD de uma tabela personalizada de alunos. Suas principais funções incluem: cadastro, alteração, consultar e exclusão. É um exemplo prático de automação de processos administrativos utilizando AdvPL.

<p align="center"><img src="Resource/cadastroAlunos.png"></p>

 - [Modelos MVC: ](ModelosMVC) Fontes com rotinas criadas na arquitetura MVC (Model-View-Controller) em ADVPL:
   - [Modelo 1](ModelosMVC/MVCModelo1.prw) - Utiliza apenas uma tabela.
   - [Modelo 2](ModelosMVC/Modelo2MVC.prw) -  é um cadastro que possui 2 tabelas, uma cabeçalho e a outra são os itens (similar ao Pedido de Venda)
   - [Modelo X](ModelosMVC/ModeloXMVC.prw) -  estrutura de 2 tabelas ou mais  (Pai, Filho e Neto)
  
  - [Fontes base: ](PrimeirosFontes) Fontes de exemplo dedicados a fins de consulta, neles contêm os componentes visuais da linguagem, propriedade de consulta padrão do objeto TGet, acesso e alteração de tabelas padrões do Protheus, exemplo de Job e como inclui-lo no appserver,dentre outras classes e objetos essenciais no desenvolvimento.


 
