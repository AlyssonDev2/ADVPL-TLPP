#include 'protheus.ch'
#include 'FWMVCDef.ch'

/*/{Protheus.doc} zzMVCSZ2
Fonte em MVC Modelo 1 para fins de estudo
@type function
@version  
@author Alysson
@since 19/07/2024
@return variant, return_description
/*/
User Function zMVCSZ2()
    Local aArea   := GetArea() //Salva o ambiente ativo.
	Local oBrowse

    oBrowse := FWMBrowse():New()
    oBrowse:SetAlias('SZ2')

    oBrowse:SetDescription("Meu Primeiro Browse - Tela de Alunos") //Cria a título do Browse
                      //Condicional                      /Cor    /Descrição
    oBrowse:AddLegend("len(allTrim(SZ2->Z2_SERIE))<=15","GREEN", "Aluno do Ensino Médio") //Adiciona legenda
    oBrowse:AddLegend("len(alltrim(SZ2->Z2_SERIE))>15","BLUE", "Aluno do Ensino Fundamental") //Adiciona legenda
    oBrowse:SetOnlyFields({'Z2_COD','Z2_NOME','Z2_SERIE','Z2_SEXO'}) //Selecina campos a serem exibidos

    oBrowse:DisableDetails() //Desabilita detalhes do canto inferior da tela
    oBrowse:Activate()
    RestArea(aArea) //Restaura um ambiente salvo anteriormente pela função GETAREA().
Return (oBrowse)

Static Function ModelDef()
    Local oModel     := nil   
                        
    Local oStructZS2 := FWFormStruct( 1, "SZ2") //Cria a estrutura a ser usada na View (1 Model / 2 View)

    oModel := MPFormModel():New("zMVCSZ2M") 

    oModel:AddFields("FORMSZ2", /*Owner*/, oStructZS2) //Atribuindo formulário para o modelo de dados

    oModel:SetPrimaryKey({"Z2_FILIAL", "Z2_COD"}) //Definindo chave primária

    oModel:SetDescription("Modelo de dado de Cadastro de alunos")

    oModel:GetModel("FORMSZ2"):SetDescription("Formulário de Cadastro de Alunos.")

return (oModel)

Static Function ViewDef()
    // Cria um objeto de Modelo de dados baseado no ModelDef() do fonte informado
    Local oModel := FWLoadModel('zMVCSZ2')
                                    
    Local oStructZS2 := FWFormStruct( 2, "SZ2") // Cria a estrutura a ser usada na View (1 Model / 2 View)

    // Interface de visualização
    Local oView
    // Cria o objeto de View
    oView := FWFormView():New()

    // Define qual o Modelo de dados será utilizado na View
    oView:SetModel( oModel )
    oView:AddField("VIEWSZ2", oStructZS2, "FORMSZ2") //Atribuindo formulário para o modelo de dados

    // Criar um "box" horizontal para receber algum elemento da view
    oView:CreateHorizontalBox("Tela", 100)

    // Relaciona o identificador (ID) da View com o "box" para exibição
    oView:EnableTitleView("VIEWSZ2", "Visuzalização dos Alunos")

    oView:SetCloseOnok({||.T.})

    oView:SetOwnerView("VIEWSZ2","Tela")
return (oView)

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.zMVCSZ2' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.zMVCSZ2' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.zMVCSZ2' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.zMVCSZ2' OPERATION 5 ACCESS 0
    ADD OPTION aRotina TITLE 'Mensagem'   ACTION 'U_Mensagem'      OPERATION 6 ACCESS 0
    ADD OPTION aRotina TITLE 'Cadastro Personalizado'   ACTION 'u_Projeto01'      OPERATION 6 ACCESS 0
    


Return (aRotina)

User Function Mensagem()

    MsgInfo("Está é a mensagem teste!", "Criando uma função em um fonte MCV")

return
