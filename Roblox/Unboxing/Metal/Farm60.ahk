CoordMode, ToolTip, Screen

accounts := ["{F2}", "{F3}", "{F4}", "{F5}", "{F6}", "{F7}", "{F8}"]
step := 1

ToolTip, | 💢XButton1 to start💢 |, 440, 0
XButton1::farmV2()

F10::hit_metal()
MButton::change_perks()
XButton2::use_perks()

hit_metal(){
    global accounts
    for i, val in accounts{
        SendInput, %val%
        Sleep, 60
        MouseGetPos, x, y
        MouseMove, x-10, y, 0
        MouseMove, x+10, y, 0
        Click, 796 493
        Sleep, 20
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

show_data(add_data=""){
    global step
    
    add_data := define_infoV2()
    
    ToolTip, ⸻⸻⸻⸻`n| Step:  %step% `n| Info: %add_data% `n⸻⸻⸻⸻ , 440, 0
}

define_infoV1(){
    global step
    
    if(step == 1)
        return "Spawn metal on main"    
        
    else if(step == 2)
        return "Change perks | Hit metal"
            
    else if(step == 3)
        return "Equip metals on alts"
            
    else if(step == 4){
        return "Use ball"
    }

    else if(step == 5){
        return "Spawn metals on alts"
    }
    
    else if(step == 6){
        return "Delete balls"
    }

}


define_infoV2(){
    global step
    
    if(step == 1)
        return "●Delete ball`n●Spawn metal`n●Change perks`n●Hit metal x2"    
        
    else if(step == 2)
        return "`n●Change perks`n🌐Wait 10 seconds🌐`n●Spawn ball`n🌐Wait 8 seconds🌐`n●Spawn metals"
}


farmV1(){
    global step
    
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
        Sleep, 1000
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
        
    show_data()

}


farmV2(){
    global step
    x := 440
    y := 0
    seconds := 0
    
    ToolTip, | 💤Starting... |, x, y

    SendInput, {F1}
    
    Click, 882 929
    Sleep, 300
    Click, 882 929
    Sleep, 100
    
    ToolTip, | 💤Starting.. |, x, y
    
    SendInput, {3}
    Sleep, 20
    
    change_perks()
    Sleep, 10
    
    ToolTip, | 💤Starting. |, x, y
    
    hit_metal()
    ToolTip, | 💤Starting.. |, x, y
    Sleep, 100
    ToolTip, | 💤Starting... |, x, y
    hit_metal()
    
    while(seconds < 37){
        Sleep, 1000
        seconds += 1
        
        time := 37-seconds
        
        ToolTip, | Change perks on metals in: 🔸%time%🔸 |, x, y
    }
    change_perks()
    
    
    seconds := 0

    
    while(seconds < 8){
        Sleep, 1000
        seconds += 1
        
        time := 8-seconds
        
        ToolTip, | Spawn ball in: 🔸%time%🔸 |, x, y
    }
    SendInput, {4}
    
    seconds := 0
    
    while(seconds < 7){
        Sleep, 1000
        seconds += 1
        
        time := 7-seconds
        
        ToolTip, | Spawn metals in: 🔸%time%🔸 |, x, y
    }
    
    use_perks()
                
    ToolTip, | 💢XButton1 to start💢 |, x, y

}

!F8::ExitApp
