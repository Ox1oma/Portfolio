IDs := GetID()

F3::
    output := ""
    for index, ID in IDs
        output .= index . ": " . ID . "`n"
    MsgBox, %output%
return

GetId(){
    WinGet, ChromeID, ID, ahk_class Chrome_WidgetWin_1
    WinGet, DuckDuckGoID, ID, ahk_class HwndWrapper[DuckDuckGo;;69212315-06b2-4809-a06e-af9e5d7800b9]
    
    return [ChromeID, DuckDuckGoID]
}


F8::ExitApp