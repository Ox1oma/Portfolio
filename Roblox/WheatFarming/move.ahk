#MaxThreadsPerHotKey 2
CoordMode, ToolTip, Screen
status := False

show_status(status)

~XButton1::
    status := !status
    show_status(status)
    delay := 2000
    
    while(status){
        Send, {a down}
        Sleep, %delay%
        Send, {a up}
        
        Send, {s down}
        Sleep, %delay%
        Send, {s up}
                
        Send, {d down}
        Sleep, %delay%
        Send, {d up}
        
        Send, {w down}
        Sleep, %delay%
        Send, {w up}
   
    }
    
    Send, {a up}{w up}{d up}{s up}
return


show_status(status="None", xpos=0, ypos=0){
    ToolTip, % GetClickerStatus(status), xpos, ypos
}

GetClickerStatus(status){
    return status ? "ON" : "OFF" 
}

F8::ExitApp

