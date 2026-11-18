F1::
    InputBox, num1, |Sqrt| ,,, 50, 100
    num2 := Sqrt(num1)
    Loop{
        ToolTip, √%num1% = %num2%
        if GetKeyState("F1"){
            break
        }
    }
    return


F8::ExitApp