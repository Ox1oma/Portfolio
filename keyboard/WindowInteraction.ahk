SetWinDelay, -1

move_speed := 100
win_resize := 100

!Enter::
    WinGet, state, MinMax, A

    if(state == 1)
        WinRestore, A
    if(state == 0)
        WinMaximize, A
return


!+Left::move(-move_speed, 0)
!+Right::move(move_speed, 0)
!+Up::move(0, -move_speed)
!+Down::move(0, move_speed)

^+Left::resize(-win_resize, 0)
^+Right::resize(win_resize, 0)
^+Up::resize(0, -win_resize)
^+Down::resize(0, win_resize)


move(xShift, yShift){
    WinGetPos, x, y,,, A
    WinMove,A,, % x+xShift, % y+yShift
}

resize(xResize, yResize){
    WinGetPos,,, w, h, A
    WinMove, A,,,, % w+xResize, % h+yResize
}
