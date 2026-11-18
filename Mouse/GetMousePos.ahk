CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen

coord_list := []
x := 0
y := 0

Loop{
    MouseGetPos, x, y
    ToolTip, X:%x% Y:%y%
}

F1::
    coord := "x:" . x . " y:" . y
    coord_list.Push(coord)
return
    

F2::
    output := ""

    for index, coord in coord_list
        output .= index . ": " . coord . "`n"

    MsgBox, %output%
return

F3::coord_list := []

F8::ExitApp