accounts := ["{F2}", "{F3}", "{F4}", "{F5}", "{F6}", "{F7}", "+{F1}", "+{F2}"]

`::use()
MButton::use()


use(){
    Sleep, 3000
    global accounts
        for i, val in accounts{
            Send, %val%
            Sleep, 200
            Send, {1}{2}{3}{4}
            Sleep, 100
        }
    
        Send, {NumpadDot}
        Sleep, 2000
        Send, {F1}
}

F8::ExitApp