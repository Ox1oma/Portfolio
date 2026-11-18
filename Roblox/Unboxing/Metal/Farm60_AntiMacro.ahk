CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen

accounts := ["{F2}", "{F3}", "{F4}", "{F5}", "{F6}", "{F7}", "{F8}", "{F9}"]
perks := [1, 2, 3, 4]
step := 1

change_perk_button_x := 830
change_perk_button_y := 914

ToolTip, | 💢XButton1 to start💢 |, 440, 0

F10::hit_metal()
MButton::change_perks()
XButton2::use_perks()
XButton1::farm()


farm(){
    global step, change_perk_button_x, change_perk_button_y

    ToolTip_x := 440
    ToolTip_y := 0
    
    seconds := 0

    ToolTip, | 💤Starting... |, ToolTip_x, ToolTip_y

    SendInput, {F1}

    ;delete ball
    RandomClick(change_perk_button_x, change_perk_button_y, -20, 23, -26, 30)
    RandomSleep(303, 430)

    RandomClick(change_perk_button_x, change_perk_button_y, -20, 23, -26, 30)
    RandomSleep(101, 160)

    ;spawn metal
    PressKey("2")
    RandomSleep(19, 25)

    ;change perks
    change_perks()
    RandomSleep(10, 23)

    ;hit metal
    hit_metal()
    RandomSleep(100, 160)
    hit_metal()


    ;wait for enough boxes
    delay := RandInt(35, 40)
    while(seconds < delay){
        Sleep, 1000
        seconds += 1
        
        time := delay-seconds
        
        ToolTip, | Change perks on metals in: 🔸%time%🔸 |, ToolTip_x, ToolTip_y
    }
    change_perks()
    seconds := 0

    ;wait for charging metals
    delay := RandInt(6, 8)
    while(seconds < delay){
        Sleep, 1000
        seconds += 1
        
        time := delay-seconds
        
        ToolTip, | Spawn ball in: 🔸%time%🔸 |, ToolTip_x, ToolTip_y
    }
    ;spawn ball
    PressKey(4)
    seconds := 0
    
    ;wait for while metals get giants
    delay := RandInt(6, 8)
    while(seconds < delay){
        Sleep, 1000
        seconds += 1
        
        time := delay-seconds
        
        ToolTip, | Spawn metals in: 🔸%time%🔸 |, ToolTip_x, ToolTip_y
    }
    use_perks()

    SoundBeep, 440, 1000

    ToolTip, | 💢XButton1 to start💢 |, ToolTip_x, ToolTip_y
    
}


hit_metal(){
    global accounts

    for i, val in accounts{
        SendInput, %val%
        Sleep, 60

        RandomClick(959, 226, -100, 100, 0, 83)
        RandomSleep(20, 36)
    }

    SendInput, {F1}
}


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


PressKey(key){
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

GetRandomPerk(){
    global perks

    Random, random_index, 1, % perks.Length()

    perk := perks[random_index]

    perks.RemoveAt(random_index) 

    return perk
}


Choise(arr){
    Random, random_index, 1, % arr.Length()
    random_number := arr[random_index]
    return random_number
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

