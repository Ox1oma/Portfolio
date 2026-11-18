accounts := ["{F1}", "{F2}", "{F3}", "{F4}"]


`::use_perks()

F8::ExitApp

use_perks(){
    global accounts
    
    for i, val in accounts{
        SendInput, %val%
        Sleep, 200
        SendInput, {1}{2}{3}{4}
        Sleep, 100
    }

    Send, {NumpadDot}
}

