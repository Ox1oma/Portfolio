x := 0
y := 0

F2::
    InputBox, x
    InputBox, y
    Tooltip, %x% %y%
return


F1::MouseMove, %x%, %y%

F8::ExitApp