step := 20
step_range := 1
xpos := 0
ypos := -33

ShowInfo(step, step_range, xpos, ypos){
    ToolTip, Step: %step% | Add: %step_range%, xpos, ypos
}

MoveMouse(x, y) 
{
    MouseGetPos, xpos, ypos
    MouseMove, xpos + x, ypos + y, 0
}

ShowInfo(step, step_range, xpos, ypos)

LShift & F1::
    step_range := step_range+1
    ShowInfo(step, step_range, xpos, ypos)
    return

LShift & F2::
    step_range := step_range-1
    ShowInfo(step, step_range, xpos, ypos)
    return

F1::
    step := step+step_range
    ShowInfo(step, step_range, xpos, ypos)
    return

F2::
    step := step-step_range
    ShowInfo(step, step_range, xpos, ypos)
    return

w::MoveMouse(0, -step)
a::MoveMouse(-step, 0)
s::MoveMouse(0, step)
d::MoveMouse(step, 0)
t::MouseClick, WheelUp
g::MouseClick, WheelDown
f::Click
v::Click, Right
r::Click, down
F8::ExitApp
