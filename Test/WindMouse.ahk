windMouse(startX, startY, destX, destY, ByRef points, G0 := 12, W0 := 5, M0 := 40, D0 := 10)
{
    currentX := startX
    currentY := startY

    vX := 0
    vY := 0
    WX := 0
    WY := 0

    sqrt3 := Sqrt(3)
    sqrt5 := Sqrt(5)

    while (Sqrt((destX - startX) ** 2 + (destY - startY) ** 2) >= 1)
    {
        dist := Sqrt((destX - startX) ** 2 + (destY - startY) ** 2)

        WMag := (W0 < dist) ? W0 : dist

        if (dist >= D0)
        {
            Random, rand1, 0.0, 1.0
            Random, rand2, 0.0, 1.0

            WX := WX / sqrt3 + ((2 * rand1 - 1) * WMag / sqrt5)
            WY := WY / sqrt3 + ((2 * rand2 - 1) * WMag / sqrt5)
        }
        else
        {
            WX := WX / sqrt3
            WY := WY / sqrt3

            if (M0 < 3)
            {
                Random, randM, 0.0, 1.0
                M0 := randM * 3 + 3
            }
            else
            {
                M0 := M0 / sqrt5
            }
        }

        vX := vX + WX + G0 * (destX - startX) / dist
        vY := vY + WY + G0 * (destY - startY) / dist

        vMag := Sqrt(vX * vX + vY * vY)

        if (vMag > M0)
        {
            Random, randClip, 0.0, 1.0
            vClip := M0 / 2 + randClip * M0 / 2

            vX := (vX / vMag) * vClip
            vY := (vY / vMag) * vClip
        }

        startX := startX + vX
        startY := startY + vY

        moveX := Round(startX)
        moveY := Round(startY)

        if (currentX != moveX || currentY != moveY)
        {
            currentX := moveX
            currentY := moveY

            point := []
            point.Push(currentX)
            point.Push(currentY)
            points.Push(point)
        }
    }

    result := []
    result.Push(currentX)
    result.Push(currentY)
    return result
}

randomFloat(min, max)
{
    Random, r, 0.0, 1.0
    return min + (max - min) * r
}

XButton1::
    points := []
    
    MouseGetPos, x2, y2
    
    x1 := 0
    y1 := 0
    
    windMouse(x2, y2, x1, y1, points)
    
    for index, point in points
    {
        DllCall("SetCursorPos", "Int", Round(point[1]), "Int", Round(point[2]))
        Sleep, % Round((randomFloat(0, 1) / 60 + 0.01) * 1000)
    }
return

F8::ExitApp