#Include E:\Scripts\AHK_LIBS\JSON.ahk

coord := ["149 94 166", "127 98 76", "156 109 38", "207 101 108", "138 65 120", "199 119 190", "73 119 68", "167 123 -14", "243 120 76", "164 109 83"]

await := False


F1::
	if(await == False){
		send_command("/tp " . coord[1])

		write_logs("F1")
     }
	else{
		send_command("/tp " . coord[6])

		await := False
		Tooltip

		write_logs("AF1")
     }
return

F2::
	if(await == False){
		send_command("/tp " . coord[2])

		write_logs("F2")
     }
	else{
		send_command("/tp " . coord[7])

		await := False
		Tooltip

		write_logs("AF2")
     }
return

F3::
	if(await == False){
		send_command("/tp " . coord[3])

		write_logs("F3")
     }
	else{
		send_command("/tp " . coord[8])

		await := False
		Tooltip

		write_logs("AF3")
     }
return

F4::
	if(await == False){
		send_command("/tp " . coord[4])

		write_logs("F4")
     }
	else{
		send_command("/tp " . coord[9])

		await := False
		Tooltip

		write_logs("AF4")
     }
return

F5::
	if(await == False){
		send_command("/tp " . coord[5])

		write_logs("F5")
     }

	else{
		send_command("/tp " . coord[10])

		await := False
		Tooltip

		write_logs("AF5")
     }
return

~I::
    if(await){
        send_command("/ingibitor")

        await := False
        ToolTip

        write_logs("ingibitor")
    }
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

XButton1::
     send_command("/fly")

     write_logs("fly")
Return

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

     file := FileOpen("logs.json", "w")
     file.Write(JSON.Dump(obj, , 4))
     file.Close()
}