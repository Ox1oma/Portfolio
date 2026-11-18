CoordMode, Mouse, Screen

XButton2::
    MouseGetPos, x, y
    Send, {w down}{space down}
    Sleep, 150
    Send, {w up}{space up}
    Send, {F1 down}
    MoveMouse(1200, 0)
return


MoveMouse(x=0, y=0){
    DllCall("mouse_event", "UInt", 0x01, "Int", x, "Int", y, "UInt", 0, "Int", 0)
}


F8::ExitApp
