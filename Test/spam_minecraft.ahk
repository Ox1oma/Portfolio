XButton1::send_command()


send_command(){
     SendInput, {t}
     Sleep, 100
     Send, {Up down}
     Sleep, 100
     Send, {Up up}
     Sleep, 50
     Send, {enter}
}

F8::ExitApp