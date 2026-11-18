#Include E:\Scripts\AHK_LIBS\JSON.ahk

CoordMode, ToolTip, Screen

npc := 24
players := 0

show_data()


XButton1::
    npc += 1
    show_data()
    write_logs("npc", true)
return

XButton2::
    players += 1
    show_data()
    write_logs("players", true)
return

!XButton1::
    npc -= 1
    show_data()
    write_logs("npc", false)
return

!XButton2::
    players -= 1
    show_data()
    write_logs("players", false)
return



show_data(){
    global npc, players
    
    ToolTip, "Npc: " %npc% "Players: " %players%, 0, -33
}


write_logs(var_, operation=true){
     FileRead, content, logs.json
     obj := JSON.Load(content)
     
     if operation
         obj[var_] += 1
     else
         obj[var_] -= 1

     file := FileOpen("logs.json", "w")
     file.Write(JSON.Dump(obj, , 4))
     file.Close()
}


F8::ExitApp
