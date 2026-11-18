IDs := GetID()

ID1 := IDs[1]
ID2 := IDs[2]

F1::
    WinActivate, ahk_id %ID1%
return

F2::
    WinActivate, ahk_id %ID2%
return

XButton1::
    IDs := GetID()
    MsgBox, ID list Updated
return

GetID(){
    WinGet, ChromeID, ID, ahk_class Chrome_WidgetWin_1
    WinGet, DuckDuckGoID, ID, ahk_class HwndWrapper[DuckDuckGo;;69212315-06b2-4809-a06e-af9e5d7800b9]
    
    return [ChromeID, DuckDuckGoID]
}
F8::ExitApp