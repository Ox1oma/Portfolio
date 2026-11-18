#MaxThreadsPerHotKey 2
mode := False

XButton1::
    if(mode){
        Click, down
        Send, {w down}
        
        ;while(mode){
            ;Send, {space down}
            ;Send, {space up}
            
            ;if GetKeyState("XButton2", "P"){
                ;break
            ;}
        ;}
    } else{
        Click, down
    }
return   

~XButton2::
    Send, {w up} ;{space up}
    Click, up
return

F4::
    mode := !mode
    ToolTip, % mode
    Sleep, 500
    ToolTip
return

F8::ExitApp