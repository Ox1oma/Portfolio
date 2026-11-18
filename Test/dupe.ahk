status = False

XButton1::
    status := !status
    
    while(status){
        Click, Left
        Sleep, 500
        Click, Right
    }
return

F8::ExitApp