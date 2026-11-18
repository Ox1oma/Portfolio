#Include E:\Scripts\AHK_LIBS\JSON.ahk


XButton2::
    Click, down
    
    write_logs("down")
return


F6::
    send_command("/home q")
    
    write_logs("hamster")
return


F7::
    send_command("/mine")

    write_logs("mine")
return


F8::ExitApp


send_command(command){
     SendInput, {t}
     Sleep, 100
     SendInput, %command%{Enter}
}


write_logs(var_){
     FileRead, content, logs.json
     obj := JSON.Load(content)
     obj[var_] += 1

     file := FileOpen("hamster_logs.json", "w")
     file.Write(JSON.Dump(obj, , 4))
     file.Close()
}
