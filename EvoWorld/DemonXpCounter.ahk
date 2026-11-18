CoordMode, ToolTip, Screen

xp_per_attempt = 220 ;k
nedeed_xp := 1000 * 1000 ;*1000
count := 0
raised_xp := 0
required_xp := nedeed_xp - raised_xp
nedeed_times := Round(nedeed_xp/xp_per_attempt)
near_time := nedeed_times * 1.5

show_info()

!F1::
    ;plus
    count := count+1
    raised_xp := raised_xp+xp_per_attempt
    required_xp := nedeed_xp - raised_xp
    nedeed_times := nedeed_times - 1
    near_time := nedeed_times * 2
    
    show_info()
return


!F2::
    ;minus
    count := count-1
    raised_xp := raised_xp-xp_per_attempt
    required_xp := required_xp+xp_per_attempt
    nedeed_times := nedeed_times + 1
    near_time := nedeed_times * 2
    
    show_info()
return


show_info(){
    global count, raised_xp, required_xp, nedeed_times, nedeed_xp, near_time
    
    time_ := get_time()
    
    hours := time_[1]
    minutes := time_[2]
    
    data := "⸻⸻⸻⸻`n●Необходимый опыт: " . nedeed_xp . "К`n⸻⸻⸻⸻`n●Счет: " . count . "`n●Опыт: " . raised_xp . "К`n⸻⸻⸻⸻" . "`n●Требуется еще опыта: " . required_xp . "К`n●Требуется заходов: " . nedeed_times . "`n●~Время: " . hours . "h " . minutes . "м`n⸻⸻⸻⸻"
    
    ToolTip, %data%, -290, -30
}

get_time(){
    global near_time
    
    hours := 0
    minutes := 0
    
    while(near_time>=60){
        near_time := near_time - 60
        hours := hours + 1
    }
    
    minutes := near_time
    return [hours, minutes]
}

F8::ExitApp
