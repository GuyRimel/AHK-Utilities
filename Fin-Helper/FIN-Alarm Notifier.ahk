Gui, Add, Tab, x0 y0 w420 h300 , Notify Class|Evt. Enroll|Other
Gui, Tab, Notify Class
Gui, Add, Text, x30 y30 w140 h20 , Name

; -------------------------------------
Gui, Add, Edit, x30 y50 w90 h20 vnameBat, ERU6
Gui, Add, Button, x120 y50 w50 h20 , QBatch
Gui, Add, Edit, x175 y50 w35 h20 vunitNum, 15

; -----------------------------------------------
Gui, Add, Text, x12 y70 w20 h20 , 1
Gui, Add, Text, x12 y90 w20 h20 , 2
Gui, Add, Text, x12 y110 w20 h20 , 3
Gui, Add, Text, x12 y130 w20 h20 , 4
Gui, Add, Text, x12 y150 w20 h20 , 5
Gui, Add, Text, x12 y170 w20 h20 , 6
Gui, Add, Text, x12 y190 w20 h20 , 7
; -----------------------------------------------
Gui, Add, Edit, x30 y70 w180 h20 valarm1,
Gui, Add, Edit, x30 y89 w180 h20 valarm2,
Gui, Add, Edit, x30 y110 w180 h20 valarm3,
Gui, Add, Edit, x30 y130 w180 h20 valarm4,
Gui, Add, Edit, x30 y150 w180 h20 valarm5,
Gui, Add, Edit, x30 y170 w180 h20 valarm6,
Gui, Add, Edit, x30 y190 w180 h20 valarm7,
; -----------------------------------------------
Gui, Add, Button, x215 y70 w40 h20 gsend1,Send
Gui, Add, Button, x215 y89 w40 h20 gsend2,Send
Gui, Add, Button, x215 y110 w40 h20 gsend3,Send
Gui, Add, Button, x215 y130 w40 h20 gsend4,Send
Gui, Add, Button, x215 y150 w40 h20 gsend5,Send
Gui, Add, Button, x215 y170 w40 h20 gsend6,Send
Gui, Add, Button, x215 y190 w40 h20 gsend7,Send

; -----------------------------------------------
Gui, Add, Button, x30 y220 w100 h40 gsetupNotify, Setup Notifications
Gui, Add, Button, x135 y220 w100 h40 gsetupEnroll, Setup Enrollments
Gui, Add, Button, x300 y220 w40 h40 , RLD
Gui, Add, progress, x30 y270 w310 h20 BackgroundCCCCCC vprog1,

; -----------------------------------------------
Gui, Tab, Evt. Enroll

; -----------------------------------------------
Gui, Add, Button, x30 y200 w260 h40 , Create_alarms
Gui, Add, Button, x300 y200 w40 h40 , RLD
Gui, Add, progress, x30 y250 w310 h20 BackgroundCCCCCC vprog2,



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

Send, {Tab}{ShiftDown}{Tab}{ShiftUp}
Return

; ------------------------------------------------------------------------
setupEnroll:
gosub,send1
gosub,send2
gosub,send3
gosub,send4
gosub,send5
gosub,send6
gosub,send7

Return
; ------------------------------------------------------------------------
send1:
objName = HS %nameBat% Exhaust Fan Status ALM
desc = Fan Status ALM
dNum = 9
pointImg = FIN Search Images\ALM EF Status.png
gosub, sendEventEnroll
Return

; ------------------------------------------------------------------------
send2:
objName = HS %nameBat% Exhaust Filter Status ALM
desc = Filter Stats ALM
dNum = 4
pointImg = FIN Search Images\ALM EFS.png
gosub, sendEventEnroll
Return
; ------------------------------------------------------------------------
send3:
objName = HS %nameBat% Exhaust VFD ALM
desc = VFD ALM
dNum = 1
pointImg = FIN Search Images\ALM EVFD.png
gosub, sendEventEnroll
Return
; ------------------------------------------------------------------------
send4:
objName = HS %nameBat% Freeze Stat ALM
desc = Freeze Stat ALM
dNum = 6
pointImg = FIN Search Images\ALM Freeze Stat.png
gosub, sendEventEnroll
Return
; ------------------------------------------------------------------------
send5:
objName = HS %nameBat% Supply Fan Status ALM
desc = Fan Status ALM
dNum = 10
pointImg = FIN Search Images\ALM SF Status.png
gosub, sendEventEnroll
Return
; ------------------------------------------------------------------------
send6:
objName = HS %nameBat% Supply Filter Status ALM
desc = Filter Stats ALM
dNum = 8
pointImg = FIN Search Images\ALM SFS.png
gosub, sendEventEnroll
Return
; ------------------------------------------------------------------------
send7:
objName = HS %nameBat% Supply VFD ALM
desc = VFD ALM
dNum = 2
pointImg = FIN Search Images\ALM SVFD.png
gosub, sendEventEnroll
Return
; ------------------------------------------------------------------------

sendEventEnroll:
Gui, Submit, nohide
DetectHiddenWindows, On
WinActivate, Siemens

ImageSearch, FoundX, FoundY, 0, 0, 400, A_ScreenHeight, *10 FIN Search Images\FINplus.png
  if(errorlevel == 0){
    click, %FoundX%, %FoundY%
    sleep, 500
  }
Sleep, 5000

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 FIN Search Images\FINredStar.png
  if(errorlevel == 0){
    FoundX+=30
    click, %FoundX%, %FoundY%
    sleep, 100
    Send, ^a
    Sleep, 500
  }

send, %objName%
sleep, 300
send, {Tab 2}
sleep, 300

send, %desc%
sleep, 300

Loop 2 {
  Send, {Tab}
  Sleep, 100
}

Send, {Space}
Sleep, 100

Send, {Tab}
Sleep, 100

Send, {Space}
Sleep, 300

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 FIN Search Images\FINreferencePoint.png
  if(errorlevel == 0){
    FoundX += 150
    click, %FoundX%, %FoundY%
    Sleep, 500
  }

send, {Down}
Sleep, 100
send, {Up}
Sleep, 100

Loop % unitNum{
  send, {Down}
  Sleep, 100
}

Loop 3{
  send, {Right}
  Sleep, 100
}

MouseMove,0,100,,relative
Sleep, 100

loop{
  ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 %pointImg%
    if(errorlevel == 0){
      FoundX += 150
      click, %FoundX%, %FoundY%
      Sleep, 500
      break
    }else{
      Send, {WheelDown}
      Sleep, 100
    }
}

Loop 2 {
  Send, {Tab}
  Sleep, 300
}

Send, {Space}
Sleep, 300

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 FIN Search Images\FINstates.png
  if(errorlevel == 0){
    FoundX += 150
    click, %FoundX%, %FoundY%
    sleep, 100
    click
    Sleep, 500
  }

Loop 2 {
  Send, {Down}
  Sleep, 100
}

Loop 5 {
  Send, {Tab}
  Sleep, 300
}

Send, {Space}
Sleep,2000

Return

; ------------------------------------------------------------------------
setupNotify:
Gui, Submit, nohide
DetectHiddenWindows, On
WinActivate, Siemens

ImageSearch, FoundX, FoundY, 0, 0, 400, A_ScreenHeight, *10 FIN Search Images\FINplus.png
  if(errorlevel == 0){
    click, %FoundX%, %FoundY%
    sleep, 500
  }
Sleep, 500

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 FIN Search Images\FINobjectName.png
  if(errorlevel == 0){
  	FoundX+=100
    click, %FoundX%, %FoundY%
    sleep, 100
    Send, ^a
  }

Send,HS %nameBat% Alarms
Sleep, 100

ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 FIN Search Images\FINdescription.png
  if(errorlevel == 0){
  	FoundX+=100
    click, %FoundX%, %FoundY%
    sleep, 100
    Send, ^a
  }

Send,HS %nameBat% Alarms
Sleep, 100

Send, {Tab}
Sleep, 50

Send, {Space}
Sleep, 50

Loop 4 {
	Send, {Tab}
	Sleep, 50
}

Send, {Space}
Sleep, 100

Loop 5 {
	Send, {Tab}
	Sleep, 50
}

Send, {Space}
Sleep, 300
Send,+{Tab}
Sleep, 300
Send, 1
Sleep, 300
Send, {Tab}
Sleep, 500

Send, {Space}
Sleep, 100
Send,+{Tab}
Sleep, 100
Send, {Tab}
Sleep, 100
Send, 2
Sleep, 100
Send, {Tab}
Sleep, 500

Send, {Space}
Sleep, 100
Send,+{Tab}
Sleep, 100

  Send, {Tab}
  Sleep, 100

Send, 3
Sleep, 100
Send, {Tab}
Sleep, 500


Send, {Space}
Sleep, 100
Send,+{Tab}
Sleep, 100

  Send, {Tab}
  Sleep, 100

Send, 4
Sleep, 100
Send, {Tab}
Sleep, 500


Send, {Space}
Sleep, 100
Send,+{Tab}
Sleep, 100

  Send, {Tab}
  Sleep, 100

Send, 5
Sleep, 100
Send, {Tab}
Sleep, 500


Send, {Space}
Sleep, 100
Send,+{Tab}
Sleep, 100

  Send, {Tab}
  Sleep, 100

Send, 8
Sleep, 100
Send, {Tab}
Sleep, 500


Send, {Space}
Sleep, 100
Send,+{Tab}
Sleep, 100

  Send, {Tab}
  Sleep, 100

Send, 9
Sleep, 100
Send, {Tab}
Sleep, 500

Loop 2 {
  Send, {Tab}
  Sleep, 300
}

Send, {Space}
Sleep, 300

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
ButtonRLD:
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