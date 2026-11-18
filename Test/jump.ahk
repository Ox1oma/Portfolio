#MaxThreadsPerHotkey 2

status := False

XButton1::
    status := !status
    
    MouseGetPos, x, y
    
    while(status){
        MouseMove, x-1, y, 0
        Sleep, 1
        MouseMove, x+1, y, 0
    }
return

F8::ExitApp