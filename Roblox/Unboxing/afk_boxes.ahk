#MaxThreadsPerHotkey, 2

status := False
xpos := 717 ; Alt
ypos := 453

;xpos := 687 ; main
;ypos := 391

XButton2::
    status := !status

    while(status){
        Send, {Right down}
        Sleep, 400
        Send, {Right up}

        Click, Down
        MouseGetPos, x, y   
        MouseMove, xpos, ypos, 0

        Loop, 5{
            MouseGetPos, x, y
            MouseMove, x-50, y
            Sleep, 300
        }
        
        MouseMove, xpos, ypos, 0
        Loop, 5{
            MouseGetPos, x, y
            MouseMove, x+100, y
            Sleep, 300
        }
    }
return


F8::ExitApp