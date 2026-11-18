SetTitleMatchMode, 2

isPriorityMode := False


NumpadAdd::SoundSet, +5
NumpadSub::SoundSet, -5
Numpad8::SoundSet, +1
Numpad2::SoundSet, -1

Numpad7::Send, {Volume_mute}


Numpad4::send_command("Media_Prev", 12 << 16, isPriorityMode) 

Numpad6::send_command("Media_Next", 11 << 16, isPriorityMode) 


Numpad5::send_command("Media_Play_Pause", 14 << 16, isPriorityMode)
!Numpad5::Send, {Media_Play_Pause}
;XButton1::send_command("Media_Play_Pause", 14 << 16, isPriorityMode)
;XButton2::send_command("Media_Play_Pause", 14 << 16, isPriorityMode)

^Numpad5::
    isPriorityMode := !isPriorityMode
    
    show_mode(isPriorityMode)   
return

send_command(command, command_code, mode, target_app="Chrome.exe"){
    if (mode){
        if WinExist("ahk_exe " target_app)
            PostMessage, 0x319, 0, command_code, , ahk_exe %target_app%
        else
            Send, % "{" command "}"
    } 
    else
        Send, % "{" command "}"
}

show_mode(mode){
    ToolTip, % mode ? "Chrome" : "Yandex"
    Sleep, 1000
    ToolTip
}
