sleep_min := 10
sleep_max := 150


XButton1::
    while(true){
        MoveTo(524, 591)
        MoveTo(952, 437)
        MoveTo(961, 702)
        MoveTo(901, 704) 
    }
return

MoveTo(x, y){
    global sleep_min, sleep_max
    
    random_x := Random(2, 25)
    random_y := Random(1, 13)
    random_sleep := Random(sleep_min, sleep_max)
    
    x := x + random_x
    y := y + random_y
    Click, %x% %y%
    Sleep, %random_sleep%
}


Random(min, max){
    Random, rand, %min%, %max%
    return rand
}




F8::ExitApp