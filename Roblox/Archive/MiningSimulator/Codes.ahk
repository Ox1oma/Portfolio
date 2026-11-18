codes := ["{#}ChristmasHype", "AnniversaryTokens", "EpicTokens", "200Tokens", "4thJuly", "July21st", "America", "1Year", "500m", "SummerTokens", "SummerParadise", "Challenge", "ILoveTokens", "ImOutOfCodeIdeas", "ImOutOfCodeIdeas2", "MoreMoreCode", "MoreMoreTokens", "oof", "owo", "Shiny", "sircfenner", "Trails", "TooManyCodes", "Wings", "GetSlicked", "HammieJammieDoesntSuck", "NewQuests", "NosniyIsCool", "SandCastles", "HammieJammieSucksx2", "HammieJammieSucksxInfinity"]
index := 1

F1::
    while(True){
        Click, 697 506
        Sleep, 200
        SendInput, % codes[index]
        Sleep, 200
        Click, 691 565
        index++
        if (index > codes.MaxIndex()){
            index := 1
            break
        }
        Sleep, 500
    }
return

F8::ExitApp