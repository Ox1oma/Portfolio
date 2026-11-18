#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

^!v::
SaveClipboardImage()
return

SaveClipboardImage(){
    ClipWait, 0.5
    if (!DllCall("IsClipboardFormatAvailable", "UInt", 2))
        return
    wb := ComObjCreate("Shell.Application").Windows
    path := ""
    for w in wb {
        try {
            if (w.hwnd = WinActive("A")) {
                path := w.Document.Folder.Self.Path
                break
            }
        }
    }
    if (path = "")
        path := A_Desktop
    FormatTime, ts,, yyyyMMdd_HHmmss
    file := path . "\clip_" . ts . ".png"
    ps =
    (
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing
    $img=[Windows.Forms.Clipboard]::GetImage()
    if($img){$img.Save('%file%',[Drawing.Imaging.ImageFormat]::Png)}
    )
    RunWait, % "powershell -sta -command " . Chr(34) . ps . Chr(34),, Hide
}
F8::ExitApp