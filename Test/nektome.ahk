RandomDelay(min, max) {
    Random, rand, %min%, %max%
    return rand
}


PressKey(key) {
    vk := GetKeyVK(key)
    sc := GetKeySC(key)

    DllCall("keybd_event", "UInt", vk, "UInt", sc, "UInt", 0, "UInt", 0)
    delay := RandomDelay(40, 60)
    Sleep, delay
    DllCall("keybd_event", "UInt", vk, "UInt", sc, "UInt", 2, "UInt", 0)
}

test_send(text="None") {
    Loop, Parse, text
    {
        PressKey(A_LoopField)
        delay := RandomDelay(30, 50)

        Sleep, delay
    }
    PressKey("Enter")
}

slp := 3000
XButton1::
    test_send("Привет")
    Sleep, slp
    test_send("Сколько лет?")
    Sleep, slp
    test_send("Мне 8")
    Sleep, slp
    test_send("Как зовут?")
    Sleep, slp
    test_send("Я Влад")
    Sleep, % slp + 5000
    test_send("Приятно")
    Sleep, slp

return

F8::ExitApp