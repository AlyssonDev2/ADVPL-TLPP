#include "Protheus.ch"
#include "Totvs.ch"

User Function M030INC()

    Local aArea := GetArea()

    Reclock("SA1",.F.)
    
        SA1->A1_XUSRINC := RetCodUsr() //_cUsrID
    
    MsUnlock()

    MsgInfo("Você acabou de inserir com sucesso cliente o cliente:" + Chr(10)+Chr(13)+;
    m->A1_nome)

    restArea(aArea)

return
