#MaxThreadsPerHotKey, 3

status = false

XButton1::
    status := !status
    
    while(status){
        Click
        Sleep, 3800
    }
return

F8::ExitApp