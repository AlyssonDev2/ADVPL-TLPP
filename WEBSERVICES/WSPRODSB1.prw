#Include 'Protheus.ch'
#Include 'APWEBSRV.CH'
#Include 'TOPCONN.CH'

//Estrutura de dados do Produto
WSSTRUCT StProduto
    WSDATA  produtoB1COD        AS STRING OPTIONAL
    WSDATA  produtoB1DESC       AS STRING OPTIONAL
    WSDATA  produtoB1UM         AS STRING OPTIONAL
    WSDATA  produtoB1TIPO       AS STRING OPTIONAL
    WSDATA  produtoB1POSIPI     AS STRING OPTIONAL
    WSDATA  produtoB1GRUPO      AS STRING OPTIONAL //Buscar da SBMa trav�s de posicione
ENDWSSTRUCT

//Estrutura de Dados para retorno de mensagem
WSSTRUCT StRetMsgProd
    WSDATA cRet         AS STRING OPTIONAL
    WSDATA cMessage     AS STRING OPTIONAL
ENDWSSTRUCT

//Classe de dados para retorno geral, aqui ser� uma ponte para as duas classes/estrutuas acima
WSSTRUCT STRetGeralProd
    WSDATA WsBuscaProd  AS StProduto  
    WSDATA WsRetMsg     AS StRetMsgProd  
ENDWSSTRUCT


WSSERVICE WSPRODSB1   DESCRIPTION "Servi�o para retornar os dados de um PRODUTO espec�fico"
//Parametro de entrada
WSDATA _cCodProduto     AS STRING

//Parametro de retorno Atrav�s deste dado, ele acessar� a classe de dados STRetGeralProd, e atrav�s dela, acessar� o StProduto e o StREtMsgProd
WSDATA WsRetornoGeral   AS STRetGeralProd

//M�todo
WSMETHOD BuscaProduto DESCRIPTION  "Lista dados do PRODUTO atrav�s do C�digo"

ENDWSSERVICE


WSMETHOD BuscaProduto WSRECEIVE _cCodProduto WSSEND WsRetornoGeral WSSERVICE WSPRODSB1

Local cCodProduto   := ::_cCodProduto

DbSelectArea("SB1")
SB1->(DbSetOrder(1))

IF SB1->(DbSeek(xFilial("SB1")+cCodProduto))
        ::WSRetornoGeral:WsRetMsg:cRet                      := "[T]"
        ::WsRetornoGeral:WsRetMsg:cMessage                  := "Sucesso! O produto foi encontrado"

        ::WsRetornoGeral:WsBuscaProd:produtoB1COD           :=  SB1->B1_COD
        ::WsRetornoGeral:WsBuscaProd:produtoB1DESC          :=  SB1->B1_DESC
        ::WsRetornoGeral:WsBuscaProd:produtoB1UM            :=  SB1->B1_UM
        ::WsRetornoGeral:WsBuscaProd:produtoB1TIPO          :=  SB1->B1_TIPO
        ::WsRetornoGeral:WsBuscaProd:produtoB1POSIPI        :=  SB1->B1_POSIPI
        ::WsRetornoGeral:WsBuscaProd:produtoB1GRUPO         :=  Posicione("SBM",1,xFilial("SBM")+SB1->B1_GRUPO,"BM_DESC")

ELSE
        ::WSRetornoGeral:WsRetMsg:cRet                      := "[F]"
        ::WsRetornoGeral:WsRetMsg:cMessage                  := "Erro! Produto n�o encontrado. Verifique o c�digo e tente novamente."
ENDIF

SB1->(DbCloseArea())

RETURN .T.

