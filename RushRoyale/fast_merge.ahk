#Persistent

keyMap := { "q": 1, "w": 2, "e": 3, "r": 4, "t": 5, "a": 6, "s": 7, "d": 8, "f": 9, "g": 10, "z": 11, "x": 12, "c": 13, "v": 14, "b": 15, "y": 16, "u": 17, "i": 18, "o": 19, "p": 20, "h": 21, "j": 22, "k": 23, "l": 24, ";": 25, "n": 26, "m": 27, ",": 28, ".": 29, "/": 30, "F1": 31, "F2": 32, "F3": 33, "F4": 34, "F5": 35, "tab": 36, "shift": 37}

specialKeys := { "Tab": 1, "Shift": 1, "F1": 1, "F2": 1, "F3": 1, "F4": 1, "F5": 1 }

grid := [] 
grid[1] := {x: 584, y: 467}
grid[2] := {x: 635, y: 467}
grid[3] := {x: 691, y: 467}
grid[4] := {x: 744, y: 467}
grid[5] := {x: 795, y: 467}
grid[6] := {x: 586, y: 520}
grid[7] := {x: 636, y: 520}
grid[8] := {x: 686, y: 520}
grid[9] := {x: 743, y: 520}
grid[10] := {x: 798, y: 520}
grid[11] := {x: 585, y: 575}
grid[12] := {x: 641, y: 575}
grid[13] := {x: 688, y: 575}
grid[14] := {x: 736, y: 575}
grid[15] := {x: 796, y: 575}

grid[16] := {x: 584, y: 467}
grid[17] := {x: 635, y: 467}
grid[18] := {x: 691, y: 467}
grid[19] := {x: 744, y: 467}
grid[20] := {x: 795, y: 467}
grid[21] := {x: 586, y: 520}
grid[22] := {x: 636, y: 520}
grid[23] := {x: 686, y: 520}
grid[24] := {x: 743, y: 520}
grid[25] := {x: 798, y: 520}
grid[26] := {x: 585, y: 575}
grid[27] := {x: 641, y: 575}
grid[28] := {x: 688, y: 575}
grid[29] := {x: 736, y: 575}
grid[30] := {x: 796, y: 575}


grid[31] := {x: 526, y: 690}
grid[32] := {x: 587, y: 690}
grid[33] := {x: 637, y: 690}
grid[34] := {x: 705, y: 690}
grid[35] := {x: 784, y: 690}
grid[36] := {x: 676, y: 639}
grid[37] := {x: 843, y: 690}


for key, index in keyMap{
    Hotkey, % key, MoveCursor
}    
MoveCursor:
    index := keyMap[A_ThisHotkey]
    if (index && grid[index])
        MouseMove, grid[index].x, grid[index].y, 0

    if (ObjHasKey(specialKeys, A_ThisHotkey))  
        Click
return

status := False
Space::
    status := !status
    if status
        Click, Up
    else
        Click, Down
return



F8::ExitApp