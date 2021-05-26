#include 'totvs.ch'
#include 'fwmvcdef.ch'

/*/{Protheus.doc} AppDToalha
Browse App Dia Toalha
@author Jose Camilo
@since 25/05/2021
@version 1.0
/*/
User Function AppDToalha
private oBrowse		:= Nil

oBrowse := FWMBrowse():New()
oBrowse:SetDescription('Cadastro de Toalhas - Dia da Toalha')
oBrowse:SetAlias('PAZ')
oBrowse:Activate()	

return

/*/{Protheus.doc} MenuDef
Menu
@author jose.camilo
@since 25/05/2021
@version 1.0
@type function
/*/
Static Function MenuDef() 
Local aRotina := {}

ADD OPTION aRotina TITLE 'Pesquisar'  ACTION 'PesqBrw'            OPERATION 1 ACCESS 0
ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.APPDTOALHA'	OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'U_NovaToalha()'     OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.APPDTOALHA' OPERATION 4 ACCESS 0

Return aRotina

/*/{Protheus.doc} ModelDef
@author jose.camilo
@since 25/05/2021
@version 1.0
@type function
/*/
Static Function ModelDef
Local oStruPAZ	:= FWFormStruct(1, 'PAZ')
Local oModel		:= Nil

oModel := MPFormModel():New('MAPPDTOALHA')
oModel:SetDescription( 'Acessos de Negócios' )

oModel:AddFields('PAZMASTER', /*cOwner*/, oStruPAZ)
oModel:SetPrimaryKey({"PAZ_FILIAL", "PAZ_CODIGO"})

Return(oModel)

/*/{Protheus.doc} ViewDef
@author jose.camilo
@since 25/05/2021
@version 1.0
@type function
/*/
Static Function ViewDef
Local oStruPAZ		:= FWFormStruct(2,'PAZ')
Local oModel		  := Nil
Local oView       := NIL

oModel		:= FWLoadModel('APPDTOALHA')

oView := FWFormView():New()
oView:SetModel(oModel)

oView:AddField('FIELDPAZ', oStruPAZ, 'PAZMASTER')

Return(oView)


/*/{Protheus.doc} NovaToalha
App Web para criar toalha
@author Jose Camilo
@since 25/05/2021
@version 1.0
/*/
User Function NovaToalha
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
