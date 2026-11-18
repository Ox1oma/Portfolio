SendMode Input

$Up::
	Send, {Up}
	Sleep, 100
	speed_repeat("Up", 15)
return

$Down::
	Send, {Down}
	Sleep, 100
	speed_repeat("Down", 15)
return

$Left::
	Send, {Left}
	Sleep, 100
	speed_repeat("Left", 15)
return

$Right::
	Send, {Right}
	Sleep, 100
	speed_repeat("Right", 15)
return


speed_repeat(key, interval){
	while GetKeyState(key, "P"){
		Send {%key%}
		Sleep interval
	}
}
