#MaxThreadsPerHotKey, 2
CoordMode, ToolTip, Screen

mode := True
status := False

ShowMode(mode)

XButton1::
    if(mode){
        if (status)
            status := False
        else
            status := True
            
        MouseGetPos, x, y
        while(status && mode){
            MouseMove, x-500, y, 0
            MouseMove, x+500, y, 0
        }
    }
    else{
        while GetKeyState("XButton1", "P"){
            Send, {d down}
            Send,{d up}{a down}
            Send, {a up}
        }
    }
return


MButton::
    mode := !mode
    ShowMode(mode)
    
    if (mode == False)
        status := False
return


;~w & `::
    ;while GetKeyState("w", "P")
        ;Sleep, 10
        
    ;Send, {w down}
;return

;~d & `::
    ;while GetKeyState("d", "P")
        ;Sleep, 10
        
    ;Send, {d down}
;return

;~s & `::
    ;while GetKeyState("s", "P")
        ;Sleep, 10
        
    ;Send, {s down}
;return

;~a & `::
    ;while GetKeyState("a", "P")
        ;Sleep, 10
        
    ;Send, {a down}
;return

;`::ToolTip
 

get_mode(mode){
    return mode ? "Drag" : "Move"
}


ShowMode(mode, xpos=50, ypos=-33){
    ToolTip, % "mode: " . get_mode(mode), xpos, ypos
}

F8::ExitApp


