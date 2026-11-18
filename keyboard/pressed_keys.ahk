#InstallKeybdHook
#UseHook

global keyDown := {}
global log := []
global xpos := 50
global ypos := -33

Loop, 254
{
    vk := Format("vk{:02X}", A_Index)
    Hotkey, % "~*" vk, keyDownHandler
    Hotkey, % "~*" vk " Up", keyUpHandler
}

keyDownHandler(){
    global keyDown
    key := RegExReplace(A_ThisHotkey,"[\*\~\s]")
    name := GetKeyName(key)
    keyDown[name] := A_TickCount
}

keyUpHandler(){
    global keyDown
    global log
    global xpos
    global ypos
    key := RegExReplace(A_ThisHotkey,"[\*\~\s]")
    key := RegExReplace(key,"Up$")
    name := GetKeyName(key)
    if(keyDown.HasKey(name)){
        t := A_TickCount - keyDown[name]
        log.Push("""" name """: """ t """")
        keyDown.Delete(name)
        showLog(xpos,ypos)
    }
}

showLog(xpos,ypos){
    global log
    s := ""
    for i,v in log
        s .= v "`n"
    ToolTip, % s, xpos, ypos
}

XButton1::log := []

F8::ExitApp