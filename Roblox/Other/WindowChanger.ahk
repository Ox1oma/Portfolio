WinGet, RobloxID, List, ahk_class WINDOWSCLIENT

F1::WinActivate, ahk_id %RobloxID1%
F2::WinActivate, ahk_id %RobloxID2%
F3::WinActivate, ahk_id %RobloxID3%
F4::WinActivate, ahk_id %RobloxID4%
F5::WinActivate, ahk_id %RobloxID5%
F6::WinActivate, ahk_id %RobloxID6%
F7::WinActivate, ahk_id %RobloxID7%
F8::WinActivate, ahk_id %RobloxID8%


F9::
    WinGet, RobloxID, List, ahk_class WINDOWSCLIENT
    MsgBox, ID list Updated
return

;open_close_window(RobloxID){
;    if WinActive("ahk_id " RobloxID)
;        WinMinimize, ahk_id %RobloxID%
;    else
;        WinActivate, ahk_id %RobloxID%
;}

LShift & F8::ExitApp
