edit_mode := False
layer := 1


!NumpadMult::open_close_window("v2RayTun.exe", "C:\Program Files (x86)\v2RayTun\v2RayTun.exe")
!v::open_close_window("v2RayTun.exe", "C:\Program Files (x86)\v2RayTun\v2RayTun.exe")


!NumpadDiv::open_close_window("Taskmgr.exe", "C:\Windows\System32\taskmgr.exe")
Numpad0::open_close_window("Telegram.exe", "C:\Users\Фирс\AppData\Roaming\Telegram Desktop\Telegram.exe")
!+t::
    if(layer == 2){
        open_close_window("Taskmgr.exe", "C:\Windows\System32\taskmgr.exe")
    }
    else if(layer == 1){
        open_close_window("Telegram.exe", "C:\Users\Фирс\AppData\Roaming\Telegram Desktop\Telegram.exe")
    }
return


!NumpadEnter::open_close_window("flet.exe", "C:\Users\Фирс\Desktop\LG.lnk")
!l::open_close_window("flet.exe", "C:\Users\Фирс\Desktop\LG.lnk")


Numpad9::open_close_window("WindowsTerminal.exe", "wt.exe")
!t::open_close_window("WindowsTerminal.exe", "wt.exe")


Numpad1::open_close_window("Chrome.exe", "Chrome.exe")
!c::open_close_window("Chrome.exe", "Chrome.exe")


Numpad3::open_close_window("Browser.exe", "Browser.exe")
!y::open_close_window("Browser.exe", "Browser.exe")


NumpadDiv::open_close_window("Code.exe", "C:\Programs\Microsoft VS Code\Code.exe")
!e::open_close_window("Code.exe", "C:\Programs\Microsoft VS Code\Code.exe")


NumpadMult::open_close_window("ApplicationFrameHost.exe", "Notepads.exe")
!n::open_close_window("ApplicationFrameHost.exe", "Notepads.exe")


NumpadEnter::open_close_window("Obsidian.exe", "E:\Programs\Obsidian\Obsidian.exe")
!o::open_close_window("Obsidian.exe", "E:\Programs\Obsidian\Obsidian.exe")


!r::open_close_window("RobloxPlayerBeta.exe")


!d::open_close_window("DeepL.exe", "C:\Users\Фирс\Desktop\DeepL.lnk")


!s::
    if (temp_app){
        open_close_window(temp_app)
    } else{
        ToolTip, You don't have app on Alt+S
        Sleep, 1000
        ToolTip
    }
return


!+s::
    WinGet, temp_app, ProcessName, A

    if(temp_app != "explorer.exe"){
        last_temp_app := temp_app

        ToolTip, %temp_app% is now on Alt+S
        Sleep, 2000
        ToolTip
    } else{
        temp_app := last_temp_app

        ToolTip, You can't use explorer.exe
        Sleep, 2000
        ToolTip
    }
return

NumpadDot::
    if (temp_app){

        open_close_window(temp_app)
    } else{
        ToolTip, You don't have app on NumpadDot
        Sleep, 1000
        ToolTip
    }
return

^NumpadDot::
    WinGet, temp_app, ProcessName, A

    if(temp_app != "explorer.exe"){
        last_temp_app := temp_app

        ToolTip, %temp_app% is now on NumpadDot
        Sleep, 2000
        ToolTip
    } else{
        temp_app := last_temp_app

        ToolTip, You can't use explorer.exe
        Sleep, 2000
        ToolTip
    }
return


!1::layer := 1
!2::layer := 2

open_close_window(target_app, target_app_path=""){
    if WinExist("ahk_exe " target_app){
        WinGet, target_app_ID, List, ahk_exe %target_app%   
        id_count := 1
                    
        if WinActive("ahk_exe " target_app){
            while (id_count <= target_app_ID){
                current_id := target_app_ID%id_count%
                WinMinimize, ahk_id %current_id%
                id_count++
            }
       }
       else{
           while (id_count <= target_app_ID){
                current_id := target_app_ID%id_count%
                WinActivate, ahk_id %current_id%
                id_count++
            }
        }
    }
    else if(target_app_path != ""){

        ToolTip, % target_app_path . " is not running"
        
        MsgBox, 4,, Open: >>>%target_app%<<< `nPath: >>>%target_app_path%<<<
        IfMsgBox, Yes
            run, %target_app_path%
        
        ToolTip
        
    }
}


~F8::
    if(edit_mode){
        ExitApp
    }
return