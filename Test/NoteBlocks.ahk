F1::
    FirstStep()   
return


FirstStep(){
    iter := 0
    
    while(iter < 3){
        Click, 1
        Sleep, 450
        Click, 1
        Sleep, 450
        Click, 1
    
        MoveMouse(100, -200)
        Sleep, 350
        Click, 1
    
        MoveMouse(0, 200)
        Sleep, 400
        Click, 1
    
        MoveMouse(-100)
        Sleep, 200
        
        iter++
    }
    
    Click, 1
    Sleep, 450
    Click, 1
}

MoveMouse(x=0, y=0){
    DllCall("mouse_event", "UInt", 0x01, "Int", x, "Int", y, "UInt", 0, "Int", 0)
}

F9::ExitApp
