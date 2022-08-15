Gui, Add, Tab, x0 y0 w420 h300 , Evt. Enroll|Other

Gui, Tab, Evt. Enroll

; -----------------------------------------------
Gui, Add, Button, x30 y200 w260 h40 gcbAlarms, CB Alarms
Gui, Add, Button, x300 y200 w40 h40 gRLD, RLD
Gui, Add, progress, x30 y250 w310 h20 BackgroundCCCCCC vprog2,


; -----------------------------------------------

Gui, Tab, Other
Gui, Add, CheckBox, x10 y30 w300 h50 vCheckMousePos gShowMousePos, Show Mouse Position Tooltip
; Generated using SmartGUI Creator 4.0
Gui, color, DBE8F0

guiW := 365
guiH := 330
guiX := 945
guiY := 125

Gui, Show, x%guiX% y%guiY% w%guiW% h%guiH%, FIN-Alarm Notifier
Gui, +AlwaysOnTop

CoordMode Pixel, Screen
CoordMode Mouse, Screen

Return

; ------------------------------------------------------------------------

cbAlarms:
Gui, Submit, nohide
DetectHiddenWindows, On
WinActivate, Siemens

yellowDotX = 278
yellowDotY = 316

click, %yellowDotX%, %yellowDotY%
sleep, 4000

loop 5 {
  send, {Tab}
  sleep, 100
}

send, {Space}
Sleep, 1000

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 saveBtn.png
  if(errorlevel == 0){
    FoundX+=30
    click, %FoundX%, %FoundY%
    sleep, 1000
  }
yellowDotY+=13

click, %yellowDotX%, %yellowDotY%
sleep, 4000

loop 5 {
  send, {Tab}
  sleep, 100
}

send, {Space}
Sleep, 1000

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 saveBtn.png
  if(errorlevel == 0){
    FoundX+=30
    click, %FoundX%, %FoundY%
    sleep, 1000
  }
yellowDotY+=13

click, %yellowDotX%, %yellowDotY%
sleep, 4000

loop 5 {
  send, {Tab}
  sleep, 100
}

send, {Space}
Sleep, 1000

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 saveBtn.png
  if(errorlevel == 0){
    FoundX+=30
    click, %FoundX%, %FoundY%
    sleep, 1000
  }
yellowDotY+=13

click, %yellowDotX%, %yellowDotY%
sleep, 4000

loop 5 {
  send, {Tab}
  sleep, 100
}

send, {Space}
Sleep, 1000

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 saveBtn.png
  if(errorlevel == 0){
    FoundX+=30
    click, %FoundX%, %FoundY%
    sleep, 1000
  }
yellowDotY+=13

click, %yellowDotX%, %yellowDotY%
sleep, 4000

loop 5 {
  send, {Tab}
  sleep, 100
}

send, {Space}
Sleep, 1000

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 saveBtn.png
  if(errorlevel == 0){
    FoundX+=30
    click, %FoundX%, %FoundY%
    sleep, 1000
  }
yellowDotY+=13

Return

; ------------------------------------------------------------------------
; Show the mouse position x and y as a tooltip
showMousePos:
CoordMode,Mouse,Screen
GuiControlGet, checkMousePos
if (checkMousePos = 1)
  SetTimer, WatchCursor, 100
  WatchCursor:
    WinGetTitle, Title, A
    MouseGetPos, xpos, ypos
    ToolTip, X%xpos% Y%ypos% Title:%Title%

GuiControlGet, CheckMousePos
if (CheckMousePos = 0)
  RemoveToolTip:
    ToolTip
return

; -----------------------------------------------
ButtonQBatch:
Gui, Submit, NoHide
GuiControl, , alarm1, HS %nameBat% Exhaust Fan Status ALM
GuiControl, , alarm2, HS %nameBat% Exhaust Filter Status ALM
GuiControl, , alarm3, HS %nameBat% Exhaust VFD ALM
GuiControl, , alarm4, HS %nameBat% Freeze Stat ALM
GuiControl, , alarm5, HS %nameBat% Supply Fan Status ALM
GuiControl, , alarm6, HS %nameBat% Supply Filter Status ALM
GuiControl, , alarm7, HS %nameBat% Supply VFD ALM

Return

; -----------------------------------------------
RLD:
Reload
; -----------------------------------------------
GuiClose:
ExitApp
; -----------------------------------------------
Error0:
MsgBox, (1) alarm Name is blank.
Gosub, TheEnd
; -----------------------------------------------
TheEnd:
Gui, Show