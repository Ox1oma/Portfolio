while(True){
    if(GetKeyState("XButton2", "P")){
        SendInput, {control down}
        KeyWait, XButton2
        SendInput, {control up}
    }
}

F8::ExitApp
