#include 'protheus.ch'
#include 'FWMVCDef.ch'

User Function ModeloXMVC()
    
    Local aArea := GetArea()
    Local oBrowse := FWMBrowse():New()
    
    oBrowse:SetAlias("SZ2")
    
    oBrowse:Activate()
    
    aArea:RestArea(aArea) 
return

/*Static Function MenuDef()
return aRotina

Static Function ModelDef()
return oModel

Static Function ViewDef()
return oView
*/
