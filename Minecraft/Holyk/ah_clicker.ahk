#MaxThreadsPerHotKey, 2
CoordMode, ToolTip, Screen

status := False

show_status(status)


XButton1::
    status := !status
    show_status(status)

    while(status){
        PressKey("LButton")
        RandomSleep(1, 100)
    }
return


show_status(status="None", xpos=0, ypos=0){
    ToolTip, % GetClickerStatus(status), xpos, ypos
}

GetClickerStatus(status){
    return status ? "ON" : "OFF"
}


PressKey(key){
    sleep_rand := RandInt(1, 10)
    if(sleep_rand == 8)
        RandomSleep(1931, 4356)
    Send, {%key% down}
    RandomSleep(67, 154)
    Send, {%key% up}
}


RandomSleep(min, max){
    Sleep, % RandInt(min, max)
}


;распределение со смещением к центру
RandInt(min, max){
    Random, rand1, %min%, %max%
    Random, rand2, %min%, %max%

    rand := Round((rand1 + rand2) / 2)
    return rand
}

RandFloat(min, max){
    Random, rand1, %min%, %max%
    Random, rand2, %min%, %max%

    rand := (rand1 + rand2) / 2
    return rand
}

F8::ExitApp