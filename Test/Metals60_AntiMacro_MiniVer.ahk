CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen

accounts := ["{F2}", "{F3}", "{F4}"]
perks := [1, 2, 3, 4]

change_perk_button_x := 922
change_perk_button_y := 930

MButton::change_perks()
XButton2::use_perks()

use_perks(){
    global accounts, perks

    for i, val in accounts{
        SendInput, %val%
        Sleep, 10

        Send, % "{" GetRandomPerk() " down}"
        RandomSleep(1, 12)
        Send, % "{" GetRandomPerk() " down}"
        RandomSleep(1, 9)
        Send, % "{" GetRandomPerk() " down}"
        RandomSleep(1, 14)
        Send, % "{" GetRandomPerk() " down}"
        
        perks := [1, 2, 3, 4]
        RandomSleep(60, 120)

        Send, % "{" GetRandomPerk() " up}"
        RandomSleep(1, 10)
        Send, % "{" GetRandomPerk() " up}"
        RandomSleep(1, 8)
        Send, % "{" GetRandomPerk() " up}"
        RandomSleep(1, 13)
        Send, % "{" GetRandomPerk() " up}"

        perks := [1, 2, 3, 4]
        RandomSleep(9, 15)
    }
    
    SendInput, {F1}
}


change_perks(){
    global accounts, change_perk_button_x, change_perk_button_y
    
    for i, val in accounts{
        SendInput, %val%
        RandomSleep(8, 14)

        RandomClick(change_perk_button_x, change_perk_button_y, -20, 23, -26, 30)
        RandomSleep(9, 14)
    }

    SendInput, {F1}
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


GetRandomPerk(){
    global perks

    Random, random_index, 1, % perks.Length()

    perk := perks[random_index]

    perks.RemoveAt(random_index) 

    return perk
}


MoveTo(target_x, target_y){
    speed := 10
    jitter := 0
    radius := 50

    MouseGetPos, cur_x, cur_y
    

    dx := target_x - cur_x
    dy := target_y- cur_y

    dist := Sqrt(dx * dx + dy * dy)
    init_dist := dist

    vx := dx / dist ;cos const
    vy := dy / dist ;sin const


    while(dist > radius){

        step_x := vx * speed
        step_y := vy * speed

        cur_x += step_x + RandFloat(-jitter, jitter)
        cur_y += step_y + RandFloat(-jitter, jitter)


        MouseMove, %cur_x%, %cur_y%, 0

        dx := target_x - cur_x
        dy := target_y - cur_y

        dist := Sqrt(dx * dx + dy * dy)

        speed := Min(100, dist * RandFloat(0.50, 0.76))
        jitter := Min(10, dist * RandFloat(0.01, 0.1))
        
    }
}


RandomClick(x, y, offset_x1, offset_x2=0, offset_y1=0, offset_y2=0){
    MoveTo(x, y)
    x += RandInt(offset_x1, offset_x2)
    y += RandInt(offset_y1, offset_y2)

    Click, %x%, %y%, Down
    RandomSleep(67, 146)
    Click, Up
}


!F8::ExitApp

