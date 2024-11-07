#Include 'Protheus.ch'
#Include 'APWEBSRV.CH'
#Include 'TOPCONN.CH'

//Estrutura de dados do Produto
WSSTRUCT StProd
    WSDATA produtoB1cod     AS STRING OPTINAL
    WSDATA produtoB1desc    AS STRING OPTINAL
    WSDATA produtoB1unidade AS STRING OPTINAL
    WSDATA produtoB1tipo    AS STRING OPTINAL
    WSDATA produtoB1NCM     AS STRING OPTINAL
    WSDATA produtoB1grupo   AS STRING OPTINAL
ENDWSSTRUCT

//Estrutura de Dados para retorno de mensagem
WSTRUCT StRetMsgProduto
    WSDATA cRet      AS STRING OPTIONAL
    WSDATA cMenssage AS STRING OPTINAL
ENDWSSTRUCT

WSSTRUCT STRetGeralProd
    WSDATA WSSTProduto AS StProd
    WSDATA WSSTRetMsg  AS StRetMsgProduto
ENDWSSTRUCT

WSSERVICE WSPROSB1 DESCRIPTION "Serviço para retornar os dados dos produtos"
    WSDATA _cCodProduto   AS STRING
    WSDATA STRetGeralProd AS STRetGeralProd
    

    WSMETHOD BuscaProduto DESCRIPTION "Busca produto com base no código"
ENDWSSERVICE

//       MÉTODO       PARAMETRO DE ENTRADA   RETORNO DO WS         WS A QUAL PERTENCE
WSMETHOD BuscaProduto WSRECEIVE _cCodProduto WSSEND STRetGeralProd WSSERVICE WSPROSB1
    Local cProCod := ::_cCodProduto
    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))

    IF SB1->(DbSeek(xFilial("SB1")+cProCod))
        ::STRetGeralProd:WSSTRetMsg:cRet              := "[T]"
        ::STRetGeralProd:WSSTRetMsg:cMessage          := "Sucesso"
        ::STRetGeralProd:WSSTProduto:produtoB1cod     := SB1->B1_COD
        ::STRetGeralProd:WSSTProduto:produtoB1desc    := SB1->B1_DESC
        ::STRetGeralProd:WSSTProduto:produtoB1unidade := SB1->B1_UM
        ::STRetGeralProd:WSSTProduto:produtoB1tipo    := SB1->B1_TIPO
        ::STRetGeralProd:WSSTProduto:produtoB1NCM     := SB1->B1_EX_NCM
        ::STRetGeralProd:WSSTProduto:produtoB1grupo   := SB1->B1_GRUPO
    ELSE
        ::STRetGeralProd:WSSTRetMsg:cRet              := "[F]"
        ::STRetGeralProd:WSSTRetMsg:cMessage          := "Não existe resultado para a pesquisa."
    ENDIF

    SB1->(DbCloseArea())
RETURN .T.


