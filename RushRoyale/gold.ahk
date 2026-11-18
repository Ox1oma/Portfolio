#MaxThreadsPerHotkey 2
status := False

F1::
    status := !status
    while(status){
        Click, 695 289
        Sleep, 300
        Click, 788 330
        Sleep, 300
        Click, 672 716
        Sleep, 300
        Click, 682 716
        Sleep, 300
    }
return

F8::ExitApp