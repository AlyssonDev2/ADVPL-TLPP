#include 'Protheus.ch'
#include 'APWEBSRV.CH'
#include 'topconn.ch'


//Estrutura de dados que será retornada pelo WebService na chamada pelo Client
WSSTRUCT STCliente           
    WSDATA clienteA1LOJA    AS STRING OPTIONAL
    WSDATA clienteA1COD     AS STRING OPTIONAL
    WSDATA clienteA1BAIRRO  AS STRING OPTIONAL
    WSDATA clienteA1NOME    AS STRING OPTIONAL
    WSDATA clienteA1CPF     AS STRING OPTIONAL
    WSDATA clienteA1END     AS STRING OPTIONAL
    WSDATA clienteA1ESTADO  AS STRING OPTIONAL
    WSDATA clienteA1MUNICIP AS STRING OPTIONAL
    WSDATA clienteA1CEP     AS STRING OPTIONAL
ENDWSSTRUCT

WSSTRUCT STRetornoGeral 
    WSDATA WSSTClient AS STCliente
ENDWSSTRUCT

WSSERVICE WSCLISA1 DESCRIPTION "Serviço para retornar os dados de cliente específico"
    //Código que será requisitado pelo método de busca do cliente
    WSDATA _cCodClienteLoja AS STRING
    //Chamada da estrutura de retorno que será retornada pelo método
    WSDATA WSRetornoGeral   AS STRetornoGeral

    WSMETHOD BuscaCliente    DESCRIPTION "Busca clientes com base no código e loja"
ENDWSSERVICE

//       MÉTODO       PARAMETRO DE ENTRADA       RETORNO DO WS         WS A QUAL PERTENCE
WSMETHOD BuscaCliente WSRECEIVE _cCodClienteLoja WSSEND WSRetornoGeral WSSERVICE WSCLISA1
    Local cCliCodLoja := ::_cCodClienteLoja
    DbSelectArea("SA1")
    SA1->(DbSetOrder(1))

    IF SA1->(DbSeek(xFilial("SA1")+cCliCodLoja))
        ::WSRetornoGeral:WSSTClient:clienteA1COD     := SA1->A1_COD
        ::WSRetornoGeral:WSSTClient:clienteA1LOJA    := SA1->A1_LOJA
        ::WSRetornoGeral:WSSTClient:clienteA1NOME    := SA1->A1_NOME
        ::WSRetornoGeral:WSSTClient:clienteA1BAIRRO  := SA1->A1_BAIRRO
        ::WSRetornoGeral:WSSTClient:clienteA1CEP     := SA1->A1_CEP
        ::WSRetornoGeral:WSSTClient:clienteA1CPF     := SA1->A1_CGC
        ::WSRetornoGeral:WSSTClient:clienteA1ESTADO  := SA1->A1_EST
        ::WSRetornoGeral:WSSTClient:clienteA1MUNICIP := SA1->A1_MUN
        ::WSRetornoGeral:WSSTClient:clienteA1END     := SA1->A1_END
    ENDIF

    SA1->(DbCloseArea())
RETURN .T.

