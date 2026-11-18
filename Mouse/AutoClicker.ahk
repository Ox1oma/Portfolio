#MaxThreadsPerHotkey 2
CoordMode, ToolTip, Screen

isHoldMode := True
isClickerStatus := False
isClickerMode := False

ShowModes(isClickerMode, isClickerStatus, isHoldMode)

~XButton1::
    isClickerStatus := !isClickerStatus
    ShowModes(isClickerMode, isClickerStatus, isHoldMode)
    
    if(isClickerMode){
        while(isClickerStatus){
            Click
            if(isHoldMode){
                if !GetKeyState("XButton1", "P"){
                    isClickerStatus := False
                    ShowModes(isClickerMode, isClickerStatus, isHoldMode)
                }
            }
        }
    }
    else{
        while(isClickerStatus){
            Click, right
            if(isHoldMode){
                if !GetKeyState("XButton1", "P"){
                    isClickerStatus := False
                    ShowModes(isClickerMode, isClickerStatus, isHoldMode)
                }
            }
        }
    }
return

F7::
    isClickerMode := !isClickerMode
    isClickerStatus := False
    ShowModes(isClickerMode, isClickerStatus, isHoldMode)
return

F2::
    isHoldMode := !isHoldMode
    ShowModes(isClickerMode, isClickerStatus, isHoldMode)
return


GetHoldMode(isHoldMode){
    return isHoldMode ? "HOLD" : "NOT HOLD"
}

GetClickerStatus(isClickerStatus){
    return isClickerStatus ? "ON" : "OFF" 
}

GetClickerMode(isClickerMode){
    return isClickerMode ? "ЛКМ" : "ПКМ"
}

ShowModes(isClickerMode, isClickerStatus, isHoldMode, xpos=50, ypos=-33){
    ToolTip, % GetClickerMode(isClickerMode) . " | " GetClickerStatus(isClickerStatus) . " | " . GetHoldMode(isHoldMode), xpos, ypos
}

F8::ExitApp

