await := False

F1::
     if(await == False)
          send_command("//pos1")
     else
          send_command("//copy")
          await := False
          Tooltip
return

F2::
     if(await == False)
          send_command("//pos2")
     else
          send_command("//paste")
          await := False
          Tooltip

return

F3::
     if(await == False)
          send_command("/home a")
     else
          send_command("//cancel")
          await := False
          Tooltip
return

F4::
     if(await == False)
          send_command("/home b")
     else
          send_command("//undo")
          await := False
          Tooltip
return

F5::
    send_command("/home t")
return


XButton2::
    if(await){
        await := False
        ToolTip
    }
    else{
        await := True
        ToolTip, await
    }
return

send_command(command){
     SendInput, {t}
     Sleep, 100
     SendInput, %command%{Enter}
}

F8::ExitApp