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

/*/{Protheus.doc} DiaToalha

API de integração para o App Dia Toalha.

@author		Jose Camilo
@since		25/05/2021
/*/
WSRESTFUL DiaToalha DESCRIPTION 'API de integração para o Cadastro de Toalhas.'

  WSMETHOD POST p1;
    DESCRIPTION '';
    WSSYNTAX '/api/diatoalha/v1/toalha' ;
    PATH '/api/diatoalha/v1/toalha' ;
    TTALK 'v1' ;
    PRODUCES APPLICATION_JSON

ENDWSRESTFUL

/*/{Protheus.doc} POST p1
/api/diatoalha/v1/toalha
Inclui Toalha Personalizada

@author		Jose Camilo
@since		25/05/2021
@version	1.0
/*/
WSMETHOD POST p1 WSSERVICE DiaToalha

Local lRet			  := .T.
Local oResponse   := JsonObject():New()
Local oBody       := JsonObject():New()
Local cBody       := self:GetContent()

Local cErroBlk    := ''
Local oException	:= ErrorBlock({|e| cErroBlk := + e:Description + e:ErrorStack, lRet := .F. })


Begin Sequence
  oBody:fromJson(cBody)
    oBody['codigo'] := GetSX8Num("PAZ","PAZ_CODIGO")

  RecLock('PAZ', .T.)
    PAZ->PAZ_CODIGO  := oBody['codigo']
    PAZ->PAZ_NOME    := oBody['nome']
    PAZ->PAZ_TAMANH  := oBody['tamanho']
    PAZ->PAZ_COR     := oBody['cor']
    PAZ->PAZ_MATERI  := oBody['material']
    PAZ->PAZ_PESO    := oBody['peso']
    PAZ->PAZ_ESTAMP  := oBody['estampa']
  MsUnlock()
  ConfirmSX8()

End Sequence

ErrorBlock(oException)

// Verifica errorBlock
If lRet
  self:SetResponse(oBody:toJson())
Else
  oResponse['code'] := 1
  oResponse['status'] := 500
  oResponse['message'] := 'Aconteceu um erro inesperado no serviço!'
  oResponse['detailedMessage'] := cErroBlk
EndIf

If !lRet
  SetRestFault( oResponse['code'],;
                oResponse['message'],;
                .T.,;
                oResponse['status'],;
                oResponse['detailedMessage'];
              )
EndIf

If ValType(oResponse) <> 'U'
  oResponse:DeActivate()
  oResponse := nil
EndIf
Return lRet
