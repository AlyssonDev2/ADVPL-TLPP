#include "Protheus.ch"
#include "Totvs.ch"

/*/{Protheus.doc} M030INC
Ponto de entrada após a inclusão de cliente
@type function
@version  
@author User
@since 07/11/2024
@return variant, return_description
/*/
User Function M030INC()

    Local aArea := GetArea()

    Reclock("SA1",.F.)
    
        SA1->A1_XUSRINC := RetCodUsr() //_cUsrID
    
    MsUnlock()

    MsgInfo("Você acabou de inserir com sucesso cliente o cliente:" + Chr(10)+Chr(13)+;
    m->A1_nome)

    restArea(aArea)

return
