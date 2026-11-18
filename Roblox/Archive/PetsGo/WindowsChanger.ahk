window := 1
ToolTip, %window%
WinGet, RobloxID, List, ahk_exe Chrome.exe

F1::
    window := window + 1
    ToolTip, %window%
    
    if (window > RobloxID){
        window := 1
        ToolTip, %window%

    }
        
    currentID := RobloxID%window%
    WinActivate, ahk_id %currentID%
return

F8::ExitApp