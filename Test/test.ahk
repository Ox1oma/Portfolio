CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen


RandomSleep(min, max){
    Sleep, % RandInt(min, max)
}


RandomClick(x, y){
    Click, %x%, %y%, Down
    RandomSleep(45, 146)
    Click, Up
}

RandFloat(min, max){
    Random, rand1, %min%, %max%
    Random, rand2, %min%, %max%

    rand := (rand1 + rand2) / 2
    return rand
}

RandInt(min, max){
    Random, rand1, %min%, %max%
    Random, rand2, %min%, %max%

    rand := Round((rand1 + rand2) / 2)
    return rand
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



XButton1::MoveAndClick(0, 0)


F8::ExitApp