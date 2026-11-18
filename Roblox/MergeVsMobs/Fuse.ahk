CoordMode, Mouse, Screen

cell_size_x := 100
cell_size_y := 100

top_left_x := 769
top_left_y := 391

sleep_time := 0


XButton2::fuse()


fuse(){
    fuse_1()
    Sleep, 100
    fuse_2()
    Sleep, 100
    fuse_3()
    Sleep, 200
    fuse_4()
}

fuse_1(){
    global cell_size_x, cell_size_y, top_left_x, top_left_y

    current_x := top_left_x + (cell_size_x/2)
    current_y := top_left_y + (cell_size_y/2)

    Loop, 4{ ;y
        MouseMove, current_x, current_y, 0

        Loop, 2{ ;x
            MouseMove, current_x, current_y, 0
            activate_mouse()
            Sleep, sleep_time

            Click, Down
            Sleep, sleep_time

            current_x += cell_size_x
            MouseMove, current_x, current_y, 0
            activate_mouse()
            Sleep, sleep_time

            Click, Up

            current_x += cell_size_x
        }

        current_x := top_left_x + (cell_size_x/2)
        current_y += cell_size_y

        MouseMove, current_x, current_y, 0

        SLeep, sleep_time

    }


}

fuse_2(){
    global cell_size_x, cell_size_y, top_left_x, top_left_y

    current_x := top_left_x + (cell_size_x*1.5)
    current_y := top_left_y + (cell_size_y/2)

    Loop, 4{ ;y
        MouseMove, current_x, current_y, 0
        activate_mouse()
        Sleep, sleep_time

        Click, Down
        Sleep, sleep_time

        current_x += cell_size_x*2
        MouseMove, current_x, current_y, 0
        activate_mouse()
        Sleep, sleep_time

        Click, Up

        current_x := top_left_x + (cell_size_x*1.5)
        current_y += cell_size_y

        SLeep, sleep_time
    }

}

fuse_3(){
    global cell_size_x, cell_size_y, top_left_x, top_left_y

    current_x := top_left_x + (cell_size_x*3.5)
    current_y := top_left_y + (cell_size_y/2)

    Loop, 2{ ;y
        MouseMove, current_x, current_y, 0
        activate_mouse()
        Sleep, sleep_time

        Click, Down
        Sleep, sleep_time

        current_y += cell_size_y
        MouseMove, current_x, current_y, 0
        activate_mouse()
        Sleep, sleep_time

        Click, Up

        current_y += cell_size_y

        SLeep, sleep_time
    }
}

fuse_4(){
    global cell_size_x, cell_size_y, top_left_x, top_left_y

    current_x := top_left_x + (cell_size_x*3.5)
    current_y := top_left_y + (cell_size_y*1.5)

    MouseMove, current_x, current_y, 0
    activate_mouse()
    Sleep, sleep_time

    Click, Down
    Sleep, sleep_time

    current_y += cell_size_y*2
    MouseMove, current_x, current_y, 0
    activate_mouse()
    Sleep, sleep_time

    Click, Up
}

activate_mouse(){
    MouseMove, 10, 0, 0, R
    MouseMove, -10, 0, 0, R
}

F8::ExitApp