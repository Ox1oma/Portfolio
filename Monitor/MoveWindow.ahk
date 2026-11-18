edit_mode := False


^+1::MoveWindow("1")
^+2::MoveWindow("2")


MoveWindow(window){
    leftMonitorWidth := 1440
    leftMonitorHeight := 900
    centerMonitorWidth := 1920
    centerMonitorHeight := 1080
    rightMonitorWidth := 1366
    rightMonitorHeight := 768

    activeWindow := WinActive("A")
    
    if(activeWindow == 0){
        return
    }
    
    WinGet, minMax, MinMax, ahk_id %activeWindow%
    
    if(minMax == 1){
        WinRestore, ahk_id %activeWindow%
    }

    WinGetPos, x, y, width, height, ahk_id %activeWindow%
    
    if(window == "1"){
        if(x < 0){
            if(minMax){
                WinRestore, ahk_id %activeWindow%
            }
        }
        
        else if(x >= 0 && x < centerMonitorWidth){
            xScale := leftMonitorWidth / centerMonitorWidth
            yScale := leftMonitorHeight / centerMonitorHeight
            newX := x * xScale
            newY := y * yScale
            newWidth := width * xScale
            newHeight := height * yScale
            newX := newX - leftMonitorWidth
        }
        
        else{
            x := x - centerMonitorWidth
            xScale := leftMonitorWidth / centerMonitorWidth
            yScale := leftMonitorHeight / centerMonitorHeight
            newX := (x * xScale) - leftMonitorWidth
            newWidth := width * xScale
            newHeight := height * yScale
        }
        
    }
    
    else if(window == "2"){
        if(x >= 0 && x < centerMonitorWidth){
            if(minMax){
                WinRestore, ahk_id %activeWindow%
            }
        }
        
        else if(x < 0){
            xScale := centerMonitorWidth / leftMonitorWidth
            yScale := centerMonitorHeight / leftMonitorHeight
            x := leftMonitorWidth + x
            newX := x * xScale
            newY := y * yScale
            newWidth := width * xScale
            newHeight := height * yScale
        }
        
        else{
            xScale := centerMonitorWidth / rightMonitorWidth
            yScale := centerMonitorHeight / rightMonitorHeight
            x := x - centerMonitorWidth
            newX := x * xScale
            newY := y * yScale
            newWidth := width * xScale
            newHeight := height * yScale
        }
    }
        
    WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
    
    if(minMax = 1){
        WinMaximize, ahk_id %activeWindow%
    }
        
    WinActivate ahk_id %activeWindow%
}


~F8::
    if(edit_mode){
        ExitApp
    }
return

