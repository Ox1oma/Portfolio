IDs := GetID()

ID1 := IDs[1]
ID2 := IDs[2]

F1::WinActivate, ahk_id %ID1%
F2::WinActivate, ahk_id %ID2%


!XButton1::
    IDs := GetID()
    MsgBox, ID list Updated
return


GetID(){
    WinGet, ChromeID, ID, ahk_exe chrome.exe
    Winget, YandexID, ID, ahk_exe browser.exe
    return [ChromeID, YandexID]
}


F8::ExitApp
