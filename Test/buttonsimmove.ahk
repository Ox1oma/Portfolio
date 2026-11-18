#MaxThreadsPerHotKey, 2
status := False

XButton1::
    status := !status
    
    while(status){
        Send, {w down}
        Sleep, 650
        Send, {w up}
        Sleep, 500
        Send, {d down}
        Sleep, 500
        Send, {d up}
        Sleep, 400
        Send, {w down}
        Sleep, 600
        Send, {w up}
        Sleep, 400
        Send, {a down}
        Sleep, 400
        Send, {a up}
        Sleep, 400
        Send, {s down}
        Sleep, 600
        Send, {s up}
        Sleep, 400
        Send, {a down}
        Sleep, 100
        Send, {a up}
        Sleep, 400
        Send, {s down}
        Sleep, 650
        Send, {s up}

        Sleep, 500
    }
return

F8::ExitApp