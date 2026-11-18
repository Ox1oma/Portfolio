FileRead, n, %A_ScriptDir%\nicks.txt
nicks := get_nicks(n)

F1::
    Sleep, 2000
    for i, nick in nicks{
        SendInput, /ban %nick% 525600 %i% ЧСП(по решению руководства){Enter}
    }
    ToolTip, done
return


F8::ExitApp


get_nicks(str){
    arr := []
    parts := StrSplit(str, ",")
    for i, v in parts {
        v := Trim(v)
        v := RegExReplace(v, "\s*\(.*?\)")
        arr.Push(v)
    }
    return arr
}