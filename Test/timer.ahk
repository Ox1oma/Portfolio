i := 0
XButton1::
    Click, 832, 597
    while(i < 11){
        ToolTip, %i%
        Sleep, 1000
        i++
    }
    i := 0
    ToolTip
return

F8::ExitApp