i::
    if(GetKeyState("i", "P")){
        SendInput, {I down}
        KeyWait, XButton1
        SendInput, {I up}
    }
return
F8::ExitApp