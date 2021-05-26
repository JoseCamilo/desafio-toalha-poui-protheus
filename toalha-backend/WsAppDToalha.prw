#INCLUDE 'TOTVS.CH'
#INCLUDE 'RESTFUL.CH'

/*/{Protheus.doc} WsAppDToalha
Dummy Function
@author Jose Camilo
@since 25/05/2021
@version 1.0
/*/
User Function WsAppDToalha()
return .T.

/*/{Protheus.doc} AcessosNegocios

API de integração para o App Dia Toalha.

@author		Jose Camilo
@since		25/05/2021
/*/
WSRESTFUL DiaToalha DESCRIPTION 'API de integração para o Cadastro de Acessos do CRM.'

  WSMETHOD GET g1;
    DESCRIPTION '';
    WSSYNTAX '/api/diatoalha/v1/info' ;
    PATH '/api/diatoalha/v1/info' ;
    TTALK 'v1' ;
    PRODUCES APPLICATION_JSON

ENDWSRESTFUL

/*/{Protheus.doc} GET g1
/api/diatoalha/v1/info


@author		Jose Camilo
@since		25/05/2021
@version	1.0
/*/
WSMETHOD GET g1 WSSERVICE DiaToalha

Local lRet			  := .T.
Local oResponse   := JsonObject():New()
Local cAuth      := AllTrim(httpHeader('Authorization'))

Local cErroBlk    := ''
Local oException	:= ErrorBlock({|e| cErroBlk := + e:Description + e:ErrorStack, lRet := .F. })

If lRet
  Begin Sequence

    If ValType(cAuth) == 'U'
      conout('APPTOALHA Auth indefinido')
    Else
      conout('APPTOALHA', cAuth)
    EndIf

  End Sequence

  ErrorBlock(oException)

  // Verifica errorBlock
  If lRet
    oResponse['status'] = 'ok'
    self:SetResponse(oResponse:toJson())
  Else
    oResponse['code'] := 1
    oResponse['status'] := 500
    oResponse['message'] := 'Aconteceu um erro inesperado no serviço!'
    oResponse['detailedMessage'] := cErroBlk
  EndIf
EndIf

If !lRet
  SetRestFault( oResponse['code'],;
                U_EspecMsg(oResponse['message']),;
                .T.,;
                oResponse['status'],;
                U_EspecMsg(oResponse['detailedMessage']);
              )
EndIf

If ValType(oResponse) <> 'U'
  oResponse:DeActivate()
  oResponse := nil
EndIf
Return lRet
