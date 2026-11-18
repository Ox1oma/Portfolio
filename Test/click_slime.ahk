#MaxThreadsPerHotKey, 2

status := False

F1::
    status := !status
    
    ToolTip, %status%
    Sleep, 400
    ToolTip

    while(status){
        Send, {f down}{f up}
        Sleep, 10
        Click
    }
   
    ToolTip, %status%
    Sleep, 400
    ToolTip

return

F8::ExitApp