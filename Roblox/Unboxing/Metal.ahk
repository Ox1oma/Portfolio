`#MaxThreadsPerHotkey, 5
CoordMode, ToolTip, Screen

status := False
seconds := 0
metal_seconds := 0
minutes := 0
metal := 2
metal_count := 0

metal_time_limit := 35

show_data(True)

F10::
    InputBox, metal_seconds, ..., Metal seconds: %metal_seconds%
    show_data(True)
return

F9::
    InputBox, seconds, ..., Seconds: %seconds%
    show_data(True)
return

^F9::
    InputBox, metal, ..., Metals: %metal%
    show_data(True)
return

+F9::
    InputBox, minutes, ..., Minutes: %minutes%
    show_data(True)
return

XButton1::

    status := !status

    if (status) {
        SetTimer, MainLoop, 1000
    } else if (!status) {
        SetTimer, MainLoop, Off
        show_data(True)
    }

    if (minutes == 0 and seconds < 15){
        Send, ``
    }
return

^XButton1::

    status := False

    minutes := 0
    seconds := 0
    metal_count := 0
    metal_seconds := 0

    SetTimer, MainLoop, Off
    show_data(True)
return


MainLoop:
    seconds++
    metal_seconds++

    show_data(False)

    if (minutes == 15){
        status := False

        minutes := 0
        seconds := 0
        metal_count := 0
        metal_seconds := 0

        Send, %metal%
        SetTimer, MainLoop, Off
        show_data(True)

        return
    }

    if (metal_seconds == metal_time_limit){
        Send, %metal%
        Sleep, 200

        metal_count++
        metal_seconds := 0

        if (metal == 2){
            Send, ``
            metal := 3
        } else if(metal == 3){
            Send, ``
            metal := 4
        } else if(metal == 4){
            Send, ``
            metal := 2
        }


        show_data(False)
    }

    if (seconds >= 60) {
        seconds := 0
        minutes++
        show_data(False)
    }
return


show_data(stopped){
    global seconds, minutes, metal, metal_count, metal_seconds, change_perk_count

    data := "⸻⸻⸻⸻`n●Seconds: " . seconds . "`n●Metal seconds: " . metal_seconds . "`n●Minutes: " . minutes
    . "`n●Metal: " . metal . "`n●Metal counter: " . metal_count

    if (stopped){
        data .= "`n●Status: ⛔Inactive"
    } else{
        data .= "`n●Status: ✅Active"
    }

    data .= "`n⸻⸻⸻⸻"
    ToolTip, %data%, 440, 0
    
}



F8::ExitApp
