colors_list := []

Loop{
    MouseGetPos, x, y
    PixelGetColor, c, x, y, RGB

    r := (c >> 16) & 0xFF
    g := (c >> 8) & 0xFF
    b := c & 0xFF

    ToolTip % "[" r ", " g ", " b "]"
}

F1::
    MouseGetPos, x, y
    PixelGetColor, c, x, y, RGB

    r := (c >> 16) & 0xFF
    g := (c >> 8) & 0xFF
    b := c & 0xFF

    colors_list.Push([r, g, b])
return

F2::
    output := ""

    for index, c in colors_list
        output .= index ": [" c[1] ", " c[2] ", " c[3] "]`n"

    MsgBox % output
return

F3::colors_list := []

F8::ExitApp
