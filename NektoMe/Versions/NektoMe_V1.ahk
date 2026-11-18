send_message(text="Text=None", timer=10, delay=0)
{
    iter := 0
    while(iter < timer)
    {
        Send, 1
	iter := iter + 1
	Sleep, 50
	ToolTip, %iter%, 0, -33
    }

    Send, {Ctrl down}{a}{Ctrl up}%text%{Enter}
    Sleep, %delay%
    ToolTip
}

;----------------------------------------------------

F1:: ;скип
    Click, 892 69
    Sleep, 50
    Click, 744 456		
    Sleep, 400
    Click, 774 537
    return

XButton1:: ;сообщения
    
    send_message("я вас категорически приветствую", 50)
    send_message("Дмитрий 40", 40)
    send_message("jfdal;jfkla;sd", 40)
    send_message("сосать америка", 50)
    send_message("error 42", 40)

    return


F2::Reload
XButton2::Pause
F8::ExitApp
