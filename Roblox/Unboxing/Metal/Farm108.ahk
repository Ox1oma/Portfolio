CoordMode, ToolTip, Screen

accounts := ["{F2}", "{F3}", "{F4}"]

XButton1::
    if(step == 1){
        step += 1
        
        SendInput, {F1}
        SendInput, {3}
    }
    
    else if(step == 2){
        step += 1
        
        change_perks()
        Sleep, 10
        hit_metal()
    }
    
    else if(step == 3){
        step += 1
        
        change_perks()
    }
    
    else if(step == 4){
        step += 1
        
        SendInput, {F1}
        SendInput, {4}
    }

    else if(step == 5){
        step += 1
        
        use_perks()
    }
    
    else if(step == 6){
        step := 1
        
        Click, 882 929
        Sleep, 300
        Click, 882 929
    }
        
return

MButton::change_perks()
XButton2::use_perks()

hit_metal(){
    global accounts
    for i, val in accounts{
        SendInput, %val%
        Sleep, 30
        MouseGetPos, x, y
        MouseMove, x-10, y, 0
        MouseMove, x+10, y, 0
        Click, 796 493
        Sleep, 10
    }

    SendInput, {F1}
}

use_perks(){
    global accounts
    
    for i, val in accounts{
        SendInput, %val%
        Sleep, 10
        SendInput, {1}{2}{3}{4}
        Sleep, 10
    }
    
    SendInput, {F1}
}

change_perks(){
    global accounts
    
    for i, val in accounts{
        SendInput, %val%
        Sleep, 30
        MouseGetPos, x, y
        MouseMove, x-10, y, 0
        MouseMove, x+10, y, 0
        Click, 866 918
        Sleep, 10
    }

    SendInput, {F1}
}

F8::ExitApp

