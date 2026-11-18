script_status := False
clicker_status := False

ShowScriptActiveStatutes(script_status, clicker_status)


F1::
    script_status := !script_status
    ShowScriptActiveStatutes(script_status, clicker_status)
return

LButton::Click, % script_status ? "2" :  "1"
    
XButton1::
    clicker_status := True
    ShowScriptActiveStatutes(script_status, clicker_status)
    
    while GetKeyState("XButton1", "P"){
        Click, 2
    }
    
    clicker_status := False
    ShowScriptActiveStatutes(script_status, clicker_status)
return

F8::ExitApp




get_status(status){
    return status ? "ON" : "OFF"
}

ShowScriptActiveStatutes(script_status, clicker_status, xpos=0, ypos=-33){
    ToolTip, % get_status(script_status) . "|" . get_status(clicker_status), xpos, ypos
}
