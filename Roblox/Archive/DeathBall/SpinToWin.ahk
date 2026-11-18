status := False
x := 600

RandomNum(min, max){
    Random, rand, %min%, %max%
    return rand
}

F2::
    status := True

    MouseGetPos, x, y
  
    while(status){
        x -= RandomNum(1, 7)
	MouseMove, x, y, 0
    }
    return

F3::
    status := False
    return

F9::ExitApp