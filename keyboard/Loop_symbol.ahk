#MaxThreadsPerHotkey, 2
CoordMode, ToolTip, Screen

symbol := "q"
status := False


show_data()

XButton2::Send, %symbol%

XButton1::
    status := !status
    show_data()

    if (symbol){
        while(status){
            Send, %symbol%
            Sleep, 10
        }
    }
return


^XButton1::
    InputBox, symbol
    show_data()
Return


show_data(){
    global symbol, status
    ToolTip, % "Symbol: " . symbol . "`nLoop: " . status , 40, -33
}

F8::ExitApp