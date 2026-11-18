RandomDelay(min, max) {
    Random, rand, %min%, %max%
    return rand
}

send_message(text="Text=None", timer=0, delay=0)
{
    step := 0
    while(step < timer)
    {
        Send, 1
        step += 1
        Sleep, % RandomDelay(40, 60)
        ToolTip, %step%, 0, -33
    }

    Send, {Ctrl down}{a}{Ctrl up}%text%{Enter}
    Sleep, % RandomDelay(delay - 10, delay + 10)
    ToolTip
}

test_send(text="None"){
    SendInput, %text%{Enter}
}

SmoothClick(x, y) {
    MouseMove, %x%, %y%, % RandomDelay(5, 15)
    Sleep, % RandomDelay(50, 100)
    Click
}

F1:: ;скип
    SmoothClick(892, 69)
    Sleep, % RandomDelay(45, 55)
    SmoothClick(744, 456)
    Sleep, % RandomDelay(380, 420)
    SmoothClick(774, 537)
    return

XButton1::
    test_send("Привет!")
    test_send("Данные твоего паспорта")
    test_send("Код подразделения: 023-094")
    test_send("Номер: 980433")
    test_send("Серия: 97 29")
    test_send("Выдан: Отдел УФМС России")
    test_send("Твои данные")
    test_send("IP: 78.168.87. 123")
    test_send("Страна: Российская Федерация")
    test_send("92.48257")
    test_send("Широта: 92.48257")
    test_send("Долгота: 31.51993")
    test_send("Локальное время: 2025-31-26T16:14.UTC+03:00")
    test_send("Устройство: MOB")
    test_send("Тип адреса: Unicast")
    test_send("")
    test_send("")
return

F2::Reload
XButton2::Pause
F8::ExitApp