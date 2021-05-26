#include 'totvs.ch'

/*/{Protheus.doc} AppDToalha
Function App Dia Toalha
@author Jose Camilo
@since 25/05/2021
@version 1.0
/*/
User Function AppDToalha
Local aSize := MsAdvSize(.F.)

DEFINE DIALOG oDlg TITLE "App Toalha" From aSize[7],0 To aSize[6],aSize[5] PIXEL
  FwCallApp( 'toalha-frontend', oDlg, /*oEngine*/, /*oChannel*/, /*cHost*/, 'AppDToalha')
oDlg:Activate()

Return

/*/{Protheus.doc} jsToAdvpl
Static chamada pelo TWebChannel
@author Jose Camilo
@since 25/05/2021
@version 1.0
/*/
Static Function jsToAdvpl(self,key,value)
Return
