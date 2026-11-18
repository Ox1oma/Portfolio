WinGet, RobloxID, List, ahk_class WINDOWSCLIENT

while(True){
    Loop, %RobloxID%{
        currentID := RobloxID%A_Index%
        WinActivate, ahk_id %currentID%
        MouseGetPos, x, y
        MouseMove, x-1, y, 0
        MouseMove, x+1, y, 0
        Click, 769 472
        Sleep, 500
    }
}

F8::ExitApp