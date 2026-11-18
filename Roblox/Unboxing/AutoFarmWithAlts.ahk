#MaxThreadsPerHotKey, 2
CoordMode, ToolTip, Screen

accounts := ["{F2}", "{F3}", "{F4}", "{F5}", "{F6}", "{F7}", "+{F1}", "+{F2}"]

x := 20
y := 0

MButton::use_perks()

^F9::
    while(True){
        Click, Up
        ToolTip, Kick timer reset..., x, y

        use_perks()       
                 
        seconds := 0
        minutes := 0

        while(minutes < 15){
            if (seconds >= 60){
                seconds := 0
                minutes := minutes + 1
            }
            
            Sleep, 1000

            seconds := seconds + 1
            ToolTip, Mins: %minutes% | Seconds: %seconds% || 15 min, x, y
        }
    }
return

F8::ExitApp

use_perks(){
    global accounts
    
    for i, val in accounts{
        SendInput, %val%
        Sleep, 500
        SendInput, {1}{2}{3}{4}
        Sleep, 200
    }

    Send, {NumpadDot}
    Sleep, 1000
    Send, {F1}
    Sleep, 200

}