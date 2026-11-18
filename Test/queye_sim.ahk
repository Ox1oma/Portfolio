#MaxThreadsPerHotKey, 2
CoordMode, ToolTip, Screen
status := False

show_status(status)

XButton1::
    status := !status
    show_status(status)
    
    while(status){
        Click, 492 683
        Sleep, 300
        Click, 434 972
        Sleep, 300
        Click, 375 651
        Sleep, 300
        Click, 349 979
        Sleep, 300
    }
return

show_status(status="None", xpos=0, ypos=0){
    ToolTip, % bool_to_status(status), xpos, ypos
}

bool_to_status(status){
    return status ? "ON" : "OFF"
}

F8::ExitApp