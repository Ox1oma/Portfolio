a := False
xpos = 0
ypos = -33
showScriptActive(a, xpos, ypos){
    if(a){
        s_status := "ON"
    }
    else{
        s_status := "OFF"
    }

    ToolTip, %s_status%, xpos, ypos
}

showScriptActive(a, xpos, ypos)

LButton::
    if(a)
    {
        Click 2
    }
    else
    {
        Click
    }
    return

F1::
    a := !a
    showScriptActive(a, xpos, ypos)
    return

F8::ExitApp
