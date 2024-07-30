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

    oBrowse:AddLegend("SZ2->Z2_STATUS == 1", "GREEN", "Chamado Aberto")
    oBrowse:AddLegend("SZ2->Z2_STATUS == 2", "RED", "Chamado Finalizado")
    oBrowse:AddLegend("SZ2->Z2_STATUS == 3", "YELLOW", "Chamado em Andamento")

    //Define de onde vi� o MenuDef de onde deve chamar o MenuDef
    oBrowse:SetMenuDef("ModeloXMVC")
    oBrowse:SetDescription("Cadastro de Chamados")
    
    oBrowse:Activate()
    
    RestArea(aArea) 
return

/*Static Function MenuDef()
return oModel
*/

Static Function ModelDef()
    //Declarando modelo de dados em passar blocos de valida��o pois usaremos a valida��o padr�o MVC
    Local oModel   := MPFormModel():New("MVCXM",,,,)
    
    //Criando estruturas pai(SZ2) e filho(SZ3)
    Local oStPai   := FWFormStruct(1,'SZ2')
    Local oStFilho := FWFormStruct(1,'SZ3')

    //Criando Modelo de dados(Cabe�alho e Item)
    oModel:AddFields("SZ2MASTER",,oStPai)
    oModel:AddGrid("SZ3DETAIL","SZ2MASTER",oStFilho,,,,)
    
    //Setando o relacionamento entre as tabelas, verificando os campos em comum
    oModel:SetRelation("SZ3DETAIL", {{"Z3_FILIAL", "xFilial('SZ2')"}, {"Z3_CHAMADO", "Z2_CODE"}},SZ3->(IndiceKey(1)))

    //Setando a chave prim�ria(prevalece o que est� na SX2(X2_unico) caso esteja preenchido
    oModel:SetPrimaryKey({"Z3_FILIAL", "Z3_CHAMDO", "Z3_CODIGO"})

    //Combina��o de campos que n�o podem se repetir
    oModel:GetModel("SZ3DETAIL"):SetUniqueLine({"Z3_CHAMADO", "Z3_CODIGO"})

    oModel:SetDescription("Modelo 3 - Sistema de Chamados")
    oModel:GetModel("SZ2MASTER"):SetDescription("Cabe�aho do chamado")
    oModel:GetModel("SZ2DETAIL"):SetDescription("Coment�rios do chamado")

return oModel

/*Static Function ViewDef()
return oView
*/
