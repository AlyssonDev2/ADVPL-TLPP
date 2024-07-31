#include 'protheus.ch'
#include 'FWMVCDef.ch'

User Function ModeloXMVC()
    Local oBrowse := FWLoadBrw("ModeloXMVC")

    oBrowse:Activate()
return
Static Function BrowseDef() 
    Local aArea    := GetArea()
    Local oBrowse  := FWMBrowse():New()
    
    oBrowse:SetAlias("SZ2")

    oBrowse:AddLegend("SZ2->Z2_STATUS == '1'", "GREEN", "Chamado Aberto")
    oBrowse:AddLegend("SZ2->Z2_STATUS == '2'", "RED", "Chamado Finalizado")
    oBrowse:AddLegend("SZ2->Z2_STATUS == '3'", "YELLOW", "Chamado em Andamento")

    //Define de onde viá o MenuDef de onde deve chamar o MenuDef
    oBrowse:SetMenuDef("ModeloXMVC")
    oBrowse:SetDescription("Cadastro de Chamados")
    
    oBrowse:Activate()
    
    RestArea(aArea) 
return

Static Function MenuDef()
    Local aMenu := {}

    Local aMenuAut := FWMvcMenu("ModeloXMVC")

    ADD OPTION aMenu TITLE 'Legenda' ACTION 'U_SZ2Leg'   OPERATION 6 ACCESS 0
    ADD OPTION aMenu TITLE 'Sobre'   ACTION 'U_SZ2Sobre' OPERATION 6 ACCESS 0

    For n:= 1 to Len(aMenuAut)
        aAdd(aMenu,aMenuAut[n])
    Next n

return aMenu


Static Function ModelDef()
    //Declarando modelo de dados em passar blocos de validação pois usaremos a validação padrão MVC
    Local oModel   := MPFormModel():New("MVCXM",,,,)
    
    //Criando estruturas pai(SZ2) e filho(SZ3)
    Local oStPai   := FWFormStruct(1,'SZ2')
    Local oStFilho := FWFormStruct(1,'SZ3')

    //Após declarar a estrutura de dados, eu posso modificar o campo com SetProperty
    oStFilho:SetProperty("Z3_CHAMADO",MODEL_FIELD_INIT,FwBuildFeature(STRUCT_FEATURE_INIPAD, "SZ2->Z2_COD"))

    //Criando Modelo de dados(Cabeçalho e Item)
    oModel:AddFields("SZ2MASTER",,oStPai)
    oModel:AddGrid("SZ3DETAIL","SZ2MASTER",oStFilho,,,,,)
    
    //Setando o relacionamento entre as tabelas, verificando os campos em comum
    oModel:SetRelation("SZ3DETAIL", {{"Z3_FILIAL", "xFilial('SZ2')"}, {"Z3_CHAMADO", "Z2_COD"}},SZ3->(IndexKey(1)))

    //Setando a chave primária(prevalece o que está na SX2(X2_unico) caso esteja preenchido
    oModel:SetPrimaryKey({"Z3_FILIAL", "Z3_CHAMADO", "Z3_CODIGO"})

    //Combinação de campos que não podem se repetir
    oModel:GetModel("SZ3DETAIL"):SetUniqueLine({"Z3_CHAMADO", "Z3_CODIGO"})

    oModel:SetDescription("Modelo 3 - Sistema de Chamados")
    oModel:GetModel("SZ2MASTER"):SetDescription("Cabeçaho do chamado")
    oModel:GetModel("SZ3DETAIL"):SetDescription("Comentários do chamado")

return oModel

Static Function ViewDef()
    Local oView  := Nil
    Local oModel := FWLoadModel("ModeloXMVC")

    Local oStPai   := FWFormStruct(2, "SZ2")
    Local oStFilho := FWFormStruct(2, "SZ3")

    //Removendo o campo para não aparecer, já que ele está sendo preenchido autómaticamente com o código do chamado do cabeçalho
    oStFilho:RemoveField("Z3_CHAMADO")

    //Travando o campo de código para ser apenas visualização
    oStFilho:SetProperty("Z3_CODIGO", MVC_VIEW_CANCHANGE, .F.)
    
    oView := FWFormView():New()

    //Carregando o modelo importado para a view
    oView:SetModel(oModel)

    //Criando as views de cabeçalho e item, com as estruturas de dados criados acima
    oView:AddField("VIEWSZ2",oStPai,"SZ2MASTER")
    oView:AddGrid("VIEWSZ3",oStFilho,"SZ3DETAIL")

    //Soma 1 ao campo de Item, campo de item incremental
    oView:AddIncrementFild("SZ3DETAIL", "Z3_CODIGO")

    //Criando os BOX horizontais para o cabeçalho e itens
    oView:CreateHorizontalBox("Cabeçalho", 60)
    oView:CreateHorizontalBox("Grid", 40)

    //Relacionando as VIEWS criadas com os BOX
    oView:SetOwnerView("VIEWSZ2","Cabeçalho")
    oView:SetOwnerView("VIEWSZ3","Grid")

    //Dando títulos personalizados ao cabeçalho e comentários do chamado
    oView:EnableTitleView("VIEWSZ2", "Detalhes do Chamado")
    oView:EnableTitleView("VIEWSZ3", "Comentários do Chamado")
return oView

User Function SZ2Leg()
    Local aLegenda := {}

    aAdd(aLegenda, {"BR_VERDE", "Chamado Aberto"})
    aAdd(aLegenda, {"BR_AMARELO", "Chamado em Andamento"})
    aAdd(aLegenda, {"BR_VERMELHO", "Chamado Finalizado"})

    BrwLegenda("Status dos Chamados",,aLegenda)
return

User Function SZ2SOBRE()
    Local cSobre

    cSobre := "-<b>Minha primeira tela em MVC modelo X<br>"

    MsgInfo(cSobre, "Sobre o Fonte")
return
