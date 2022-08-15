#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; -------------------------------------------------------------------------------------------------
guiW := 265
guiH := 150
guiX := A_ScreenWidth - guiW - 20
guiY := 310
helpX := guiW - 80
RLDX := guiW - 40

Gui, color, 11EE88
Gui, Show, x%guiX% y%guiY% w%guiW% h%guiH%, Action Button			; This is the gui window title

Gui, +AlwaysOnTop
CoordMode Pixel, Screen
CoordMode Mouse, Screen
SetTitleMatchMode, 2

; -------------------------------------------------------------------------------------------------
Gui, Add, Tab, x0 y0 w%guiW% h%guiH%, Action|Options

; -------------------------------------------------------------------------------------------------
Gui, Tab, Action

Gui, Add, Button, x%helpX% y0 w40 h20 gHelp, ?
Gui, Add, Button, x%RLDX% y0 w40 h20 gRLD, RLD

gui, add, text, 0x12 x1 y28 w362 h155,


gui, add, text,  x5 y38 h20, * Unique Part of Target Window Title:
gui, add, edit,  x185 y35 w65 h20 vwindowTitleChunk, Siemens 					; window chunk

rowY=60

gui, add, text, x5 y%rowY% h20, How many times? :
gui, add, edit, x100 y%rowY% w35 h20 vhowManyTimes, 59						; how many times

gui, add, text, x150 y%rowY% h20, Current # :
gui, add, edit, x205 y%rowY% w35 h20 vcurrNum, 1							; current number

rowY+=25

gui, add, button, x5 y%rowY% w255 h40 gdoTheAction, DO THE ACTION!!! :D
rowY+=43
gui, add, progress, x5 y%rowY% w255 h15 cee5511 vprogbar,

; -------------------------------------------------------------------------------------------------
Gui, Tab, Options
Gui, Add, Button, x%helpX% y0 w40 h20 gHelp, ?
Gui, Add, Button, x%RLDX% y0 w40 h20 gRLD, RLD
Gui, Add, CheckBox, x10 y30 h20 vcheckOnTop gKeepOnTop checked, Keep on Top of other Windows
Gui, Add, CheckBox, x10 y50 h20 vcheckMousePos gshowMousePos, Show Mouse Position and Active Window

Gui, Add, Text, x10 y82 w100 h20, Device Name:
Gui, Add, Edit, x80 y80 w100 h20 vdev, RTU-
; Gui, Add, CheckBox, x10 y100 h20 v2stats, 2 Thermostats

; -------------------------------------------------------------------------------------------------
^`::
doTheAction:
gui, submit, nohide
winActivate, %windowTitleChunk%

prog=0
2stats=0
loop %howManyTimes% {
; write out the action HERE
	guicontrol,,currNum, % currNum

	if(currNum == 2){
		2stats=1
	}
	if(currNum == 3){
		2stats=1
	}
	if(currNum == 8){
		2stats=1
	}
	if(currNum == 10){
		2stats=1
	}
	if(currNum == 11){
		2stats=1
	}
	if(currNum == 13){
		2stats=1
	}
	if(currNum == 14){
		2stats=1
	}
	if(currNum == 16){
		2stats=1
	}
	if(currNum == 18){
		2stats=1
	}
	if(currNum == 29){
		2stats=1
	}
	if(currNum == 30){
		2stats=1
	}
	if(currNum == 31){
		2stats=1
	}
	if(currNum == 32){
		2stats=1
	}

	if(2stats==false){
		trendNum=1
		gosub, stepsUpToDev

		loop 1 {
			send, {Down}
			Sleep, 100
		}

		gosub, stepsAfterDev

		gosub, waitForSave

		trendNum=2
		gosub, stepsUpToDev

		loop 2 {
			send, {Down}
			Sleep, 100
		}

		gosub, stepsAfterDev

		gosub, waitForSave
	}

	if(2stats==True){
		trendNum=1
		gosub, stepsUpToDev

		loop 2 {
			send, {Down}
			Sleep, 100
		}

		gosub, stepsAfterDev

		gosub, waitForSave

		trendNum=2
		gosub, stepsUpToDev

		loop 1 {
			send, {Down}
			Sleep, 100
		}

		gosub, stepsAfterDev

		gosub, waitForSave

		trendNum=3
		gosub, stepsUpToDev

		loop 36 {
			send, {Down}
			Sleep, 100
		}

		gosub, stepsAfterDev

		gosub, waitForSave

		trendNum=4
		gosub, stepsUpToDev

		loop 3 {
			send, {Down}
			Sleep, 100
		}

		gosub, stepsAfterDev

		gosub, waitForSave
	}

	currNum++

}

	guicontrol,,progbar,0

Return

; -------------------------------------------------------------------------------------------------

stepsUpToDev:
click, 267, 978

loop 2 {
	send, {Tab}
	sleep, 100
}

gosub, progSleep

if(trendNum==1 && 2stats==False){
	devString = %dev%%currNum%"_Rm Temp"
}
if(trendNum==2 && 2stats==False){
	devString = %dev%%currNum%"_SAT"
}
if(trendNum==1 && 2stats==True){
	devString = %dev%%currNum%"_Rm Temp 1"
}
if(trendNum==2 && 2stats==True){
	devString = %dev%%currNum%"_Rm Temp 2"
}
if(trendNum==3 && 2stats==True){
	devString = %dev%%currNum%"_Rm Temp Eval"
}
if(trendNum==4 && 2stats==True){
	devString = %dev%%currNum%"_SAT"
}

gosub, progSleep

send, %devString%

gosub, progSleep

loop 4 {
	send, {Tab}
	sleep, 100
}

gosub, progSleep

click, 888, 353

gosub, progSleep

send, {down}

gosub, progSleep

send, {space}

gosub, progSleep

devDown:= currNum+3

if(currNum>59){
	devDown:= devDown-61
}

loop % devDown {
	send, {down}
	sleep, 100
}

gosub, progSleep

send, {space}

gosub, progSleep

return

; -------------------------------------------------------------------------------------------------
stepsAfterDev:
send, {Enter}

gosub, progSleep

send, {tab}

gosub, progSleep

send, {down}

gosub, progSleep

loop 5 {
	send, {Tab}
	Sleep, 100
}

gosub, progSleep

loop 3 {
	send, {right}
	Sleep, 100
}

gosub, progSleep

loop 4 {
	send, {BS}
	Sleep, 100
}

gosub, progSleep

send, 700

gosub, progSleep

loop 5 {
	send, {Tab}
	Sleep, 100
}

gosub, progSleep

send, {space}

gosub, progSleep

send, {Tab}

gosub, progSleep

Return

; -------------------------------------------------------------------------------------------------
waitForSave:
loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 images\Talon_greySaveBtn.png
  if (ErrorLevel == 0){
    break
  }
  sleep, 300
}

Return

; -------------------------------------------------------------------------------------------------
progSleep:
prog++
if(prog>100){
	prog=0
}
guicontrol,,progbar, % prog
sleep,300
Return

; -------------------------------------------------------------------------------------------------
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
; -------------------------------------------------------------------------------------------------
KeepOnTop:
GuiControlGet, checkOnTop
if (checkOnTop = 1)
	Gui, +AlwaysOnTop
if (checkOnTop = 0)
	Gui, -AlwaysOnTop

Return

; -------------------------------------------------------------------------------------------------
^r::
RLD:
Reload
Return
; -------------------------------------------------------------------------------------------------
GuiClose:
ExitApp
; -------------------------------------------------------------------------------------------------
beep:
SoundBeep, 600, 200
Return
; -------------------------------------------------------------------------------------------------
Help:

msgbox, There is no help yet...

Return
; -------------------------------------------------------------------------------------------------

; here are some past actions...
; -------------------------------------------------------------------------------------------------

; this clicks and drags two things 60px down (y+60)
; -------------------------------------------------------------------------------------------------

	; mousemove,979,479
	; gosub,progSleep
	; click,down
	; gosub,progSleep
	; mousemove,979,539
	; gosub,progSleep
	; click,up
	; gosub,progSleep

	; mousemove,1064,511
	; gosub,progSleep
	; click,down
	; gosub,progSleep
	; mousemove,1064,571
	; gosub,progSleep
	; click,up
	; gosub,progSleep


; This Creates BV's in Talon
; -------------------------------------------------------------------------------------------------
; click,267,977,5
; gosub,progSleep
; send,{Tab}
; gosub,progSleep
; if(currNum<10){
; 	send,OVR.RTU0%currNum%
; } else {
; 	send,OVR.RTU%currNum%
; }
; gosub,progSleep
; send,{Tab}
; gosub,progSleep
; loop 3{
; 	send,{down}
; 	sleep,200
; }
; gosub,progSleep
; send,{Tab}
; gosub,progSleep
; send,{Space}
; gosub,progSleep
; click,565,225,5
; gosub,progSleep
; mousemove,1845,975,5
; gosub,progSleep
; gosub,progSleep
; gosub,progSleep
; currNum++

; -------------------------------------------------------------------------------------------------

; This code chunk deletes things in FireWorks, pastes, then goes to the next FW tab
;	send, {shift down}
; 	sleep, 100
; 	click, 700, 669
; 	sleep, 100
; 	click, 856, 669
; 	sleep, 100
; 	send, {shift up}
; 	sleep, 100
; 	send, {BackSpace}
; 	sleep, 100
; 	send, ^v
; 	sleep, 100
; 	send, ^{Tab}
; 	sleep, 250

; -------------------------------------------------------------------------------------------------
; This sends incrementally increasing title numbers and saves it as a new page in FireWorks

	; loop 3 {
	; 	click, 800,215
	; 	sleep,100
	; }
	; goSub,progSleep
	; send, JH/HS | RTU-%currNum%
	; goSub,progSleep
	; send, {ctrl down}
	; sleep, 300
	; send, {shift down}
	; sleep, 300
	; send, s
	; send, {shift up}
	; sleep, 300
	; send, {ctrl up}
	; goSub,progSleep
	; send, {ctrl down}
	; sleep, 300
	; send, a
	; send, {ctrl up}
	; goSub,progSleep
	; send, RTU-%currNum%.fw.png
	; goSub,progSleep
	; send, {Enter}
	; sleep,2000
	; goSub,progSleep

; -------------------------------------------------------------------------------------------------