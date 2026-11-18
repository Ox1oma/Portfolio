CoordMode, Mouse, Screen

accounts := ["{F1}", "{F2}", "{F3}", "{F4}"]


!4::
    while(True){
        for i, val in accounts{
            SendInput, %val%
            Sleep, 60
            
            if(val != "{F1}"){
                close_full_perk_inv()
                Sleep, 100
            }
            start_rush()
            Sleep, 4000
            move_to_box_field()
            Sleep, 500
            move_camera()
            Sleep, 500
            turn_on_auto()
            Sleep, 1000
        }

        Send, {NumpadDot}

        Sleep, 105000
        for i, val in accounts{
            SendInput, %val%
            Sleep, 60

           prevent_stuck()
        }

        Send, {NumpadDot}

        Sleep, 105000
        for i, val in accounts{
            SendInput, %val%
            Sleep, 60

           prevent_stuck()
        }

        Send, {NumpadDot}

        Sleep, 105000
        for i, val in accounts{
            SendInput, %val%
            Sleep, 60

           prevent_stuck()
        }

        Send, {NumpadDot}

        Sleep, 100000


        for i, val in accounts{
            SendInput, %val%
            Sleep, 60

            close_full_perk_inv() ;убирает авто, чтобы не убегали при старте
            Sleep, 100
        }
        
        Sleep, 20000
    }
return


close_full_perk_inv(){
    MouseMove, -369, 443, 0
    moveMouse(-10, 0)
    Sleep, 1
    moveMouse(10, 0)
    Click
}

start_rush(){
    Send, {a down}
    Sleep, 420
    Send, {a up}

    Sleep, 350
    Click, -444 846
}

move_to_box_field(){
    Send, {a down}
    Sleep, 2500
    Send, {a up}
}

move_camera(){
    Click, right, Down
    Sleep, 100
    moveMouse(0, -135)
    Sleep, 100
    Click, right, Up
}

turn_on_auto(){
    MouseMove, -722, 579, 0
    
    SendInput, {1}{2}{3}{4}
    Sleep, 10
    Click, Down
    Sleep, 2000
    Click, Up

    moveMouse(10, 0)
    Sleep, 10
    moveMouse(-10, 0)
}

prevent_stuck(){
    Send, {a down}
    Sleep, 100
    Send, {a up}

    Send, {d down}
    Sleep, 100
    Send, {d up}

    MouseMove, -1150, 604
    moveMouse(10, 0)
    Sleep, 2
    moveMouse(-10, 0)
    Sleep, 300

    MouseMove, -244, 598
    moveMouse(10, 0)
    Sleep, 2
    moveMouse(-10, 0)
    Sleep, 300

    MouseMove, -722, 579, 0
    moveMouse(10, 0)
    Sleep, 2
    moveMouse(-10, 0)

    SendInput, {1}{2}{3}{4}
    Sleep, 10
}

F8::ExitApp


moveMouse(x, y){
    DllCall("mouse_event", "UInt", 0x01, "Int", x, "Int", y)
}
