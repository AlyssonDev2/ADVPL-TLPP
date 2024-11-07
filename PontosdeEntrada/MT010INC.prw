#include "Protheus.ch"
#include "Totvs.ch"

/*/{Protheus.doc} MT010INC
Ponto de esntrada após a inclusão de produto
@type function
@version  
@author User
@since 07/11/2024
@return variant, return_description
/*/
User Function MT010INC()

    MsgInfo("Você acabou de inserir o produto:"+Chr(10)+Chr(13)+;
    M->B1_DESC)

return
