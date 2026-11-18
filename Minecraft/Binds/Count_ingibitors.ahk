CoordMode, ToolTip, Screen

sample := 2
count := 0
show_killed()

!f::
    count -= 1
    show_killed()
return


!g::
    count += 1
    show_killed()
return

!z::
    FileAppend, % count . ", ", farm.txt
    
    sample += 1
    count := 0
    show_killed()
return    



show_killed(xpos=0, ypos=0){
    global count, sample
    data = % "Убито: " . count . "`nВыборка: " . sample
    ToolTip, %data%, xpos, ypos
}

F9::ExitApp
