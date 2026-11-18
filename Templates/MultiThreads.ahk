#MaxThreadsPerHotKey, 2
CoordMode, ToolTip, Screen

status := False

show_status(status)


XButton1::
    status := !status
    show_status(status)

    while(status){
    
    }
return


show_status(status="None", xpos=0, ypos=0){
    ToolTip, % GetClickerStatus(status), xpos, ypos
}

GetClickerStatus(status){
    return status ? "ON" : "OFF"
}

F8::ExitApp
