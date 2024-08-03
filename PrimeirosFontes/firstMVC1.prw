#include "protheus.ch"
#Include 'FWMVCDef.ch'

User function firstMVC1()
    Local  oBrowse := FWLoadBrw("firstMVC1")

    oBrowse:Activate() 
return 

Static Function BrowseDef()
    Local aArea   := GetArea()
    Local oBrowse
    
    oBrowse := FWMBrowse():New()

    oBrowse:SetAlias("SA1")

    oBrowse:SetDescription("Cadastro de Clientes")

    oBrowse:AddLegend("SA1->A1_EST == 'CE'", "GREEN","Cliente Local")
    oBrowse:AddLegend("SA1->A1_EST != 'CE'", "BLUE","Cliente Externo")

    oBrowse:SetFilterDefault("A1_MSBLQL == '2'")

    oBrowse:SetOnlyFields({'A1_COD', 'A1_NOME', 'A1_NREDUZ'})

    oBrowse:SetMenuDef("firstMVC1")

    oBrowse:DisableDetails()

    oBrowse:Activate()

    RestArea(aArea)
return 

Static Function MenuDef()
    Local aMenu := FWMvcMenu("ModeloXMVC")

     ADD OPTION aMenu TITLE 'Legendas'    ACTION 'u_legendaSA1'        OPERATION 6 ACCESS 0
 
return aMenu

Static Function ModelDef()
    Local oModel     := Nil
    Local oStructSA1 := FWFormStruct(1, "SA1")

    oModel := MPFormModel():New("firstMVC1M")

    oModel:AddFields("FORMSSA1",,oStructSA1)

    oModel:SetPrimaryKey({"A1_FILIAL", "A1_COD"})

    oModel:SetDescription("Modelo de dados de cadastro de Clientes")

    oModel:GetModel("FORMSSA1"):SetDescription("Formulário de cadastro de clientes")
return oModel

Static Function ViewDef()
    Local oModel := FWLoadModel("firstMVC1")

    Local oStructSA1 := FWFormStruct(2, "SA1")

    Local oView := Nil
    oView := FWFormView():New()

    oView:SetModel(oModel)
    oView:AddField("VIEWSA1",oStructSA1,"FORMSSA1")

    oView:CreateHorizontalBox('Tela', 100)

    oView:EnableTitleView("VIEWSA1", "Visualização de Clientes")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWSA1","Tela")
return oView

User Function legendaSA1()
    Local aLegenda := {}

    aAdd(aLegenda, {"BR_VERDE", "Clientes do Ceará"})
    aAdd(aLegenda, {"BR_AZUL", "Clientes de fora do Ceará"})

    BrwLegenda("Localizade do Cliente",,aLegenda)
return




