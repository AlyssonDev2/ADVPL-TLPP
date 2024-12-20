#include 'protheus.ch'
#include 'FWMVCDef.ch'

/*/{Protheus.doc} MVCModelo1
Fonte em MVC Modelo 1 para fins de estudo
@type function
@version  
@author Alysson
@since 19/07/2024
@return variant, return_description
/*/
User Function MVCModelo1()
    Local aArea   := GetArea() //Salva o ambiente ativo.
	Local oBrowse

    oBrowse := FWMBrowse():New()
    oBrowse:SetAlias('Sz5')

    oBrowse:SetDescription("Meu Primeiro Browse - Tela de Alunos") //Cria a t�tulo do Browse
                      //Condicional                      /Cor    /Descri��o
    oBrowse:AddLegend("len(allTrim(Sz5->z5_SERIE))<=15","GREEN", "Aluno do Ensino M�dio") //Adiciona legenda
    oBrowse:AddLegend("len(alltrim(Sz5->z5_SERIE))>15","BLUE", "Aluno do Ensino Fundamental") //Adiciona legenda
    oBrowse:SetOnlyFields({'z5_COD','z5_NOME','z5_SERIE','z5_SEXO'}) //Selecina campos a serem exibidos

    oBrowse:DisableDetails() //Desabilita detalhes do canto inferior da tela
    oBrowse:Activate()
    RestArea(aArea) //Restaura um ambiente salvo anteriormente pela fun��o GETAREA().
Return oBrowse

Static Function ModelDef()
    Local oModel     := nil   
                        
    Local oStructZS2 := FWFormStruct( 1, "Sz5") //Cria a estrutura a ser usada na View (1 Model / 2 View)

    oModel := MPFormModel():New("MVCModelo1M") 

    oModel:AddFields("FORMSz5", /*Owner*/, oStructZS2) //Atribuindo formul�rio para o modelo de dados

    oModel:SetPrimaryKey({"z5_FILIAL", "z5_COD"}) //Definindo chave prim�ria

    oModel:SetDescription("Modelo de dado de Cadastro de alunos")

    oModel:GetModel("FORMSz5"):SetDescription("Formul�rio de Cadastro de Alunos.")

return oModel

Static Function ViewDef()
    // Cria um objeto de Modelo de dados baseado no ModelDef() do fonte informado
    Local oModel     := FWLoadModel('MVCModelo1')
                                    
    Local oStructZS2 := FWFormStruct( 2, "Sz5") // Cria a estrutura a ser usada na View (1 Model / 2 View)

    // Interface de visualiza��o
    Local oView      := Nil 
    // Cria o objeto de View
    oView := FWFormView():New()

    // Define qual o Modelo de dados ser� utilizado na View
    oView:SetModel( oModel )
    oView:AddField("VIEWSz5", oStructZS2, "FORMSz5") //Atribuindo formul�rio para o modelo de dados

    // Criar um "box" horizontal para receber algum elemento da view
    oView:CreateHorizontalBox("Tela", 100)

    // Relaciona o identificador (ID) da View com o "box" para exibi��o
    oView:EnableTitleView("VIEWSz5", "Visualiza��o dos Alunos")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWSz5","Tela")
return oView

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCModelo1' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCModelo1' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCModelo1' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCModelo1' OPERATION 5 ACCESS 0
    //ADD OPTION aRotina TITLE 'Mensagem'   ACTION 'U_Mensagem'         OPERATION 6 ACCESS 0
   

Return aRotina

User Function Mensagem()

    MsgInfo("Est� � a mensagem teste!", "Criando uma fun��o em um fonte MCV")

return
