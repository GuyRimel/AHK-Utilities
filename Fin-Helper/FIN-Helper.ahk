; ------------------------------------------------------------------------
; FIN-Helper: version 1.0
; By: Guy Rimel 10/23/2019
;
; ------------------------------------------------------------------------; ------------------------------------------------------------------------

Menu, Tray, icon, FH Files\FH_icon.ico

guiW := 365
guiH := 330
guiX := A_ScreenWidth - guiW - 20
guiY := 500
helpX := guiW - 80
RLDX := guiW - 40
attSegs := 0

; ------------------------------------------------------------------------
Gui, Add, Tab, x0 y0 w%guiW% h%guiH%, Actions|Attach|Publish|Options

; ------------------------------------------------------------------------
Gui, Tab, Actions

Gui, Add, Button, x%helpX% y0 w40 h20 gactionsHelp, ?
Gui, Add, Button, x%RLDX% y0 w40 h20 gRLD, RLD

Gui, Add, Text, x5 y30 h20, * Actions will affect currently selected item(s) in FIN | lite. *

gui, add, text, 0x12 x1 y48 w362 h50,

Gui, Add, Button, x5 y50 w50 h40 gcloneHL, Clone (Alt+d)
Gui, Add, Button, x60 y50 w50 h40 gcut, Cut
Gui, Add, Button, x115 y50 w50 h40 gcopy, Copy
Gui, Add, Button, x170 y50 w50 h40 gpaste, Paste

Gui, Add, Button, x255 y50 w50 h40 gundo, Undo
Gui, Add, Button, x310 y50 w50 h40 gredo, Redo

gui, add, text, 0x12 x1 y98 w362 h70,

Gui, Add, Text, x5 y100 h20, - Move -
Gui, Add, Text, x5 y123 w20 h20, X :
Gui, Add, Text, x5 y143 w20 h20, Y :
Gui, Add, Button, x25 y120 w20 h20 gminHLX, -
Gui, Add, Button, x45 y120 w20 h20 gplsHLX, +
Gui, Add, Edit, x65 y120 w40 h20 vmovHLX,
Gui, Add, Button, x105 y120 w20 h20 gclrHLX, c
Gui, Add, Button, x125 y120 w30 h20 gMFHLX, -15
Gui, Add, Button, x155 y120 w30 h20 gPFHLX, +15

Gui, Add, Button, x25 y140 w20 h20 gminHLY, -
Gui, Add, Button, x45 y140 w20 h20 gplsHLY, +
Gui, Add, Edit, x65 y140 w40 h20 vmovHLY,
Gui, Add, Button, x105 y140 w20 h20 gclrHLY, c
Gui, Add, Button, x125 y140 w30 h20 gMFHLY, -15
Gui, Add, Button, x155 y140 w30 h20 gPFHLY, +15

Gui, Add, Button, x190 y120 w50 h40 gmovHL, Move (Alt+m)
Gui, Add, Button, x245 y120 w80 h40 gmouseMovHL, Mouse Move (Alt+Shift+m)

gui, add, text, 0x12 x1 y168 w250 h70,
Gui, Add, Text, x5 y170 h20, - Edit Properties -

Gui, Add, Text, x5 y193 w20 h20, W:
Gui, Add, Edit, x20 y190 w40 h20 vforceW,
Gui, Add, Text, x65 y193 w20 h20, H:
Gui, Add, Edit, x80 y190 w40 h20 vforceH,
Gui, Add, Button, x120 y190 w20 h20 gclrWH, c

Gui, Add, Text, x5 y213 w20 h20, X:
Gui, Add, Edit,  x20 y210 w40 h20 vforceX,
Gui, Add, Text, x65 y213 w20 h20, Y:
Gui, Add, Edit, x80 y210 w40 h20 vforceY,
Gui, Add, Button, x120 y210 w20 h20 gclrXY, c

Gui, Add, Button, x140 y190 w45 h40 geditWHXY, Edit WHXY (Alt+W)

Gui, Add, Button, x190 y190 w50 h40 gto00, To Zeros (Alt+z)

gui, add, text, 0x12 x251 y168 w112 h70,
Gui, Add, Text, x255 y170 h20, - Select All -
Gui, Add, Button, x255 y190 w50 h40 gselAllValues, <value> Labels
Gui, Add, Button, x310 y190 w50 h40 gselAllBtns, FIN Buttons

Gui, Add, Text, x5 y240, * Whatever is selected in FIN | lite will be cloned *

gui, add, text, 0x12 x1 y258 w362 h70,
Gui, Add, Button, x5 y260 w90 h40 gdragClones, Drag Clones to Blank Fields
Gui, Add, Button, x95 y260 w90 h40 gdragBtnClones, Drag Clones to Button Pics
Gui, Add, Text, x200 y260 h20, Tweak Clone Placement
Gui, Add, Text, x200 y280 h20,X: 
Gui, Add, Edit, x215 y280 w40 h20 vtweakClonesX,
Gui, Add, Text, x260 y280 h20,Y: 
Gui, Add, Edit, x275 y280 w40 h20 vtweakClonesY,

Gui, add, checkbox, x5 y305 vsingleClone, One Clone at a Time

Gui, Add, Text, x150 y310 w200 h15 vactionFeedback,

; ------------------------------------------------------------------------
Gui, Tab, Attach
Gui, Add, Button, x%helpX% y0 w40 h20 gattachHelp, ?
Gui, Add, Button, x%RLDX% y0 w40 h20 gRLD, RLD

notescol := 30
c0x := 80
c1x := 105
c2x := 150
c3x := 175
c4x := 220
c5x := 247
c6x := 260
c7x := 290
c8x := 320

attRowY := 100
i := 0
; ------------------------------------------------------------------------
Gui, Add, Text, x5 y30, * "Dvc" is only used with "FLN" Categories *

gui, add, text, 0x12 x1 y48 w125 h45,
Gui, Add, Button, x5 y50 w115 h35 gevalPlugs vdragBtn, DRAG
Gui, add, progress, x2 y86 w122 h5 vdragProg CBFF0000,

gui, add, text, 0x12 x127 y48 w125 h45,
Gui, Add, Button, x130 y50 w55 h20 gsaveAsExtPlugs, Save As
Gui, Add, Button, x130 y70 w55 h20 gsaveExtPlugs, Save
Gui, Add, Button, x190 y50 w55 h40 gloadExtPlugs, Load

Gui, Add, Button, x255 y25 w35 h20 gattLess, Less
Gui, Add, Button, x290 y25 w35 h20 gattMore, More
Gui, Add, Button, x325 y25 w35 h20 gattClear, Clear

gui, add, text, 0x12 x252 y48 w111 h45,
gui, Add, Text,x%c6x% y50 h20,- See XY (Alt+Arrow)
gui, add, button, x255 y70 w35 h20 gveriXYdown,<
gui, add, edit, x290 y70 w35 h20 vveriXYnum,1
gui, add, button, x325 y70 w35 h20 gveriXYup,>

gui, add, button, x5 y%attRowY% w20 h15 gcbAllAtts,
Gui, Add, Text, x%notescol% y%attRowY%, Notes
Gui, Add, Text, x%c0x% y%attRowY% w30 h20, T.C.
Gui, Add, Button, x%c0x% y115 w25 h5 gallSameTC,
Gui, Add, Text, x115 y%attRowY%, Cat.
Gui, Add, Button, x115 y115 w25 h5 gallSameCat,
Gui, Add, Text, x%c2x% y%attRowY%  w30 h20, Dvc.
Gui, Add, Button, x%c2x% y115  w25 h5 gallSameDvc,
Gui, Add, Text, x185 y%attRowY%, Typ.
Gui, Add, Button, x185 y115 w25 h5 gallSameTyp,
Gui, Add, Text, x%c4x% y%attRowY%, Pt. #
Gui, Add, Text, x%c6x% y%attRowY%, To X:
Gui, Add, Text, x%c7x% y%attRowY%, To Y:
Gui, Add, Text, x%c6x% y%attRowY% w65 vlistening, * Listening *
Guicontrol, hide, listening

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb BackgroundTrans,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 25
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 25
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 25
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 25
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 25
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 25
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 25
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
attRowY += 20
i++

gui, add, progress, x20 y%attRowY% w10 h19 cf8d800 Background55ee11 vrowHL%i%,0
guicontrol,hide,rowHL%i%
Gui, Add, checkbox, x5 y%attRowY% w25 vplug%i%cb,
Gui, Add, edit, x%c0x% y%attRowY% w25 h20 vplug%i%_0,
Gui, Add, Edit, x%notescol% y%attRowY% w50 h20 vnotes%i%,
Gui, Add, DDL, altsubmit x%c1x% y%attRowY% w45 vplug%i%_1, Loc|Trd|Sch|Gfx|FL1|FL2|`n
Gui, Add, edit, x%c2x% y%attRowY% w25 h20 vplug%i%_2,
Gui, Add, DDL, altsubmit x%c3x% y%attRowY% w45 vplug%i%_3, A.I.|A.O.|A.V.|B.I.|B.O.|B.V.|M.I.|M.O.|M.V.|Gfx|`n
Gui, Add, Edit, x%c4x% y%attRowY% w25 h20 vplug%i%_4,

Gui, Add, Text, x%c5x% y%attRowY% BackgroundTrans, - >

Gui, Add, Edit, x%c6x% y%attRowY% w30 h20 vsocket%i%X,
Gui, Add, Edit, x%c7x% y%attRowY% w30 h20 vsocket%i%Y,
Gui, Add, button, x%c8x% y%attRowY% w40 h20 glistenForSocketPos, Listen

; ------------------------------------------------------------------------
Gui, Tab, Publish
Gui, Add, Button, x%helpX% y0 w40 h20 gpublishHelp, ?
Gui, Add, Button, x%RLDX% y0 w40 h20 gRLD, RLD

pubBtnW := 40
pubBtnX := 5

gui, add, text, 0x12 x1 y48 w362 h80,

Gui, Add, Text, x5 y30, --- DCISD SITE - Publish To:
Gui, Add, Text, x5 y50, First Tier Pubs (Alt + "Number")
Gui, Add, Button, x%pubBtnX% y70 w%pubBtnW% h40 g!1, AHU1
Gui, Add, Checkbox, x%pubBtnX% y110 vpub1cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y70 w%pubBtnW% h40 g!2, AHU2
Gui, Add, Checkbox, x%pubBtnX% y110 vpub2cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y70 w%pubBtnW% h40 g!3, AHU3
Gui, Add, Checkbox, x%pubBtnX% y110 vpub3cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y70 w%pubBtnW% h40 g!4, AHU4
Gui, Add, Checkbox, x%pubBtnX% y110 vpub4cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y70 w%pubBtnW% h40 g!5, AHU5
Gui, Add, Checkbox, x%pubBtnX% y110 vpub5cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y70 w%pubBtnW% h40 g!6, AHU6
Gui, Add, Checkbox, x%pubBtnX% y110 vpub6cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y70 w%pubBtnW% h40 g!7, AHU7
Gui, Add, Checkbox, x%pubBtnX% y110 vpub7cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y70 w%pubBtnW% h40 g!8, AHU8
Gui, Add, Checkbox, x%pubBtnX% y110 vpub8cb,

pubBtnX := 5

gui, add, text, 0x12 x1 y128 w362 h80,

Gui, Add, Text, x5 y130, Second Tier Pubs (Alt + Shift + "Number")
Gui, Add, Button, x%pubBtnX% y150 w%pubBtnW% h40 g!+1, ERU1
Gui, Add, CheckBox, x%pubBtnX% y190 vpub9cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y150 w%pubBtnW% h40 g!+2, ERU2
Gui, Add, CheckBox, x%pubBtnX% y190 vpub10cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y150 w%pubBtnW% h40 g!+3, ERU3
Gui, Add, CheckBox, x%pubBtnX% y190 vpub11cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y150 w%pubBtnW% h40 g!+4, ERU4
Gui, Add, CheckBox, x%pubBtnX% y190 vpub12cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y150 w%pubBtnW% h40 g!+5, ERU5
Gui, Add, CheckBox, x%pubBtnX% y190 vpub13cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y150 w%pubBtnW% h40 g!+6, ERU6
Gui, Add, CheckBox, x%pubBtnX% y190 vpub14cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y150 w%pubBtnW% h40 g!+7, ERU7
Gui, Add, CheckBox, x%pubBtnX% y190 vpub15cb,
; pubBtnX += %pubBtnW%
; Gui, Add, Button, x%pubBtnX% y150 w%pubBtnW% h40 g!+8,
; Gui, Add, CheckBox, x%pubBtnX% y190 vpub16cb,

pubBtnX := 5

gui, add, text, 0x12 x1 y208 w362 h80,

Gui, Add, Button, x%pubBtnX% y230 w%pubBtnW% h40 gpub17,Conc.
; Gui, Add, CheckBox, x%pubBtnX% y270 vpub17cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y230 w%pubBtnW% h40 gpub18,F.H.
; Gui, Add, CheckBox, x%pubBtnX% y270 vpub18cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y230 w%pubBtnW% h40 gpub19,Pool
; Gui, Add, CheckBox, x%pubBtnX% y270 vpub19cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y230 w%pubBtnW% h40 gpub20,I.A.
; Gui, Add, CheckBox, x%pubBtnX% y270 vpub20cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y230 w%pubBtnW% h40 gpub21,Maint.
; Gui, Add, CheckBox, x%pubBtnX% y270 vpub21cb,
pubBtnX += %pubBtnW%
Gui, Add, Button, x%pubBtnX% y230 w%pubBtnW% h40 gpub22,Cafe
; Gui, Add, CheckBox, x%pubBtnX% y270 vpub22cb,
; pubBtnX += %pubBtnW%
; Gui, Add, Button, x%pubBtnX% y230 w%pubBtnW% h40 gpub23,
; Gui, Add, CheckBox, x%pubBtnX% y270 vpub23cb,
; pubBtnX += %pubBtnW%
; Gui, Add, Button, x%pubBtnX% y230 w%pubBtnW% h40 gpub24,
; Gui, Add, CheckBox, x%pubBtnX% y270 vpub24cb,

; Gui, Add, CheckBox, x270 y210 vautoPub,Auto-Publish

Gui, Add, Text, x270 y222 h20,Folder:
Gui, Add, Edit, x305 y220 w35 h20 vfolderAutoPub,HS

Gui, Add, Text, x270 y242 h20,# Pubs:
Gui, Add, Edit, x305 y240 w35 h20 vnumAutoPub,

Gui, Add, Button, x270 y260 w70 h20 gautoPubRoutine, Auto-Pub


Gui, Add, Button, x5 y290 w80 h35 gselAllPubsBtn, Select All
Gui, Add, Button, x90 y290 w80 h35 gpubSelected, Publish Selected

Gui, Add, Checkbox, x180 y290 vactionPub, Action/Pub
Gui, Add, Checkbox, x270 y290 vsavePub checked, Save/Pub
Gui, Add, Checkbox, x180 y310 vcloseOnPub, Pub/Close
Gui, Add, Checkbox, x270 y310 vpubBeep checked, Pub/Beep

; -----------------------------------------------
Gui, Tab, Options
Gui, Add, Button, x%helpX% y0 w40 h20 goptionsHelp, ?
Gui, Add, Button, x%RLDX% y0 w40 h20 gRLD, RLD
Gui, Add, CheckBox, x10 y30 h20 vcheckOnTop gKeepOnTop checked, Keep on Top of other Windows
Gui, Add, CheckBox, x10 y60 h20 vcheckMousePos gshowMousePos, Show Mouse Position and Active Window
Gui, Add, edit, x10 y90 w25 h20 vdragSpd Range1-100, 5
Gui, Add, Text, x40 y90 w200 h40, Mouse Drag Speed (0 - 100) *0 is fastest, may cause issues...
Gui, Add, Button, x10 y120 w40 h40 gbeep, Beep
; Gui, Add, Button, x10 y130 w100 h30 gallSameDvc, All Same Dvc.
; Gui, Add, text, x120 y130 w200 h20, All Dvc. fields same as first row Dvc.
; Gui, Add, Button, x10 y170 w100 h30 gallSameTC, All Same T.C.
; Gui, Add, text, x120 y170 w200 h20, All T.C. fields same as first row T.C.

; -----------------------------------------------
Gui, color, DBE8F0
Gui, Show, x%guiX% y%guiY% w%guiW% h%guiH%, FIN-Helper

Gui, +AlwaysOnTop
CoordMode Pixel, Screen
CoordMode Mouse, Screen
Return

; -----------------------------------------------
!Down::
Return
; -----------------------------------------------
veriXYdown:
!Left::
gui, submit, NoHide
veriXYnum--

if(veriXYnum < 1){
  veriXYnum = 1
}

if(veriXYnum > 40){
  veriXYnum = 40
}

guicontrol,,veriXYnum, %veriXYnum%

mousemove,% socket%veriXYnum%X, socket%veriXYnum%Y, %dragSpd%

Return

; -----------------------------------------------
cbNum := 0
cbAllAtts:
gui, submit, nohide

cbNum++
yayNay:= Mod(cbNum, 2)
i := 0
loop 41{
		if(plug%i%_4 != Space){
			guicontrol,,plug%i%cb, % yayNay
		}
	i++
}
Return

; -----------------------------------------------
allSameTC:
gui, submit, nohide
i := 0
loop 41{
	if(plug%i%cb == 1){
		guicontrol,,plug%i%_0, % plug1_0
	}
	i++
}
Return

; -----------------------------------------------
allSameCat:
gui, submit, nohide
i := 0
loop 41{
	if(plug%i%cb == 1){
		guicontrol,choose,plug%i%_1, % plug1_1
	}
	i++
}
Return

; -----------------------------------------------
allSameDvc:
gui, submit, nohide
i := 0
loop 41{
	if(plug%i%_2 != Space){
		guicontrol,,plug%i%_2, % plug1_2
	}
	i++
}
Return

; -----------------------------------------------
allSameTyp:
gui, submit, nohide
i := 0
loop 41{
	if(plug%i%cb == 1){
		guicontrol,choose,plug%i%_3, % plug1_3
	}
	i++
}
Return

; -----------------------------------------------
!Right::
veriXYup:
gui, submit, NoHide
veriXYnum++

if(veriXYnum < 1){
  veriXYnum = 1
}
if(veriXYnum > 40){
  veriXYnum = 40
}

guicontrol,,veriXYnum, %veriXYnum%

mousemove,% socket%veriXYnum%X, socket%veriXYnum%Y, %dragSpd%

Return

; -----------------------------------------------
actionsHelp:
msgBox,,FH Help: Actions, FIN-Helper is intended to interact with "Siemens FIN | lite". (FIN | lite must be open)`n`nFIN-Helper relies heavily on searches of the screen. Ensure that the desired elements are currently visible before attempting to perform F.H. actions.`n`n Since F.H. relies on screen searches for certain images in FIN | lite, be careful not to delete/corrupt any of the PNG files in the "FIN Search Images" folder. It is recommended to look in the "FIN Search Images" folder to understand what FIN-Helper is actually searching for.`n`nOR... if you're feeling brave, you may attempt to replace the PNG files with your own cropped screenshots. Just make sure it has the same name as the original PNG image. You may want to make a copy of the unEdited "FIN Search Images" folder before tinkering.`n`n>>> If FIN-Helper gets stuck in a loop, or starts to act crazy, you can PAUSE the current routine with (Ctrl + Esc) or RELOAD with (Ctrl + R). Of course, you can always use (Ctrl + Alt + Delete).`n`n- Actions - - - - - - - - - - `n`nActions are usually performed on the currently selected item in FIN | lite.`n`nThe "Clone" button simply sends a quick "copy" then "paste" command.`n`nThe "Move" action will move the item with the arrow keys, while the "Mouse Move" action will accurately move the item by clicking and dragging. (which is usually faster)`n`nWhen editing the "W" and "H" properties, if nothing is currently selected, the FIN | lite canvas Width and Height will be changed.`n`nWhen selecting all Value Labels or Buttons, if they are in close proximity to each other, not all may be selected...`n`nThe "Drag Clones" buttons will take the currently selected item in FIN | lite, copy it, paste it, and drag it to either the "FINfield.png" image OR to the "buttonPic.png" or "buttonPic2.png". You may want to consider producing your own cropped screen shot PNGs to match the appearance of your destination fields and buttons. 
Return

; -----------------------------------------------
attachHelp:
msgBox,1,FH Help: Attach (Page 1), FIN-Helper is intended to interact with "Siemens FIN | lite". (FIN | lite must be open)`n`nFIN-Helper relies heavily on searches of the screen. Ensure that the desired elements are currently visible before attempting to perform F.H. actions.`n`n Since F.H. relies on screen searches for certain images in FIN | lite, be careful not to delete/corrupt any of the PNG files in the "FIN Search Images" folder. It is recommended to look in the "FIN Search Images" folder to understand what FIN-Helper is actually searching for.`n`nOR... if you're feeling brave, you may attempt to replace the PNG files with your own cropped screenshots. Just make sure it has the same name as the original PNG image. You may want to make a copy of the unEdited "FIN Search Images" folder before tinkering.`n`n>>> If FIN-Helper gets stuck in a loop, or starts to act crazy, you can PAUSE the current routine with (Ctrl + Esc) or RELOAD with (Ctrl + R). Of course, you can always use (Ctrl + Alt + Delete).`n`n- Attach - - - - - - - - - - `n`nAttachment is achieved by finding and dragging points from the FIN | lite "Panels" sidebar to attachment XY-coordinates on the screen.`n`nEach ROW represents the description of a "point" in a Siemens Controller (TC) as well the coordinates for the point to be dragged and dropped (attached).`n`nFIN-Helper can attach a batch of up to 40 points in one routine!`n`nThe checkbox is used to determine which points will be attached when you hit the "DRAG" button. If the box is unchecked, the attachment will be omitted from the routine.`n`nThe "T.C." field indicates which controller the point is in. "1" would indicate the top-most controller.`n`nThe "notes" field is for your own use. You may want to briefly describe the point being attached for your own future reference.`n`nThe "Category" field describes if the point is considered a "Local" point, "Trends" point, "Schedules" point, "Graphics" point, "FLN (1)", or "FLN (2)" point. "Category" must not be blank.`n`n
IfMsgBox Ok
  msgBox,1,FH Help: Attach (Page 2), - Attach - - - - - - - - -`n`nThe "Device #" field is only used with the "FLN" categories. It describes the position of the target device in the currently selected TC hierarchy. If you do not want the "FLN" Category, LEAVE IT BLANK.`n`nThe "Point Type"field must not be blank.`n`nThe "Point #" field specifies the location of the actual desired attachment point within it's hierachy. If you enter a number greater than the last point in the hierarchy, the attachment will not be accurate.`n`nThe "To X:" and "To Y:" fields specify WHERE the desired point will be dragged-and-dropped. Simply hit the corresponding "Listen" button, then click the point's attachment location on the screen. This is best done in fullscreen. You may also use the "Show Mouse Position" option in the "Options" Tab.`n`nThe "DRAG" button will initiate the attachment routine. It will select and drag each checked-point to their specified attachment coordinates. FIN-Helper goes through a 12-step process of selecting and sending arrow keys before clicking and dragging the blue highlighted item in the FIN | lite "Panels" sidebar.`n`nThe "Save" button will save all of the attachment input fields to a .INI file in the "FH Attachment Files" folder. You can easily edit the .INI file with a text editor.`n`nThe "Load" button will populate all of the attachment fields from a .INI file in the "FH Attachment Files" folder.`n`nThe "More" and "Less" buttons will show 5 more/less attachment point rows.`n`nFor both the "Device #" and "Point #" fields, be sure to specify the number of the device/point from the TOP of the respective hierarchy. Enter "3" for the third item in the hierarchy; for the top-most device, enter "1". `n`n>>> Keep in mind! F.H. is just navigating the FIN | lite point hierarchy by searching for the current blue selection in the "Panels" sidebar, and by clicking and sending arrow keys. F.H. is NOT searching/processing the point's NAME!`n`nF.H. will attempt to attach whatever point in the hierarchy you specify. So, if any points/graphics pages get added to the T.C., the hierarchy has changed and the attachment description may now be off.`n`nDuring/After the routine, be sure to watch/verify that the correct points are being attached!
Return

; -----------------------------------------------
publishHelp:
msgBox,,FH Help: Publish, FIN-Helper is intended to interact with "Siemens FIN | lite". (FIN | lite must be open)`n`nFIN-Helper relies heavily on searches of the screen. Ensure that the desired elements are currently visible before attempting to perform F.H. actions.`n`n Since F.H. relies on screen searches for certain images in FIN | lite, be careful not to delete/corrupt any of the PNG files in the "FIN Search Images" folder. It is recommended to look in the "FIN Search Images" folder to understand what FIN-Helper is actually searching for.`n`nOR... if you're feeling brave, you may attempt to replace the PNG files with your own cropped screenshots. Just make sure it has the same name as the original PNG image. You may want to make a copy of the unEdited "FIN Search Images" folder before tinkering.`n`n>>> If FIN-Helper gets stuck in a loop, or starts to act crazy, you can PAUSE the current routine with (Ctrl + Esc) or RELOAD with (Ctrl + R). Of course, you can always use (Ctrl + Alt + Delete).`n`n- Publish - - - - - - - - - - `n`nCurrently, the "Publish" functionality of FIN-Helper is specifically geared toward the main Denver City ISD jobsite.
Return

; -----------------------------------------------
optionsHelp:
msgBox,,FH Help: Options, FIN-Helper is intended to interact with "Siemens FIN | lite". (FIN | lite must be open)`n`nFIN-Helper relies heavily on searches of the screen. Ensure that the desired elements are currently visible before attempting to perform F.H. actions.`n`n Since F.H. relies on screen searches for certain images in FIN | lite, be careful not to delete/corrupt any of the PNG files in the "FIN Search Images" folder. It is recommended to look in the "FIN Search Images" folder to understand what FIN-Helper is actually searching for.`n`nOR... if you're feeling brave, you may attempt to replace the PNG files with your own cropped screenshots. Just make sure it has the same name as the original PNG image. You may want to make a copy of the unEdited "FIN Search Images" folder before tinkering.`n`n>>> If FIN-Helper gets stuck in a loop, or starts to act crazy, you can PAUSE the current routine with (Ctrl + Esc) or RELOAD with (Ctrl + R). Of course, you can always use (Ctrl + Alt + Delete).`n`n- Options - - - - - - - - - - `n`n
Return

; -----------------------------------------------
clrWH:
guicontrol,,forceW,
guicontrol,,forceH,
Return

; -----------------------------------------------
clrXY:
guicontrol,,forceX,
guicontrol,,forceY,
Return

; -----------------------------------------------
!z::
to00:
gui,submit,nohide
WinActivate, FIN | lite

GuiControl,,forceW,
GuiControl,,forceH,
GuiControl,,forceX,0
GuiControl,,forceY,0

gosub, editWHXY

Return

; -----------------------------------------------
attClear:
msgbox, 4,, Are you sure you want to Clear?
ifmsgBox Yes
  Gosub, clearAtts
Return

; -----------------------------------------------
clearAtts:
i := 1
Loop 40{
  GuiControl,,plug%i%cb,
  GuiControl,,plug%i%cb,0
  GuiControl,,plug%i%_0,
  GuiControl,,notes%i%,
  GuiControl,choose, plug%i%_1, 7
  GuiControl,,plug%i%_2,
  GuiControl,choose, plug%i%_3, 11
  GuiControl,,plug%i%_4,
  GuiControl,,socket%i%X,
  GuiControl,,socket%i%Y,
  i++
}
Return

; -----------------------------------------------
attMore:
attSegs++
if(attSegs > 6){
  attSegs = 6
  Return
}

loop 8{
  guiH += 10
  Gui, Show,h%guiH%, FIN-Helper
}

guiH += 25

Gui, Show,h%guiH%, FIN-Helper

Return
; -----------------------------------------------
attLess:
attSegs--
if(attSegs < 0){
  attSegs = 0
  Return
}

loop 8{
  guiH -= 10
  Gui, Show,h%guiH%, FIN-Helper
}

guiH -= 25

Gui, Show,h%guiH%, FIN-Helper

Return
; -----------------------------------------------
saveAsExtPlugs:
Gui, Submit, NoHide

FileSelectFile, saveName, s 27, FH Attachment Files\, Load Attachment File..., Documents(*.ini)

; -----------------------------------------------
saveExtPlugs:
Gui, Submit, NoHide

if(saveName == space){
  gosub, saveAsExtPlugs
}

else{
  IniDelete, %saveName%, cb
  IniDelete, %saveName%, tc
  IniDelete, %saveName%, notes
  IniDelete, %saveName%, category
  IniDelete, %saveName%, dvc
  IniDelete, %saveName%, type
  IniDelete, %saveName%, ptNum
  IniDelete, %saveName%, toX
  IniDelete, %saveName%, toY

  i := 1
  Loop 40{
    IniWrite, % plug%i%cb, %saveName%, cb, plug%i%cb
    IniWrite, % plug%i%_0, %saveName%, tc, plug%i%_0
    IniWrite, % notes%i%, %saveName%, notes, notes%i%
    IniWrite, % plug%i%_1, %saveName%, category, plug%i%_1
    IniWrite, % plug%i%_2, %saveName%, dvc, plug%i%_2
    IniWrite, % plug%i%_3, %saveName%, type, plug%i%_3
    IniWrite, % plug%i%_4, %saveName%, ptNum, plug%i%_4
    IniWrite, % socket%i%X, %saveName%, toX, socket%i%X
    IniWrite, % socket%i%Y, %saveName%, toY, socket%i%Y
    i++
  }
}
Return

; -----------------------------------------------
loadExtPlugs:
FileSelectFile, saveName, 27, FH Attachment Files\, Load Attachment File..., Documents(*.ini)

gosub, clearAtts
sleep, 50

i := 1
loop 40 {
  IniRead, plugcb, %saveName%, cb, plug%i%cb
  GuiControl,,plug%i%cb, %plugcb%
  IniRead, plug_0, %saveName%, tc, plug%i%_0
  GuiControl,,plug%i%_0, %plug_0%
  IniRead, notes, %saveName%, notes, notes%i%
  GuiControl,,notes%i%, %notes%
  IniRead, plug_1, %saveName%, category, plug%i%_1
  GuiControl, choose, plug%i%_1, %plug_1%
  IniRead, plug_2, %saveName%, dvc, plug%i%_2
  GuiControl,,plug%i%_2, %plug_2%
  IniRead, plug_3, %saveName%, type, plug%i%_3
  GuiControl, choose, plug%i%_3, %plug_3%
  IniRead, plug_4, %saveName%, ptNum, plug%i%_4
  GuiControl,,plug%i%_4, %plug_4%
  IniRead, socketX, %saveName%, toX, socket%i%X
  GuiControl,,socket%i%X, %socketX%
  IniRead, socketY, %saveName%, toY, socket%i%Y
  GuiControl,,socket%i%Y, %socketY%
  i++
}
Return
; -----------------------------------------------
listenForSocketPos:
Guicontrol, show, listening
Send,+{Tab}
controlgetfocus,editY
Sleep, 50
Send,+{Tab}
controlgetfocus,editX
Sleep,200
WinActivate, FIN | lite
WinMaximize, FIN | lite
Keywait,LButton, D
; Keywait,LButton, U
MouseGetPos, heardX, heardY
WinActivate, FIN-Helper
Send, ^a
Sleep, 50
Send, %heardX%
Sleep, 50
Send, {Tab}
Sleep, 50
Send, ^a
Sleep, 50
Send, %heardY%
Sleep, 50
Guicontrol, hide, listening
Return
; -----------------------------------------------
!w::
editWHXY:
Gui, Submit, nohide
WinActivate, FIN | lite
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINpropertiesRightArrow.png
if (ErrorLevel == 0){
    Click, %FoundX%, %FoundY%
    Sleep, 100
}

ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINwidth.png
if (ErrorLevel == 0){
  if(forceW != space){
    FoundX += 55
    FoundY += 5
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Send, %forceW%
    Send, {Tab}
    Sleep, 100
  }
}
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINheight.png
if (ErrorLevel == 0){
  if(forceH != space){
    FoundX += 55
    FoundY += 5
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Send, %forceH%
    Send, {Tab}
    Sleep, 100
  }
}
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINw.png
if (ErrorLevel == 0){
  if(forceW != space){
    FoundX += 30
    FoundY += 5
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Send, %forceW%
    Send, {Tab}
    Sleep, 100
  }
}
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINh.png
if (ErrorLevel == 0){
  if(forceH != space){
    FoundX += 30
    FoundY += 5
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Send, %forceH%
    Send, {Tab}
    Sleep, 100
  }
}
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINx.png
if (ErrorLevel == 0){
  if(forceX != space){
    FoundX += 30
    FoundY += 5
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Send, %forceX%
    Send, {Tab}
    Sleep, 100
  }
}
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINy.png
if (ErrorLevel == 0){
  if(forceY != space){
    FoundX += 30
    FoundY += 5
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Click, %FoundX%, %FoundY%
    Sleep, 10
    Send, %forceY%
    Send, {Tab}
    Sleep, 100
  }
}
Return
; -----------------------------------------------
cut:
WinActivate, FIN | lite
Send, ^x
Return
; -----------------------------------------------
copy:
WinActivate, FIN | lite
Send, ^c
Return
; -----------------------------------------------
paste:
WinActivate, FIN | lite
Send, ^v
Return
; -----------------------------------------------
undo:
WinActivate, FIN | lite
Send, ^z
Return
; -----------------------------------------------
redo:
WinActivate, FIN | lite
Send, ^y
Return
; -----------------------------------------------
selAllValues:
Gui, Submit, nohide
WinActivate, FIN | lite

lookCounter := 0

GuiControl,,actionFeedback,Searching for regular font < value > labels... %lookCounter%
glob_List := ImageSearchList("FIN Search Images\FINvalue.png",0,0,0,0,",","`n")

Loop, Parse, glob_List, `n
  {
    Send, {CtrlDown}
    Sleep, 50
    Click %A_LoopField% 0
    mousemove,5,0,,relative
    Click
    Sleep, 50
    Send, {CtrlUp}
    Sleep, 100
    lookCounter++
    GuiControl,,actionFeedback,Selecting regular font < value > labels... %lookCounter%
  }

  glob_List := ImageSearchList("FIN Search Images\FINvalue2.png",0,0,0,0,",","`n")

  Loop, Parse, glob_List, `n
  {
    Send, {CtrlDown}
    Sleep, 50
    Click %A_LoopField% 0
    mousemove,5,0,,relative
    Click
    Sleep, 50
    Send, {CtrlUp}
    Sleep, 100
    lookCounter++
    GuiControl,,actionFeedback,Selecting regular font < value > labels... %lookCounter%
  }

glob_List := ImageSearchList("FIN Search Images\FINvalueBold.png",0,0,0,0,",","`n")

Loop, Parse, glob_List, `n
  {
    Send, {CtrlDown}
    Sleep, 50
    Click %A_LoopField% 0
    mousemove,5,0,,relative
    Click
    Sleep, 50
    Send, {CtrlUp}
    Sleep, 100
    lookCounter++
    GuiControl,,actionFeedback,Searching for regular font < value > labels... %lookCounter%
  }


GuiControl,,actionFeedback,Finished selecting < value > labels.   %lookCounter%

Return
; -----------------------------------------------
selAllBtns:
Gui, Submit, nohide
WinActivate, FIN | lite

lookCounter := 0

GuiControl,,actionFeedback,Searching for Buttons... %lookCounter%
glob_List := ImageSearchList("FIN Search Images\FINbtn.png",0,0,0,0,",","`n")
if(ErrorLevel == 0){
  Loop, Parse, glob_List, `n
    {
      Send, {CtrlDown}
      Sleep, 50
      Click %A_LoopField% 0
      mousemove,5,0,,relative
      Click
      Sleep, 50
      Send, {CtrlUp}
      Sleep, 100
      lookCounter++
      GuiControl,,actionFeedback,Searching for buttons... %lookCounter%
  }
}


glob_List := ImageSearchList("FIN Search Images\FINbtn2.png",0,0,0,0,",","`n")

Loop, Parse, glob_List, `n
  {
    Send, {CtrlDown}
    Sleep, 50
    Click %A_LoopField% 0
    mousemove,5,0,,relative
    Click
    Sleep, 50
    Send, {CtrlUp}
    Sleep, 100
    lookCounter++
    GuiControl,,actionFeedback,Searching for Buttons 2... %lookCounter%
  }


GuiControl,,actionFeedback,Finished finding Buttons.   %lookCounter%

Return

; -----------------------------------------------
evalPlugs:
Gui, Submit, nohide

i = 1

loop 40{

  if(plug%i%cb == 1 && plug%i%_0 == space){
    msgbox, T.C. (for Attachment %i%) is blank.
    return
  }

  if(plug%i%cb == 1 && plug%i%_1 == space){
    msgbox, Category (for Attachment %i%) is blank.
    return
  }

  if(plug%i%cb == 1 && plug%i%_1 == 5 || plug%i%_1 == 6){
    if(plug%i%_2 == space){
      msgBox, Device # (for Attachment %i%) is blank.
      return
    }
  }

; this changes the gfx Type value to a value of 0 in order to later, "go down by zero" in the plug%i%_3 processing step
  if(plug%i%cb == 1 && plug%i%_3 == 10){
    plug%i%_3 = 0
  }

  if(plug%i%cb == 1 && plug%i%_4 == space){
    msgbox, Point # (for Attachment %i%) is blank.
    return
  }

  if(plug%i%cb == 1 && socket%i%X == space){
    msgbox, to X: (for Attachment %i%) is blank.
    return
  }

  if(plug%i%cb == 1 && socket%i%Y == space){
    msgbox, to Y: (for Attachment %i%) is blank.
    return
  }

  if(plug%i%cb == 1){
  guicontrol,show,rowHL%i%
  } else{
  guicontrol,hide,rowHL%i%
  }

  i++
}
Gosub, drag
Return

; -----------------------------------------------
drag:
WinActivate, FIN | lite
if(dragSpd < 3){
  dragSpd = 3
}

i := 1
counter :=0
pocketPlug3 = 0

guicontrol,,dragProg,1
Gosub, step0
guicontrol,,dragProg,25
Gosub, step1
guicontrol,,dragProg,50
Gosub, step2
guicontrol,,dragProg,75
Gosub, step3
guicontrol,,dragProg,100
Loop 40{
  if(i == 40){
    guicontrol,,dragBtn, On Last Point
  }
  else{
    guicontrol,,dragBtn, Dragging # %i%
  }
  if(plug%i%cb == 1){
    counter++
    guicontrol,,dragProg,
    guicontrol,,rowHL%i%,100
    Gosub, step4
    guicontrol,,dragProg,+10
    Gosub, step5
    guicontrol,,dragProg,+10
    Gosub, step6
    guicontrol,,dragProg,+10
    Gosub, step7
    guicontrol,,dragProg,+10
    Gosub, step8
    guicontrol,,dragProg,+10
    Gosub, step9
    guicontrol,,dragProg,+10
    Gosub, step10
    guicontrol,,dragProg,+10
    Gosub, step11
    guicontrol,,dragProg,+10
    Gosub, step12
    guicontrol,,dragProg,100

    guicontrol,,rowHL%i%,0
  }
  i++
}

i:=0
loop 40 {
	if(plug%i%cb == 1){
	  guicontrol,,rowHL%i%,100
	}
i++
}

gosub,beep

if(counter == 1){
  msgbox,,Finished Attaching,%counter% point was attached.
}
else{
  msgbox,,Finished Attaching,%counter% points were attached.
}
guicontrol,,dragBtn, Finished!
sleep, 2000
guicontrol,,dragBtn, DRAG
guicontrol,,dragProg,

i:=0
loop 40 {
	if(plug%i%cb == 1){
	  guicontrol,hide,rowHL%i%,
	}
i++
}

Return

; ----------------------------------------------
step0:
; msgbox, making sure "Panels" sidebar is expanded

mouseMove,-50, 0,, Relative
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINpanelsRightArrow.png
if(ErrorLevel == 0){
  Click, %FoundX%, %FoundY%
  Sleep, 750
}

; -----------------------------------------------
step1:
; msgbox, Minimize "Components"
mouseMove,-50, 0,, Relative
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINcomponentsDownArrow.png
if(ErrorLevel == 0){
  Click, %FoundX%, %FoundY%
  Sleep, 750
}

; msgbox, Minimize "Layers"
mouseMove,-50, 0,, Relative
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINlayersDownArrow.png
if(ErrorLevel == 0){
  Click, %FoundX%, %FoundY%
  Sleep, 750
}
Return

; -----------------------------------------------
step2:
; msgbox, Minimize "Properties"
mouseMove,-50, 0,, Relative
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINpropertiesDownArrow.png
if(ErrorLevel == 0){
  Click, %FoundX%, %FoundY%
  Sleep, 750
}

; msgbox, Minimize "File System"
mouseMove,-50, 0,, Relative
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINfileSystemDownArrow.png
if(ErrorLevel == 0){
  Click, %FoundX%, %FoundY%
  Sleep, 750
}

; msgbox, looking for layers
mouseMove,-50, 0,, Relative
ImageSearch, layersX, layersY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINlayers.png
if(ErrorLevel == 0){
  layersX = %layersX%
  layersY = %layersY%
}
Return

; -----------------------------------------------
step3:
; msgbox, click all down arrows

loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\MSDwnArr.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
    else{
      break
    }
}

loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\BinaryDwnArr.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
    else{
      break
    }
}

loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\AnalogDwnArr.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
    else{
      break
    }
}

loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\DvcDwnArr.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
    else{
      break
    }
}

loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\TrendsDwnArr.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
    else{
      break
    }
}

loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\SchedDwnArr.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
    else{
      break
    }
}

loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\GfxDwnArr.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
    else{
      break
    }
}

; msgbox, click all blue down arrows
loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\FINblueDownArrow.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
  else{
    break
  }
}

; msgbox, click all down arrows
loop{
  mouseMove,-50, 0,, Relative
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\FINdownArrow.png
  if (ErrorLevel == 0){
      click, %FoundX%, %FoundY%
      Sleep, 750
  }
    else{
      break
    }
}

; -----------------------------------------------
step4:
; msgbox, click first TC
mouseMove,-50, 0,, Relative
ImageSearch, TopX, TopY, 0, 0, A_ScreenWidth, %layersY%, FIN Search Images\FINconnectToPanel.png
if (ErrorLevel == 0){
  TopY+=35
  Click, %TopX%, %TopY%
  Sleep, 100

  loop 20 {
    send, {up}
    sleep, 10
  }

  Sleep, 100
}
Return

; -----------------------------------------------
step5:
plug%i%_0 -= 1

loop % plug%i%_0{
  send, {down}
  sleep, 100
}

Sleep, 250

send, {right}
Sleep, 1000

loop{
  mouseMove,-50, 0,, Relative
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINplease.png
  if (ErrorLevel > 0){
    sleep, 100
    break
    }
  }

loop{
  mouseMove,-50, 0,, Relative
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINnotification.png
  if (ErrorLevel > 0){
    Sleep, 100
    break
  }
}

sleep, 500

Return

; -----------------------------------------------
step6:
; msgbox, looking for icon

if(plug%i%_1 == 1){
  lookFor := "FIN Search Images\FINlocal.png"
}
if(plug%i%_1 == 2){
  lookFor := "FIN Search Images\FINtrends.png"
}
if(plug%i%_1 == 3){
  lookFor := "FIN Search Images\FINscheds.png"
}
if(plug%i%_1 == 4){
  lookFor := "FIN Search Images\FINgraphics.png"
}
if(plug%i%_1 == 5){
  lookFor := "FIN Search Images\FINFLN.png"
}
if(plug%i%_1 == 6){
  lookFor := "FIN Search Images\FIN2FLNs.png"
}

mouseMove,-50, 0,, Relative
ImageSearch, FoundX, FoundY, %FoundX%, %FoundY%, A_ScreenWidth, %layersY%, *10 %lookFor%
if(ErrorLevel == 0){
  if(plug%i%_1 == 6){
    FoundY+=22
  }
  FoundX+=5
  FoundY+=5
  Click, %FoundX%, %FoundY%
  sleep, 250
  Send, {Right}
  Sleep, 1000
}
Else{
  mousemove,0,0
  sleep,200
  ImageSearch, FoundX, FoundY, %FoundX%, %FoundY%, A_ScreenWidth, %layersY%, *10 %lookFor%
  if(ErrorLevel == 0){
  	if(plug%i%_1 == 6){
    	FoundY+=22
  	}
  FoundX+=5
  FoundY+=5
  Click, %FoundX%, %FoundY%
  sleep, 250
  Send, {Right}
  Sleep, 1000
  }

}

Return

; -----------------------------------------------
step7:
; msgbox, processing plug%i%_2
loop % plug%i%_2{
  Send, {down}
  Sleep, 100
}
sleep, 250

if(plug%i%_2 > 0){
  Send, {Right}
  Sleep, 1000
}
Return

; -----------------------------------------------
step8:
; msgbox, processing plug%i%_3

pocketPlug3 = % plug%i%_3

loop % plug%i%_3{
  Send, {down}
  Sleep, 100
}
sleep, 250

if(plug%i%_3 > 0){
  Send, {Right}
  Sleep, 1000
}
Return

; -----------------------------------------------
step9:
; msgbox, going down by the value of plug%i%_4
loop % plug%i%_4{
  Send, {down}
  Sleep, 100
}
sleep, 250
Return

; -----------------------------------------------
step10:
; msgbox, searching for fin select blue
mouseMove,-50, 0,, Relative
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, %layersY%, *10 FIN Search Images\FINselBlue.png
if(ErrorLevel == 0){
  FoundX+=10
  FoundY+=10
  mouseMove, %FoundX%, %FoundY%
  sleep, 100
  Click, Down
  sleep, 100
  mouseMove, 10, 0, 50, Relative
  Sleep, 100
  mouseMove, socket%i%X, socket%i%Y,%dragSpd%
  Sleep, 100
  Click, Up
  sleep, 500
}
Return

; -----------------------------------------------
step11:
; msgbox, looking for fin yes
mouseMove,-50, 0,, Relative
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *TransBlack *10 FIN Search Images\FINyes.png
if (ErrorLevel == 0){
  Loop 3 {
  	send, {tab}
  	sleep, 100
  }
  send, {space}
  Sleep, 250
}
Return

; -----------------------------------------------
step12:
; msgbox, sending lefts

Loop 15 {
	send, {left}
	sleep, 200
}
Return



; -----------------------------------------------

dragBtnClones:
Gui, Submit, nohide
if(dragSpd > 2){
  dragSpd = 2
}
dragThis := "FIN Search Images\FINselBox.png"
dragToThis := "FIN Search Images\buttonPic.png"
dragToThis2 := "FIN Search Images\buttonPic2.png"
dragToThis3 := "FIN Search Images\buttonPic3.png"
stopit = 0
Gosub, dragCloneLoop
Return

; -----------------------------------------------
dragClones:
Gui, Submit, nohide
if(dragSpd > 2){
  dragSpd = 2
}
dragThis := "FIN Search Images\FINselBox.png"
dragToThis := "FIN Search Images\FINfield.png"
dragToThis2 := "FIN Search Images\FINfield2.png"
dragToThis3 := "FIN Search Images\FINfield3.png"
stopit = 0
Gosub, dragCloneLoop
Return

; -----------------------------------------------
dragCloneLoop:
ImageSearch, parentX, parentY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %dragThis%
if(ErrorLevel == 0){
  parentX+=10
  parentY+=10
  Loop{

    ; msgbox, about to click parent
    click, %parentX%, %parentY%
    sleep, 10

    gosub, LookForSelected

    if(stopit > 0)
      break

    ; msgbox, about to clone
    gosub, cloneHL
    sleep, 10

    ; msgbox, moving to fresh clone
    MouseMove, 15, 15,,Relative
    Sleep,10
    Click, Down
    Sleep, 10
    FoundX2+=%tweakClonesX%
    FoundY2+=%tweakClonesY%
    FoundX2+=6
    FoundY2+=6
    ; msgbox, moving to destination
    MouseMove, %FoundX2%, %FoundY2%, %dragSpd%
    Sleep,10
    Click, Up
    Sleep, 10
    if(singleClone == 1){
      stopit = 1
      break
    }
  }
}
Return

; ----------------------------------------------------------------------------
LookForSelected:
WinActivate, FIN | lite

ImageSearch, FoundX2, FoundY2, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %dragToThis%
if (Errorlevel > 0){
  ImageSearch, FoundX2, FoundY2, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %dragToThis2%
  if (Errorlevel > 0){
    ImageSearch, FoundX2, FoundY2, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 %dragToThis3%
    if (Errorlevel > 0){
      stopit = 1
      msgbox,,,Couldn't find %dragToThis% %dragToThis2% %dragToThis3%`n`n( This alert will close ), 2  
    }
  }
}

Return
; ----------------------------------------------

; ----------------------------------------------------------------------------
PFHLX:
WinActivate, FIN | lite
Loop 15 {
    Send, {Right}
    Sleep, 10
  }
Return
; ----------------------------------------------------------------------------
PFHLY:
WinActivate, FIN | lite
Loop 15 {
    Send, {Down}
    Sleep, 10
  }
Return
; ----------------------------------------------------------------------------
MFHLX:
WinActivate, FIN | lite
Loop 15 {
    Send, {Left}
    Sleep, 10
  }
Return
; ----------------------------------------------------------------------------
MFHLY:
WinActivate, FIN | lite
Loop 15 {
    Send, {Up}
    Sleep, 10
  }
Return
; ----------------------------------------------------------------------------
minHLX:
Gui,Submit,NoHide
movHLX--
GuiControl,,movHLX,%movHLX%
Return
; ----------------------------------------------------------------------------
plsHLX:
Gui,Submit,NoHide
movHLX++
GuiControl,,movHLX,%movHLX%
Return
; ----------------------------------------------------------------------------
minHLY:
Gui,Submit,NoHide
movHLY--
GuiControl,,movHLY,%movHLY%
Return
; ----------------------------------------------------------------------------
plsHLY:
Gui,Submit,NoHide
movHLY++
GuiControl,,movHLY,%movHLY%
Return
; ----------------------------------------------------------------------------
clrHLX:
GuiControl,,movHLX,
Return
; ----------------------------------------------------------------------------
clrHLY:
GuiControl,,movHLY,
Return
; ----------------------------------------------------------------------------
!d::
gosub, cloneHL
Return
; ----------------------------------------------------------------------------
cloneHL:
WinActivate, FIN | lite
Send, ^c
Sleep, 25
Send, ^v
Return
; ----------------------------------------------------------------------------
!m::
gosub, movHL
Return
; ----------------------------------------------------------------------------
movHL:
Gui, Submit, Nohide
WinActivate, FIN | lite

if(movHLX < 0){
  movHLX *= -1
  Loop %movHLX% {
    Send, {Left}
    Sleep, 10
  }
}
else{
  Loop %movHLX% {
    Send, {Right}
    Sleep, 10
  }
}

if(movHLY < 0){
  movHLY *= -1
  Loop %movHLY% {
    Send, {Up}
    Sleep, 10
  }
}
else{
  Loop %movHLY% {
    Send, {Down}
    Sleep, 10
  }
}

Return
; ----------------------------------------------------------------------------
!+m::
mouseMovHL:
Gui, Submit, Nohide
if(movHLX == space){
  guicontrol,,movHLX,0
  Gui, Submit, Nohide  
}
if(movHLY == space){
  guicontrol,,movHLY,0
  Gui, Submit, Nohide
}

WinActivate, FIN | lite

ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINselBox.png
if(ErrorLevel == 0){
  FoundX+=9
  FoundY+=9

  mouseMove, %FoundX%, %FoundY%
  Sleep, 10
  Click, Down
  Sleep, 10

  mouseMove, %movHLX%, %movHLY%, %dragSpd%, Relative
  sleep, 10

  Click, Up
}
Return
; ----------------------------------------------------------------------------
!1::
pub1:
dnum := 2
gosub, PubRoutine
Return

!2::
pub2:
dnum := 3
gosub, PubRoutine
Return

!3::
pub3:
dnum := 4
gosub, PubRoutine
Return

!4::
pub4:
dnum := 5
gosub, PubRoutine
Return

!5::
pub5:
dnum := 6
gosub, PubRoutine
Return

!6::
pub6:
dnum := 7
gosub, PubRoutine
Return

!7::
pub7:
dnum := 8
gosub, PubRoutine
Return

!8::
pub8:
dnum := 9
gosub, PubRoutine
Return

!+1::
pub9:
dnum := 10
gosub, PubRoutine
Return

!+2::
pub10:
dnum := 11
gosub, PubRoutine
Return

!+3::
pub11:
dnum := 12
gosub, PubRoutine
Return

!+4::
pub12:
dnum := 13
gosub, PubRoutine
Return

!+5::
pub13:
dnum := 14
gosub, PubRoutine
Return

!+6::
pub14:
dnum := 15
gosub, PubRoutine
Return

!+7::
pub15:
dnum := 16
gosub, PubRoutine
Return

!+8::
pub16:
dnum := 0
gosub, PubRoutine
Return

pub17:
dnum := 0
gosub, PubRoutine
Return

pub18:
dnum := 1
gosub, PubRoutine
Return

pub19:
dnum := 17
gosub, PubRoutine
Return

pub20:
dnum := 18
gosub, PubRoutine
Return

pub21:
dnum := 19
gosub, PubRoutine
Return

pub22:
dnum := 20
gosub, PubRoutine
Return

pub23:
dnum := 0
gosub, PubRoutine
Return

pub24:
dnum := 0
gosub, PubRoutine
Return
; -----------------------------------------------
pubSelected:
Gui, Submit, nohide
DetectHiddenWindows, On
WinActivate, FIN | lite

ii := 1
Loop 16 {
  if(pub%ii%cb == 1){
    sleep, 100
    gosub, pub%ii%
    Sleep, 100
  }
  ii++
}

Return

; -----------------------------------------------
selAllPubsBtn:
pubsNum++
if(Mod(pubsNum, 2) == 1){
  goto, selAllPubs
}
else{
  goto, deselAllPubs
}
Return

; -----------------------------------------------
selAllPubs:
i = 1
Loop 24 {
  Guicontrol,,pub%i%cb,1
  i++
}

Return

; -----------------------------------------------
deselAllPubs:
i = 1
Loop 24 {
  Guicontrol,,pub%i%cb,0
  i++
}

Return

; ----------------------------------------------------------------------------
autoPubRoutine:
Gui, Submit, NoHide

CBs:=0
i:=1
loop 15 {
  CBs += pub%i%cb
  i++
}

if(CBs == 1){
  DetectHiddenWindows, On
  WinActivate, FIN | lite
  Send, {Esc}
  sleep, 300

  Gui, Submit, NoHide
  DetectHiddenWindows, On
  WinActivate,% folderAutoPub
  sleep, 300

  send, {down}
  sleep, 50

  send, {up}
  sleep, 50

  GuiControl,,closeOnPub,1
  closeOnPub = 1

  i:=0
  loop %numAutoPub% {
    i++

    ImageSearch, FoundX, FoundY, 0, 0, 3840, A_ScreenHeight, *10 FIN Search Images\WINFINiconBlue.png
      if(errorlevel == 0){
        mouseMove, %FoundX%, %FoundY%
        click, Down
        sleep, 50
        mouseMove, 925, 560
        sleep, 50
        click, up
        sleep, 1500
      }

    loop{
      ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINstatus.png
      if (ErrorLevel > 0){
        sleep, 100
        break
        }
      }

    loop{
      ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINnotification.png
      if (ErrorLevel > 0){
        Sleep, 100
        break
      }
    }

    gosub, pubSelected

    Gui, Submit, NoHide
    DetectHiddenWindows, On
    WinActivate,% folderAutoPub
    sleep, 300

    if(i != numAutoPub){
      send, {down}
      sleep, 10
    }
  }

  sleep, 500

  if(pubBeep == true){
      gosub, beep
  }
}

return

; ----------------------------------------------------------------------------
pubAction:
WinActivate, FIN | lite

ImageSearch, FoundX, FoundY, 10, 125, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINselBlue.png
if (ErrorLevel == 0){
	Click, %FoundX%, %FoundY%
	sleep, 200
}
Send, {right}
sleep, 750
loop 3 {
	send,{down}
	sleep, 100
}
send, {right}
sleep, 750
loop 5 {
	send,{down}
	sleep, 100
}

mouseMove,-300,0,Relative
sleep, 100

ImageSearch, FoundX, FoundY, 10, 125, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINselBlue.png
if(ErrorLevel == 0){
  FoundX+=10
  FoundY+=10
  mouseMove, %FoundX%, %FoundY%
  sleep, 100
  Click, Down
  sleep, 100
  mouseMove, 10, 0, 50, Relative
  Sleep, 100
  mouseMove, 1124, 748, 5
  Sleep, 100
  Click, Up
  sleep, 750
}

mousemove, 500, 500
sleep, 100

ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 *TransBlack FIN Search Images\FINyes.png
if(ErrorLevel == 0){
	click, %FoundX%, %FoundY%
	sleep, 1000	
}

loop 4 {
	send, {left}
	sleep, 750
}

Send, {down}
sleep, 100

mousemove, 500, 500
sleep, 100

Return
; ----------------------------------------------------------------------------
!p::
PubRoutine:
Gui, Submit, NoHide
DetectHiddenWindows, On
WinActivate, FIN | lite
Send, {Esc}

; this is pasting an icon before publishing
if(actionPub == true){

  ; ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, FIN Search Images\OAT.png
  ;   if(errorlevel == 0){
  ;     FoundY+=40
  ;     click, %FoundX%, %FoundY%
  ;     sleep, 50
  ;     Send, {delete}
  ;   }

  gosub, pubAction
  Sleep 300
  Send, {Esc}
  sleep, 100
}

Send ^+p
Sleep 100

loop 5{
  if(savePub == true){
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, FIN Search Images\FINyes.png
    if(errorlevel == 0){
      click, %FoundX%, %FoundY%
    }
  }
  else{
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, FIN Search Images\FINno.png
    if(errorlevel == 0){
      click, %FoundX%, %FoundY%
    }
  }

  sleep, 500
}

i:=0
Loop 50 {
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, FIN Search Images\FINpublishGraphic.png
  if(errorlevel == 0){
    break
  }
  i++
  sleep, 200
  if(i>49){
    reload
  }
}

Loop 4 {
  Send {Tab}
  Sleep, 100
}
Sleep 100

; msgbox, %dnum%
Loop %dnum%{
  Send {Down}     ; on Unit
  Sleep, 100
}

Loop 2 {
  Send {Tab}
  Sleep, 100
}
Sleep 2000

Send {Down}     ; on "Drive B"
Sleep, 100

Send {Tab}
Sleep 100

Send {Space}          ; hit "Publish" button

gosub, LookForOk

if(closeOnPub is checked){
  Send, ^{Del}          ; Close FIN Page
  sleep, 200
}

Sleep 100
if(pubBeep == true){
  gosub, beep
}
Return

; ----------------------------------------------------------------------------
LookForOk:
WinActivate, FIN | lite
Loop{
  ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 FIN Search Images\FINok.png
  if(ErrorLevel = 0){
	   click, %FoundX%, %FoundY%
     break
  }
}
Return

; ----------------------------------------------

;========================================================================
; 
; Function:     ImageSearchList
; Description:  Find and list multiple instances of a single image on screen
; Online Ref.:  http://www.autohotkey.com/forum/viewtopic.php?p=361474#361474
;
; Last Update:  09/Jun/2010 03:00
;
; Created by:   MasterFocus
;               http://www.autohotkey.net/~MasterFocus/AHK/
;
; Thanks to:    jethrow for original code/algorithm
;               http://www.autohotkey.com/forum/post-302703.html#302703
;
;========================================================================
;
; p_ImgStr [, p_StartX, p_StartY, p_EndX, p_EndY, p_CDelim, p_LDelim, p_DebugFunc]
;
; + Required parameters:
; - p_ImgStr       ImageSearch's file string (containing options, if any)
;
; + Optional parameters:
; - p_StartX       Initial X coordinate (default is 0)
; - p_StartY       Initial Y coordinate (default is 0)
; - p_EndX         Final X coordinate (default is 0, uses A_ScreenWidth)
; - p_EndY         Final Y coordinate (default is 0, uses A_ScreenHeight)
; - p_CDelim       Coordinate delimiter of the output list (default is ",")
; - p_LDelim       Line delimiter of the output list (default is "`n")
; - p_DebugFunc    A debug function's name (literal string, default is blank)
;
; The function returns a list of distinct positions (X and Y coordinates)
; where the specified image was found (according to the options, if any).
;
; A debug function can be created to retrieve further information on every
; iteration the image is searched. The parameters for this function are:
; - The number of the current iteration
; - ImageSearch's output X coordinate
; - ImageSearch's output Y coordinate
; - The starting X coordinate where the search was conducted
; - The starting Y coordinate where the search was conducted
; - The final X coordinate where the search was conducted
; - The final Y coordinate where the search was conducted")
; - The ImageFile string that was used (always the same as p_ImgStr)
; - The current list of matching coordinates
;
;========================================================================

ImageSearchList(p_ImgStr,p_StartX=0,p_StartY=0,p_EndX=0,p_EndY=0,p_CDelim=",",p_LDelim="`n",p_DebugFunc="")
{
  l_Debug := IsFunc(p_DebugFunc) , l_StX := p_StartX , l_List := ""
  p_EndX := ( !p_EndX ? A_ScreenWidth : p_EndX ) , p_EndY := ( !p_EndY ? A_ScreenHeight : p_EndY )
  Loop
  {
    ImageSearch, l_OutX, l_OutY, %l_StX%, %p_StartY%, %p_EndX%, %p_EndY%, *15 %p_ImgStr%
    If l_Debug
      %p_DebugFunc%(A_Index,l_OutX,l_OutY,l_StX,p_StartY,p_EndX,p_EndY,p_ImgStr,l_List)
    If InStr( l_List , l_OutX p_CDelim l_OutY p_LDelim )
    {
      l_StX := l_OutX+1
      Continue
    }   
    If ( l_OutX="" || l_OutY="" )
      If ( l_StX <> p_StartX )
      {
        l_StX := p_StartX , p_StartY++
        Continue
      }
      Else
        Break
    l_List .= l_OutX p_CDelim ( p_StartY := l_OutY ) p_LDelim
  }
  Return l_List
}

; ----------------------------------------------
beep:
; SoundBeep,261,200
; sleep,10
; SoundBeep,329,200
; sleep,10
; SoundBeep,392,400
; sleep,10
soundPlay,FH Files\Harden.wav
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
KeepOnTop:
GuiControlGet, checkOnTop
if (checkOnTop = 1)
	Gui, +AlwaysOnTop
if (checkOnTop = 0)
	Gui, -AlwaysOnTop
Return
; -----------------------------------------------
^Esc::
WinActivate, FIN | lite
Pause
Return
; -----------------------------------------------
RLD:
Reload
Return
; -----------------------------------------------
^r::
Reload
Return
; -----------------------------------------------
GuiClose:
ExitApp