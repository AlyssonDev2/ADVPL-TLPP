#include 'protheus.ch'
#include 'FWMVCDef.ch'

User Function Modelo2MVC()
    Local aArea   := GetArea()
    Local oBrowse := FWMBrowse():New()

    oBrowse:SetAlias("SZ7")
    oBrowse:SetDescription("Solicita��o do Compras")

    oBrowse:Activate()

    RestArea(aArea)
return

Static Function ModelDef()
    //Objeto respons�vel pela estrutura TEMPOR�RIA do cabe�alho
    Local oStCabec := FWFormModelStruct():New()

    //Objeto respons�vel pela estrutura dos itens
    Local oStItens := FWFormStruct(1, "SZ7")

    Local oModel   := MPFormModel():New("Modelo2MVCM",)

    //Cria��o da tabela tempor�ria
    oStCabec:AddTable("SZ7",{`"Z7_NUM","Z7_ITEm"},"Cabe�alho SZ7")

    //Cria��o dos campos da tabela tempor�ria
   oStCabec:AddField(;
    "Filial",;                                                                                  // [01]  C   Titulo do campo
    "Filial",;                                                                                  // [02]  C   ToolTip do campo
    "Z7_FILIAL",;                                                                               // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_FILIAL")[1],;                                                                    // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .F.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FILIAL,FWxFilial('SZ7'))" ),;   // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                                        // [14]  L   Indica se o campo � virtual

oStCabec:AddField(;
    "Pedido",;                                                                                  // [01]  C   Titulo do campo
    "Pedido",;                                                                                  // [02]  C   ToolTip do campo
    "Z7_NUM",;                                                                                  // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_NUM")[1],;                                                                       // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .F.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_NUM,'')" ),;                    // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                                        // [14]  L   Indica se o campo � virtual

oStCabec:AddField(;
    "Emissao",;                                                                     // [01]  C   Titulo do campo
    "Emissao",;                                                                     // [02]  C   ToolTip do campo
    "Z7_EMISSAO",;                                                                  // [03]  C   Id do Field
    "D",;                                                                           // [04]  C   Tipo do campo
    TamSX3("Z7_EMISSAO")[1],;                                                       // [05]  N   Tamanho do campo
    0,;                                                                             // [06]  N   Decimal do campo
    Nil,;                                                                           // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                           // [08]  B   Code-block de valida��o When do campo
    {},;                                                                            // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                           // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_EMISSAO,dDataBase)" ),;    // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                           // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                           // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                            // [14]  L   Indica se o campo � virtual


oStCabec:AddField(;
    "Fornecedor",;                                                              // [01]  C   Titulo do campo
    "Fornecedor",;                                                              // [02]  C   ToolTip do campo
    "Z7_FORNECE",;                                                              // [03]  C   Id do Field
    "C",;                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_FORNECE")[1],;                                                   // [05]  N   Tamanho do campo
    0,;                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FORNECE,'')" ),;// [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                        // [14]  L   Indica se o campo � virtual

oStCabec:AddField(;
    "Loja",;                                                                      // [01]  C   Titulo do campo
    "Loja",;                                                                      // [02]  C   ToolTip do campo
    "Z7_LOJA",;                                                                   // [03]  C   Id do Field
    "C",;                                                                         // [04]  C   Tipo do campo
    TamSX3("Z7_LOJA")[1],;                                                        // [05]  N   Tamanho do campo
    0,;                                                                           // [06]  N   Decimal do campo
    Nil,;                                                                         // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                         // [08]  B   Code-block de valida��o When do campo
    {},;                                                                          // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                         // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_LOJA,'')" ),;     // [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                         // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                         // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                          // [14]  L   Indica se o campo � virtual

oStCabec:AddField(;
    "Usuario",;                                                                     // [01]  C   Titulo do campo
    "Usuario",;                                                                     // [02]  C   ToolTip do campo
    "Z7_USER",;                                                                     // [03]  C   Id do Field
    "C",;                                                                           // [04]  C   Tipo do campo
    TamSX3("Z7_USER")[1],;                                                          // [05]  N   Tamanho do campo
    0,;                                                                             // [06]  N   Decimal do campo
    Nil,;                                                                           // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                           // [08]  B   Code-block de valida��o When do campo
    {},;                                                                            // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                           // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_USER,__cuserid)" ),;// [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                           // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                           // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                            // [14]  L   Indica se o campo � virtual

//Tratando a estrutura dos Itens, que ser�o utilizados no Grid da aplica��o

//Modificando Inicializadores Padr�o,  para n�o dar mensagem de colunas vazias
oStItens:SetProperty("Z7_NUM",      MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))
oStItens:SetProperty("Z7_USER",     MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '__cUserId')) //Trazer o usu�rio automatico
oStItens:SetProperty("Z7_EMISSAO",  MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'dDatabase')) //Trazer a data autom�tica
oStItens:SetProperty("Z7_FORNECE",  MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))
oStItens:SetProperty("Z7_LOJA",     MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))

//Uni�o das estrutura, vinculando cabe�alho com os itens e vincula��o da estrutura de dados dos intens com o model

oModel:AddField("SZ7Master",,oStCabec)
oModel:AddGrid("SZ7Detail", "SZ7Master", oStItens,,,,,)

//Seto a rela��o entre cabe�aho e item, neste ponto, eu digo atrav�s de qual/quais campo(s) o grid est� vinculado com o cabe�alho
aRelations := {}
aAdd(aRelations,{"Z7_FILIAL",'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial("SZ7"))'})
aAdd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

oModel:SetRelation('SZ7DETAIL',{{'Z7_FILIAL','Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial("SZ7"))'},{'Z7_NUM','SZ7->Z7_NUM'}},SZ7->(IndexKey(1)))

//Seto a chave prim�ria, lembrando que, se ela estiver definida no X2_UNICO, faz valer o que est� no X2_UNICO
oModel:SetPrimaryKey({})

//� como se fosse a "chave prim�ria do GRID"
oModel:GetModel("SZ7DETAIL"):SetUniqueline({"Z7_ITEM"}) //o intuito � que este campo n�o se repita

//Setamos a descri��o/t�tulo que aparecer� no cabe�alho 
oModel:GetModel("SZ7MASTER"):SetDescription("CABE�ALHO DA SOLICITA��O DE COMPRAS")

//Setamos a descri��o/t�tulo que aparecer� no GRID DE ITENS
oModel:GetModel("SZ7DETAIL"):SetDescription("ITENS DA SOLICITA��O DE COMPRAS")

//Finalizamos a fun��o model
oModel:GetModel("SZ7DETAIL"):SetUseOldGrid(.T.) //Finalizo setando o modelo antigo de Grid, que permite pegar aHeader e aCols

return oModel

/*Static Function ViewDef()


return oView


Static Function MenuDef()

   
return aRotina

