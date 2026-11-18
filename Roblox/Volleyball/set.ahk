while(True){
    if(GetKeyState("XButton1", "P")){
        SendInput, {q down}
        KeyWait, XButton1
        SendInput, {q up}
    }
}

F8::ExitApp