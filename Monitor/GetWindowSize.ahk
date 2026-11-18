CoordMode, ToolTip, Screen

F1::
    MouseGetPos, x1, y1
    show_info()
return


F2::
    MouseGetPos, x2, y2
    show_info()
return


show_info(){
    global x1, y1, x2, y2
    result1 := Abs((x2 - x1) + 1)
    result2 := Abs((y2 - y1) + 1)
    ToolTip,first_pos: x: %x1% y: %y1%`nsecond_pos: x: %x2% y: %y2%`nsize: %result1%x%result2% , 10, 10
}


F8::ExitApp