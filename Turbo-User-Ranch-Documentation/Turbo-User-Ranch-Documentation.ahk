#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; -------------------------------------------------------------------------------------------------
guiW := 430
guiH := 700
guiX := A_ScreenWidth - guiW - 5
guiY := 0
helpX := guiW - 80
RLDX := guiW - 40
borderW := guiW - 4
borderH := guiH - 30

sleepAmount := 75
beepLength := 30
beepTone := 750
beepStep := 50
prog := 0
progStep := 1.5

fullWidth := guiW - 10

Gui, color, 11EE88
Gui, Show, x%guiX% y%guiY% w%guiW% h%guiH%, Turbo User Ranch Documentation			; This is the gui window title

Gui, +AlwaysOnTop
CoordMode Pixel, Screen
CoordMode Mouse, Screen
SetTitleMatchMode, 2

today := A_Now

FormatTime, today, today, M/dd/yyyy

SetTitleMatchMode, 2 ; This sets the Title Match Mode to match with a partial string for the windowTitleChunk
windowTitleChunk := "Daily Progress Note"
currChild := ""
currPosPreset := ""
currPBArray := ""
posModString := ""

currNegPreset := ""
currNBArray := ""

childC101 := {"name": "Zayden", "sex": "male", "laundryDay": "Sunday", "posPreset01": {"PB": {}}, "posPreset02": {"PB": {}}, "posPreset03": {"PB": {}}, "negPreset01": {"NB": {}}, "negPreset02": {"NB": {}}, "negPreset03": {"NB": {}}}

childC101.posPreset01.PB.DOPB := "Zayden was sociable and generally respectful to peers and staff."
childC101.posPreset01.PB.accountability := 0
childC101.posPreset01.PB.angerImpulseControl := 0
childC101.posPreset01.PB.busReport := 0
childC101.posPreset01.PB.cleanRoom := 0
childC101.posPreset01.PB.clothingCare := 0
childC101.posPreset01.PB.completedChore := 0
childC101.posPreset01.PB.completedHomework := 0
childC101.posPreset01.PB.goodHygiene := 0
childC101.posPreset01.PB.goodSocialSkills := 5
childC101.posPreset01.PB.grateful := 0
childC101.posPreset01.PB.helpful := 0
childC101.posPreset01.PB.politeGoodManners := 0
childC101.posPreset01.PB.positiveReferral := 0
childC101.posPreset01.PB.practiceTruthfulness := 0
childC101.posPreset01.PB.respectfulOfAdults := 2
childC101.posPreset01.PB.respectfulOfPeers := 5
childC101.posPreset01.PB.respectfulOfProperty := 0
childC101.posPreset01.PB.other := 0
childC101.posPreset01.PB.posMod01 := 1
childC101.posPreset01.PB.posMod02 := 1
childC101.posPreset01.PB.posMod03 := 0
childC101.posPreset01.PB.posMod04 := 1
childC101.posPreset01.PB.posMod05 := 0
childC101.posPreset01.PB.posMod06 := 0

childC101.posPreset02.PB.DOPB := "Zayden was sociable and generally respectful to staff."
childC101.posPreset02.PB.accountability := 0
childC101.posPreset02.PB.angerImpulseControl := 0
childC101.posPreset02.PB.busReport := 0
childC101.posPreset02.PB.cleanRoom := 0
childC101.posPreset02.PB.clothingCare := 0
childC101.posPreset02.PB.completedChore := 0
childC101.posPreset02.PB.completedHomework := 0
childC101.posPreset02.PB.goodHygiene := 0
childC101.posPreset02.PB.goodSocialSkills := 2
childC101.posPreset02.PB.grateful := 0
childC101.posPreset02.PB.helpful := 0
childC101.posPreset02.PB.politeGoodManners := 0
childC101.posPreset02.PB.positiveReferral := 0
childC101.posPreset02.PB.practiceTruthfulness := 0
childC101.posPreset02.PB.respectfulOfAdults := 2
childC101.posPreset02.PB.respectfulOfPeers := 0
childC101.posPreset02.PB.respectfulOfProperty := 0
childC101.posPreset02.PB.other := 0
childC101.posPreset02.PB.posMod01 := 1
childC101.posPreset02.PB.posMod02 := 1
childC101.posPreset02.PB.posMod03 := 0
childC101.posPreset02.PB.posMod04 := 1
childC101.posPreset02.PB.posMod05 := 0
childC101.posPreset02.PB.posMod06 := 0

childC101.posPreset03.PB.DOPB := "Zayden was generally respectful of staff, though not always."
childC101.posPreset03.PB.accountability := 0
childC101.posPreset03.PB.angerImpulseControl := 0
childC101.posPreset03.PB.busReport := 0
childC101.posPreset03.PB.cleanRoom := 0
childC101.posPreset03.PB.clothingCare := 0
childC101.posPreset03.PB.completedChore := 0
childC101.posPreset03.PB.completedHomework := 0
childC101.posPreset03.PB.goodHygiene := 0
childC101.posPreset03.PB.goodSocialSkills := 0
childC101.posPreset03.PB.grateful := 0
childC101.posPreset03.PB.helpful := 0
childC101.posPreset03.PB.politeGoodManners := 0
childC101.posPreset03.PB.positiveReferral := 0
childC101.posPreset03.PB.practiceTruthfulness := 0
childC101.posPreset03.PB.respectfulOfAdults := 0
childC101.posPreset03.PB.respectfulOfPeers := 0
childC101.posPreset03.PB.respectfulOfProperty := 0
childC101.posPreset03.PB.other := 0
childC101.posPreset03.PB.posMod01 := 1
childC101.posPreset03.PB.posMod02 := 1
childC101.posPreset03.PB.posMod03 := 0
childC101.posPreset03.PB.posMod04 := 1
childC101.posPreset03.PB.posMod05 := 0
childC101.posPreset03.PB.posMod06 := 0


childC101.negPreset01.NB.DONB := "Zayden had a good day today."
childC101.negPreset01.NB.arguing := 0
childC101.negPreset01.NB.boundaries := 0
childC101.negPreset01.NB.busIncident := 0
childC101.negPreset01.NB.complaining := 0
childC101.negPreset01.NB.crueltyToAnimals := 0
childC101.negPreset01.NB.cussing := 0
childC101.negPreset01.NB.deceitfulnessLying := 0
childC101.negPreset01.NB.defiance := 0
childC101.negPreset01.NB.demanding := 0
childC101.negPreset01.NB.demandsAttention := 0
childC101.negPreset01.NB.destructionOfProperty := 0
childC101.negPreset01.NB.disobedient := 0
childC101.negPreset01.NB.disrespectfulOfPeers := 0
childC101.negPreset01.NB.disrespectfulOfAdults := 0
childC101.negPreset01.NB.harmingOthers := 0
childC101.negPreset01.NB.hostility := 0
childC101.negPreset01.NB.inappropriateDress := 0
childC101.negPreset01.NB.inappropriateSexualBehavior := 0
childC101.negPreset01.NB.manipulative := 0
childC101.negPreset01.NB.other := 0
childC101.negPreset01.NB.physicalAgression := 0
childC101.negPreset01.NB.poorHygiene := 0
childC101.negPreset01.NB.pouting := 0
childC101.negPreset01.NB.refusalToCompleteChores := 0
childC101.negPreset01.NB.selfHarming := 0
childC101.negPreset01.NB.slammingDoors := 0
childC101.negPreset01.NB.schoolBehavior := 0
childC101.negPreset01.NB.tantrum := 0
childC101.negPreset01.NB.theft := 0
childC101.negPreset01.NB.tobaccoUse := 0
childC101.negPreset01.NB.unauthorizedAbsence := 0
childC101.negPreset01.NB.verbalAbuse := 0
childC101.negPreset01.NB.violationOfRules := 0

childC101.negPreset02.NB.DONB := "Zayden teased his peers during multiple interactions."
childC101.negPreset02.NB.arguing := 0
childC101.negPreset02.NB.boundaries := 3
childC101.negPreset02.NB.busIncident := 0
childC101.negPreset02.NB.complaining := 0
childC101.negPreset02.NB.crueltyToAnimals := 0
childC101.negPreset02.NB.cussing := 0
childC101.negPreset02.NB.deceitfulnessLying := 0
childC101.negPreset02.NB.defiance := 0
childC101.negPreset02.NB.demanding := 0
childC101.negPreset02.NB.demandsAttention := 0
childC101.negPreset02.NB.destructionOfProperty := 0
childC101.negPreset02.NB.disobedient := 0
childC101.negPreset02.NB.disrespectfulOfPeers := 3
childC101.negPreset02.NB.disrespectfulOfAdults := 0
childC101.negPreset02.NB.harmingOthers := 0
childC101.negPreset02.NB.hostility := 0
childC101.negPreset02.NB.inappropriateDress := 0
childC101.negPreset02.NB.inappropriateSexualBehavior := 0
childC101.negPreset02.NB.manipulative := 0
childC101.negPreset02.NB.other := 0
childC101.negPreset02.NB.physicalAgression := 1
childC101.negPreset02.NB.poorHygiene := 0
childC101.negPreset02.NB.pouting := 0
childC101.negPreset02.NB.refusalToCompleteChores := 0
childC101.negPreset02.NB.selfHarming := 0
childC101.negPreset02.NB.slammingDoors := 0
childC101.negPreset02.NB.schoolBehavior := 0
childC101.negPreset02.NB.tantrum := 0
childC101.negPreset02.NB.theft := 0
childC101.negPreset02.NB.tobaccoUse := 0
childC101.negPreset02.NB.unauthorizedAbsence := 0
childC101.negPreset02.NB.verbalAbuse := 0
childC101.negPreset02.NB.violationOfRules := 0

childC101.negPreset03.NB.DONB := "Zayden was disrespectful to staff on multiple occasions becoming argumentative at times. He also teased his peers during many interactions."
childC101.negPreset03.NB.arguing := 3
childC101.negPreset03.NB.boundaries := 3
childC101.negPreset03.NB.busIncident := 0
childC101.negPreset03.NB.complaining := 0
childC101.negPreset03.NB.crueltyToAnimals := 0
childC101.negPreset03.NB.cussing := 0
childC101.negPreset03.NB.deceitfulnessLying := 0
childC101.negPreset03.NB.defiance := 0
childC101.negPreset03.NB.demanding := 0
childC101.negPreset03.NB.demandsAttention := 0
childC101.negPreset03.NB.destructionOfProperty := 0
childC101.negPreset03.NB.disobedient := 0
childC101.negPreset03.NB.disrespectfulOfPeers := 3
childC101.negPreset03.NB.disrespectfulOfAdults := 3
childC101.negPreset03.NB.harmingOthers := 0
childC101.negPreset03.NB.hostility := 0
childC101.negPreset03.NB.inappropriateDress := 0
childC101.negPreset03.NB.inappropriateSexualBehavior := 0
childC101.negPreset03.NB.manipulative := 0
childC101.negPreset03.NB.other := 0
childC101.negPreset03.NB.physicalAgression := 2
childC101.negPreset03.NB.poorHygiene := 0
childC101.negPreset03.NB.pouting := 0
childC101.negPreset03.NB.refusalToCompleteChores := 0
childC101.negPreset03.NB.selfHarming := 0
childC101.negPreset03.NB.slammingDoors := 0
childC101.negPreset03.NB.schoolBehavior := 0
childC101.negPreset03.NB.tantrum := 0
childC101.negPreset03.NB.theft := 0
childC101.negPreset03.NB.tobaccoUse := 0
childC101.negPreset03.NB.unauthorizedAbsence := 0
childC101.negPreset03.NB.verbalAbuse := 0
childC101.negPreset03.NB.violationOfRules := 0

childC102 := {"name": "Zeven", "sex": "male", "laundryDay": "Monday", "posPreset01": {"PB": {}}, "posPreset02": {"PB": {}}, "posPreset03": {"PB": {}}, "negPreset01": {"NB": {}}, "negPreset02": {"NB": {}}, "negPreset03": {"NB": {}}}

childC102.posPreset01.PB.DOPB := "Zeven was generally respectful to staff, sociable, and played well with his peers."
childC102.posPreset01.PB.accountability := 0
childC102.posPreset01.PB.angerImpulseControl := 0
childC102.posPreset01.PB.busReport := 0
childC102.posPreset01.PB.cleanRoom := 0
childC102.posPreset01.PB.clothingCare := 0
childC102.posPreset01.PB.completedChore := 0
childC102.posPreset01.PB.completedHomework := 0
childC102.posPreset01.PB.goodHygiene := 0
childC102.posPreset01.PB.goodSocialSkills := 5
childC102.posPreset01.PB.grateful := 0
childC102.posPreset01.PB.helpful := 0
childC102.posPreset01.PB.politeGoodManners := 0
childC102.posPreset01.PB.positiveReferral := 0
childC102.posPreset01.PB.practiceTruthfulness := 0
childC102.posPreset01.PB.respectfulOfAdults := 2
childC102.posPreset01.PB.respectfulOfPeers := 5
childC102.posPreset01.PB.respectfulOfProperty := 0
childC102.posPreset01.PB.other := 0
childC102.posPreset01.PB.posMod01 := 1
childC102.posPreset01.PB.posMod02 := 0
childC102.posPreset01.PB.posMod03 := 0
childC102.posPreset01.PB.posMod04 := 1
childC102.posPreset01.PB.posMod05 := 0
childC102.posPreset01.PB.posMod06 := 0

childC102.posPreset02.PB.DOPB := "Zeven was generally sociable and played well with his peers."
childC102.posPreset02.PB.accountability := 0
childC102.posPreset02.PB.angerImpulseControl := 0
childC102.posPreset02.PB.busReport := 0
childC102.posPreset02.PB.cleanRoom := 0
childC102.posPreset02.PB.clothingCare := 0
childC102.posPreset02.PB.completedChore := 0
childC102.posPreset02.PB.completedHomework := 0
childC102.posPreset02.PB.goodHygiene := 0
childC102.posPreset02.PB.goodSocialSkills := 3
childC102.posPreset02.PB.grateful := 0
childC102.posPreset02.PB.helpful := 0
childC102.posPreset02.PB.politeGoodManners := 0
childC102.posPreset02.PB.positiveReferral := 0
childC102.posPreset02.PB.practiceTruthfulness := 0
childC102.posPreset02.PB.respectfulOfAdults := 2
childC102.posPreset02.PB.respectfulOfPeers := 3
childC102.posPreset02.PB.respectfulOfProperty := 0
childC102.posPreset02.PB.other := 0
childC102.posPreset02.PB.posMod01 := 1
childC102.posPreset02.PB.posMod02 := 0
childC102.posPreset02.PB.posMod03 := 0
childC102.posPreset02.PB.posMod04 := 1
childC102.posPreset02.PB.posMod05 := 0
childC102.posPreset02.PB.posMod06 := 0

childC102.posPreset03.PB.DOPB := "Zeven was generally respectful of staff, often requiring redirection."
childC102.posPreset03.PB.accountability := 0
childC102.posPreset03.PB.angerImpulseControl := 0
childC102.posPreset03.PB.busReport := 0
childC102.posPreset03.PB.cleanRoom := 0
childC102.posPreset03.PB.clothingCare := 0
childC102.posPreset03.PB.completedChore := 0
childC102.posPreset03.PB.completedHomework := 0
childC102.posPreset03.PB.goodHygiene := 0
childC102.posPreset03.PB.goodSocialSkills := 0
childC102.posPreset03.PB.grateful := 0
childC102.posPreset03.PB.helpful := 0
childC102.posPreset03.PB.politeGoodManners := 0
childC102.posPreset03.PB.positiveReferral := 0
childC102.posPreset03.PB.practiceTruthfulness := 0
childC102.posPreset03.PB.respectfulOfAdults := 1
childC102.posPreset03.PB.respectfulOfPeers := 0
childC102.posPreset03.PB.respectfulOfProperty := 0
childC102.posPreset03.PB.other := 0
childC102.posPreset03.PB.posMod01 := 1
childC102.posPreset03.PB.posMod02 := 0
childC102.posPreset03.PB.posMod03 := 0
childC102.posPreset03.PB.posMod04 := 1
childC102.posPreset03.PB.posMod05 := 0
childC102.posPreset03.PB.posMod06 := 0


childC102.negPreset01.NB.DONB := "Zeven had a good day today."
childC102.negPreset01.NB.arguing := 0
childC102.negPreset01.NB.boundaries := 0
childC102.negPreset01.NB.busIncident := 0
childC102.negPreset01.NB.complaining := 0
childC102.negPreset01.NB.crueltyToAnimals := 0
childC102.negPreset01.NB.cussing := 0
childC102.negPreset01.NB.deceitfulnessLying := 0
childC102.negPreset01.NB.defiance := 0
childC102.negPreset01.NB.demanding := 0
childC102.negPreset01.NB.demandsAttention := 0
childC102.negPreset01.NB.destructionOfProperty := 0
childC102.negPreset01.NB.disobedient := 0
childC102.negPreset01.NB.disrespectfulOfPeers := 0
childC102.negPreset01.NB.disrespectfulOfAdults := 0
childC102.negPreset01.NB.harmingOthers := 0
childC102.negPreset01.NB.hostility := 0
childC102.negPreset01.NB.inappropriateDress := 0
childC102.negPreset01.NB.inappropriateSexualBehavior := 0
childC102.negPreset01.NB.manipulative := 0
childC102.negPreset01.NB.other := 0
childC102.negPreset01.NB.physicalAgression := 0
childC102.negPreset01.NB.poorHygiene := 0
childC102.negPreset01.NB.pouting := 0
childC102.negPreset01.NB.refusalToCompleteChores := 0
childC102.negPreset01.NB.selfHarming := 0
childC102.negPreset01.NB.slammingDoors := 0
childC102.negPreset01.NB.schoolBehavior := 0
childC102.negPreset01.NB.tantrum := 0
childC102.negPreset01.NB.theft := 0
childC102.negPreset01.NB.tobaccoUse := 0
childC102.negPreset01.NB.unauthorizedAbsence := 0
childC102.negPreset01.NB.verbalAbuse := 0
childC102.negPreset01.NB.violationOfRules := 0

childC102.negPreset02.NB.DONB := "Zeven told his peers to shut up and called them names on multiple occasions. Though playful, it is disrespectful and compulsive."
childC102.negPreset02.NB.arguing := 0
childC102.negPreset02.NB.boundaries := 0
childC102.negPreset02.NB.busIncident := 0
childC102.negPreset02.NB.complaining := 2
childC102.negPreset02.NB.crueltyToAnimals := 0
childC102.negPreset02.NB.cussing := 0
childC102.negPreset02.NB.deceitfulnessLying := 0
childC102.negPreset02.NB.defiance := 0
childC102.negPreset02.NB.demanding := 0
childC102.negPreset02.NB.demandsAttention := 0
childC102.negPreset02.NB.destructionOfProperty := 0
childC102.negPreset02.NB.disobedient := 0
childC102.negPreset02.NB.disrespectfulOfPeers := 0
childC102.negPreset02.NB.disrespectfulOfAdults := 2
childC102.negPreset02.NB.harmingOthers := 0
childC102.negPreset02.NB.hostility := 0
childC102.negPreset02.NB.inappropriateDress := 0
childC102.negPreset02.NB.inappropriateSexualBehavior := 0
childC102.negPreset02.NB.manipulative := 0
childC102.negPreset02.NB.other := 0
childC102.negPreset02.NB.physicalAgression := 0
childC102.negPreset02.NB.poorHygiene := 0
childC102.negPreset02.NB.pouting := 2
childC102.negPreset02.NB.refusalToCompleteChores := 1
childC102.negPreset02.NB.selfHarming := 0
childC102.negPreset02.NB.slammingDoors := 0
childC102.negPreset02.NB.schoolBehavior := 0
childC102.negPreset02.NB.tantrum := 0
childC102.negPreset02.NB.theft := 0
childC102.negPreset02.NB.tobaccoUse := 0
childC102.negPreset02.NB.unauthorizedAbsence := 0
childC102.negPreset02.NB.verbalAbuse := 0
childC102.negPreset02.NB.violationOfRules := 2

childC102.negPreset03.NB.DONB := "Zeven ran in the cottage on multiple occasions, and complained and pouted about being redirected, and often said disrespectful things to peers and staff such as, 'shut up'."
childC102.negPreset03.NB.arguing := 0
childC102.negPreset03.NB.boundaries := 0
childC102.negPreset03.NB.busIncident := 0
childC102.negPreset03.NB.complaining := 3
childC102.negPreset03.NB.crueltyToAnimals := 0
childC102.negPreset03.NB.cussing := 0
childC102.negPreset03.NB.deceitfulnessLying := 0
childC102.negPreset03.NB.defiance := 0
childC102.negPreset03.NB.demanding := 0
childC102.negPreset03.NB.demandsAttention := 1
childC102.negPreset03.NB.destructionOfProperty := 0
childC102.negPreset03.NB.disobedient := 0
childC102.negPreset03.NB.disrespectfulOfPeers := 3
childC102.negPreset03.NB.disrespectfulOfAdults := 3
childC102.negPreset03.NB.harmingOthers := 0
childC102.negPreset03.NB.hostility := 0
childC102.negPreset03.NB.inappropriateDress := 0
childC102.negPreset03.NB.inappropriateSexualBehavior := 0
childC102.negPreset03.NB.manipulative := 0
childC102.negPreset03.NB.other := 0
childC102.negPreset03.NB.physicalAgression := 0
childC102.negPreset03.NB.poorHygiene := 0
childC102.negPreset03.NB.pouting := 3
childC102.negPreset03.NB.refusalToCompleteChores := 1
childC102.negPreset03.NB.selfHarming := 0
childC102.negPreset03.NB.slammingDoors := 0
childC102.negPreset03.NB.schoolBehavior := 0
childC102.negPreset03.NB.tantrum := 0
childC102.negPreset03.NB.theft := 0
childC102.negPreset03.NB.tobaccoUse := 0
childC102.negPreset03.NB.unauthorizedAbsence := 0
childC102.negPreset03.NB.verbalAbuse := 0
childC102.negPreset03.NB.violationOfRules := 3

childC103 := {"name": "Alezander", "sex": "male", "laundryDay": "Saturday", "posPreset01": {"PB": {}}, "posPreset02": {"PB": {}}, "posPreset03": {"PB": {}}, "negPreset01": {"NB": {}}, "negPreset02": {"NB": {}}, "negPreset03": {"NB": {}}}

childC103.posPreset01.PB.DOPB := "Alezander was sociable and generally respectful to peers and staff."
childC103.posPreset01.PB.accountability := 0
childC103.posPreset01.PB.angerImpulseControl := 0
childC103.posPreset01.PB.busReport := 0
childC103.posPreset01.PB.cleanRoom := 0
childC103.posPreset01.PB.clothingCare := 0
childC103.posPreset01.PB.completedChore := 0
childC103.posPreset01.PB.completedHomework := 0
childC103.posPreset01.PB.goodHygiene := 0
childC103.posPreset01.PB.goodSocialSkills := 3
childC103.posPreset01.PB.grateful := 0
childC103.posPreset01.PB.helpful := 0
childC103.posPreset01.PB.politeGoodManners := 0
childC103.posPreset01.PB.positiveReferral := 0
childC103.posPreset01.PB.practiceTruthfulness := 0
childC103.posPreset01.PB.respectfulOfAdults := 2
childC103.posPreset01.PB.respectfulOfPeers := 6
childC103.posPreset01.PB.respectfulOfProperty := 0
childC103.posPreset01.PB.other := 0
childC103.posPreset01.PB.posMod01 := 1
childC103.posPreset01.PB.posMod02 := 1
childC103.posPreset01.PB.posMod03 := 0
childC103.posPreset01.PB.posMod04 := 1
childC103.posPreset01.PB.posMod05 := 0
childC103.posPreset01.PB.posMod06 := 0

childC103.posPreset02.PB.DOPB := "Alezander was sociable and generally respectful to staff."
childC103.posPreset02.PB.accountability := 0
childC103.posPreset02.PB.angerImpulseControl := 0
childC103.posPreset02.PB.busReport := 0
childC103.posPreset02.PB.cleanRoom := 0
childC103.posPreset02.PB.clothingCare := 0
childC103.posPreset02.PB.completedChore := 0
childC103.posPreset02.PB.completedHomework := 0
childC103.posPreset02.PB.goodHygiene := 0
childC103.posPreset02.PB.goodSocialSkills := 2
childC103.posPreset02.PB.grateful := 0
childC103.posPreset02.PB.helpful := 0
childC103.posPreset02.PB.politeGoodManners := 0
childC103.posPreset02.PB.positiveReferral := 0
childC103.posPreset02.PB.practiceTruthfulness := 0
childC103.posPreset02.PB.respectfulOfAdults := 2
childC103.posPreset02.PB.respectfulOfPeers := 2
childC103.posPreset02.PB.respectfulOfProperty := 0
childC103.posPreset02.PB.other := 0
childC103.posPreset02.PB.posMod01 := 1
childC103.posPreset02.PB.posMod02 := 1
childC103.posPreset02.PB.posMod03 := 0
childC103.posPreset02.PB.posMod04 := 1
childC103.posPreset02.PB.posMod05 := 0
childC103.posPreset02.PB.posMod06 := 0

childC103.posPreset03.PB.DOPB := "Alezander was generally respectful to staff, though occasionally requiring redirection."
childC103.posPreset03.PB.accountability := 0
childC103.posPreset03.PB.angerImpulseControl := 1
childC103.posPreset03.PB.busReport := 0
childC103.posPreset03.PB.cleanRoom := 0
childC103.posPreset03.PB.clothingCare := 0
childC103.posPreset03.PB.completedChore := 0
childC103.posPreset03.PB.completedHomework := 0
childC103.posPreset03.PB.goodHygiene := 0
childC103.posPreset03.PB.goodSocialSkills := 0
childC103.posPreset03.PB.grateful := 0
childC103.posPreset03.PB.helpful := 0
childC103.posPreset03.PB.politeGoodManners := 0
childC103.posPreset03.PB.positiveReferral := 0
childC103.posPreset03.PB.practiceTruthfulness := 0
childC103.posPreset03.PB.respectfulOfAdults := 2
childC103.posPreset03.PB.respectfulOfPeers := 0
childC103.posPreset03.PB.respectfulOfProperty := 0
childC103.posPreset03.PB.other := 0
childC103.posPreset03.PB.posMod01 := 1
childC103.posPreset03.PB.posMod02 := 1
childC103.posPreset03.PB.posMod03 := 0
childC103.posPreset03.PB.posMod04 := 1
childC103.posPreset03.PB.posMod05 := 0
childC103.posPreset03.PB.posMod06 := 0


childC103.negPreset01.NB.DONB := "Alezander had a good day today."
childC103.negPreset01.NB.arguing := 0
childC103.negPreset01.NB.boundaries := 0
childC103.negPreset01.NB.busIncident := 0
childC103.negPreset01.NB.complaining := 0
childC103.negPreset01.NB.crueltyToAnimals := 0
childC103.negPreset01.NB.cussing := 0
childC103.negPreset01.NB.deceitfulnessLying := 0
childC103.negPreset01.NB.defiance := 0
childC103.negPreset01.NB.demanding := 0
childC103.negPreset01.NB.demandsAttention := 0
childC103.negPreset01.NB.destructionOfProperty := 0
childC103.negPreset01.NB.disobedient := 0
childC103.negPreset01.NB.disrespectfulOfPeers := 0
childC103.negPreset01.NB.disrespectfulOfAdults := 0
childC103.negPreset01.NB.harmingOthers := 0
childC103.negPreset01.NB.hostility := 0
childC103.negPreset01.NB.inappropriateDress := 0
childC103.negPreset01.NB.inappropriateSexualBehavior := 0
childC103.negPreset01.NB.manipulative := 0
childC103.negPreset01.NB.other := 0
childC103.negPreset01.NB.physicalAgression := 0
childC103.negPreset01.NB.poorHygiene := 0
childC103.negPreset01.NB.pouting := 0
childC103.negPreset01.NB.refusalToCompleteChores := 0
childC103.negPreset01.NB.selfHarming := 0
childC103.negPreset01.NB.slammingDoors := 0
childC103.negPreset01.NB.schoolBehavior := 0
childC103.negPreset01.NB.tantrum := 0
childC103.negPreset01.NB.theft := 0
childC103.negPreset01.NB.tobaccoUse := 0
childC103.negPreset01.NB.unauthorizedAbsence := 0
childC103.negPreset01.NB.verbalAbuse := 0
childC103.negPreset01.NB.violationOfRules := 0

childC103.negPreset02.NB.DONB := "Alezander was disrespectful to staff on multiple occasions becoming argumentative at times. He often showed a defiant attitude toward small staff-made decisions, though was willing to be quickly corrected."
childC103.negPreset02.NB.arguing := 2
childC103.negPreset02.NB.boundaries := 2
childC103.negPreset02.NB.busIncident := 0
childC103.negPreset02.NB.complaining := 1
childC103.negPreset02.NB.crueltyToAnimals := 0
childC103.negPreset02.NB.cussing := 0
childC103.negPreset02.NB.deceitfulnessLying := 0
childC103.negPreset02.NB.defiance := 2
childC103.negPreset02.NB.demanding := 0
childC103.negPreset02.NB.demandsAttention := 0
childC103.negPreset02.NB.destructionOfProperty := 0
childC103.negPreset02.NB.disobedient := 0
childC103.negPreset02.NB.disrespectfulOfPeers := 0
childC103.negPreset02.NB.disrespectfulOfAdults := 2
childC103.negPreset02.NB.harmingOthers := 0
childC103.negPreset02.NB.hostility := 0
childC103.negPreset02.NB.inappropriateDress := 0
childC103.negPreset02.NB.inappropriateSexualBehavior := 0
childC103.negPreset02.NB.manipulative := 0
childC103.negPreset02.NB.other := 0
childC103.negPreset02.NB.physicalAgression := 0
childC103.negPreset02.NB.poorHygiene := 0
childC103.negPreset02.NB.pouting := 0
childC103.negPreset02.NB.refusalToCompleteChores := 0
childC103.negPreset02.NB.selfHarming := 0
childC103.negPreset02.NB.slammingDoors := 0
childC103.negPreset02.NB.schoolBehavior := 0
childC103.negPreset02.NB.tantrum := 0
childC103.negPreset02.NB.theft := 0
childC103.negPreset02.NB.tobaccoUse := 0
childC103.negPreset02.NB.unauthorizedAbsence := 0
childC103.negPreset02.NB.verbalAbuse := 0
childC103.negPreset02.NB.violationOfRules := 0

childC103.negPreset03.NB.DONB := "Alezander was disrespectful to peers on multiple occasions becoming argumentative at times."
childC103.negPreset03.NB.arguing := 3
childC103.negPreset03.NB.boundaries := 0
childC103.negPreset03.NB.busIncident := 0
childC103.negPreset03.NB.complaining := 3
childC103.negPreset03.NB.crueltyToAnimals := 0
childC103.negPreset03.NB.cussing := 0
childC103.negPreset03.NB.deceitfulnessLying := 0
childC103.negPreset03.NB.defiance := 0
childC103.negPreset03.NB.demanding := 0
childC103.negPreset03.NB.demandsAttention := 0
childC103.negPreset03.NB.destructionOfProperty := 0
childC103.negPreset03.NB.disobedient := 0
childC103.negPreset03.NB.disrespectfulOfPeers := 2
childC103.negPreset03.NB.disrespectfulOfAdults := 3
childC103.negPreset03.NB.harmingOthers := 0
childC103.negPreset03.NB.hostility := 0
childC103.negPreset03.NB.inappropriateDress := 0
childC103.negPreset03.NB.inappropriateSexualBehavior := 0
childC103.negPreset03.NB.manipulative := 0
childC103.negPreset03.NB.other := 0
childC103.negPreset03.NB.physicalAgression := 0
childC103.negPreset03.NB.poorHygiene := 0
childC103.negPreset03.NB.pouting := 0
childC103.negPreset03.NB.refusalToCompleteChores := 0
childC103.negPreset03.NB.selfHarming := 0
childC103.negPreset03.NB.slammingDoors := 0
childC103.negPreset03.NB.schoolBehavior := 0
childC103.negPreset03.NB.tantrum := 0
childC103.negPreset03.NB.theft := 0
childC103.negPreset03.NB.tobaccoUse := 0
childC103.negPreset03.NB.unauthorizedAbsence := 0
childC103.negPreset03.NB.verbalAbuse := 0
childC103.negPreset03.NB.violationOfRules := 0

childC104 := {name: ""}
childC105 := {name: ""}
childC106 := {name: ""}
childC107 := {name: ""}
childC108 := {name: ""}

childC201 := {"name": "Messi", "sex": "male", "laundryDay": "Tuesday, Saturday", "posPreset01": {"PB": {}}, "posPreset02": {"PB": {}}, "posPreset03": {"PB": {}}, "negPreset01": {"NB": {}}, "negPreset02": {"NB": {}}, "negPreset03": {"NB": {}}}

childC201.posPreset01.PB.DOPB := "Messi was sociable and generally respectful to adults."
childC201.posPreset01.PB.accountability := 0
childC201.posPreset01.PB.angerImpulseControl := 0
childC201.posPreset01.PB.busReport := 0
childC201.posPreset01.PB.cleanRoom := 0
childC201.posPreset01.PB.clothingCare := 0
childC201.posPreset01.PB.completedChore := 0
childC201.posPreset01.PB.completedHomework := 0
childC201.posPreset01.PB.goodHygiene := 0
childC201.posPreset01.PB.goodSocialSkills := 2
childC201.posPreset01.PB.grateful := 0
childC201.posPreset01.PB.helpful := 0
childC201.posPreset01.PB.politeGoodManners := 0
childC201.posPreset01.PB.positiveReferral := 0
childC201.posPreset01.PB.practiceTruthfulness := 0
childC201.posPreset01.PB.respectfulOfAdults := 2
childC201.posPreset01.PB.respectfulOfPeers := 0
childC201.posPreset01.PB.respectfulOfProperty := 0
childC201.posPreset01.PB.other := 0
childC201.posPreset01.PB.posMod01 := 1
childC201.posPreset01.PB.posMod02 := 1
childC201.posPreset01.PB.posMod03 := 0
childC201.posPreset01.PB.posMod04 := 0
childC201.posPreset01.PB.posMod05 := 0
childC201.posPreset01.PB.posMod06 := 0

childC201.posPreset02.PB.DOPB := "Messi mostly kept to himself and to his video games today. He did not engage in much conversation with peers, but was generally respectful to staff."
childC201.posPreset02.PB.accountability := 0
childC201.posPreset02.PB.angerImpulseControl := 0
childC201.posPreset02.PB.busReport := 0
childC201.posPreset02.PB.cleanRoom := 0
childC201.posPreset02.PB.clothingCare := 0
childC201.posPreset02.PB.completedChore := 0
childC201.posPreset02.PB.completedHomework := 0
childC201.posPreset02.PB.goodHygiene := 0
childC201.posPreset02.PB.goodSocialSkills := 0
childC201.posPreset02.PB.grateful := 0
childC201.posPreset02.PB.helpful := 0
childC201.posPreset02.PB.politeGoodManners := 0
childC201.posPreset02.PB.positiveReferral := 0
childC201.posPreset02.PB.practiceTruthfulness := 0
childC201.posPreset02.PB.respectfulOfAdults := 0
childC201.posPreset02.PB.respectfulOfPeers := 0
childC201.posPreset02.PB.respectfulOfProperty := 0
childC201.posPreset02.PB.other := 0
childC201.posPreset02.PB.posMod01 := 1
childC201.posPreset02.PB.posMod02 := 1
childC201.posPreset02.PB.posMod03 := 0
childC201.posPreset02.PB.posMod04 := 1
childC201.posPreset02.PB.posMod05 := 0
childC201.posPreset02.PB.posMod06 := 0

childC201.posPreset03.PB.DOPB := ""
childC201.posPreset03.PB.accountability := 0
childC201.posPreset03.PB.angerImpulseControl := 0
childC201.posPreset03.PB.busReport := 0
childC201.posPreset03.PB.cleanRoom := 0
childC201.posPreset03.PB.clothingCare := 0
childC201.posPreset03.PB.completedChore := 0
childC201.posPreset03.PB.completedHomework := 0
childC201.posPreset03.PB.goodHygiene := 0
childC201.posPreset03.PB.goodSocialSkills := 0
childC201.posPreset03.PB.grateful := 0
childC201.posPreset03.PB.helpful := 0
childC201.posPreset03.PB.politeGoodManners := 0
childC201.posPreset03.PB.positiveReferral := 0
childC201.posPreset03.PB.practiceTruthfulness := 0
childC201.posPreset03.PB.respectfulOfAdults := 0
childC201.posPreset03.PB.respectfulOfPeers := 0
childC201.posPreset03.PB.respectfulOfProperty := 0
childC201.posPreset03.PB.other := 0
childC201.posPreset03.PB.posMod01 := 1
childC201.posPreset03.PB.posMod02 := 1
childC201.posPreset03.PB.posMod03 := 0
childC201.posPreset03.PB.posMod04 := 0
childC201.posPreset03.PB.posMod05 := 0
childC201.posPreset03.PB.posMod06 := 0

childC201.negPreset01.NB.DONB := "Messi had a good day today."
childC201.negPreset01.NB.arguing := 0
childC201.negPreset01.NB.boundaries := 0
childC201.negPreset01.NB.busIncident := 0
childC201.negPreset01.NB.complaining := 0
childC201.negPreset01.NB.crueltyToAnimals := 0
childC201.negPreset01.NB.cussing := 0
childC201.negPreset01.NB.deceitfulnessLying := 0
childC201.negPreset01.NB.defiance := 0
childC201.negPreset01.NB.demanding := 0
childC201.negPreset01.NB.demandsAttention := 0
childC201.negPreset01.NB.destructionOfProperty := 0
childC201.negPreset01.NB.disobedient := 0
childC201.negPreset01.NB.disrespectfulOfPeers := 0
childC201.negPreset01.NB.disrespectfulOfAdults := 0
childC201.negPreset01.NB.harmingOthers := 0
childC201.negPreset01.NB.hostility := 0
childC201.negPreset01.NB.inappropriateDress := 0
childC201.negPreset01.NB.inappropriateSexualBehavior := 0
childC201.negPreset01.NB.manipulative := 0
childC201.negPreset01.NB.other := 0
childC201.negPreset01.NB.physicalAgression := 0
childC201.negPreset01.NB.poorHygiene := 0
childC201.negPreset01.NB.pouting := 0
childC201.negPreset01.NB.refusalToCompleteChores := 0
childC201.negPreset01.NB.selfHarming := 0
childC201.negPreset01.NB.slammingDoors := 0
childC201.negPreset01.NB.schoolBehavior := 0
childC201.negPreset01.NB.tantrum := 0
childC201.negPreset01.NB.theft := 0
childC201.negPreset01.NB.tobaccoUse := 0
childC201.negPreset01.NB.unauthorizedAbsence := 0
childC201.negPreset01.NB.verbalAbuse := 0
childC201.negPreset01.NB.violationOfRules := 0

childC201.negPreset02.NB.DONB := "Messi complained about cottage rules and was disrespectful to his younger peers."
childC201.negPreset02.NB.arguing := 0
childC201.negPreset02.NB.boundaries := 0
childC201.negPreset02.NB.busIncident := 0
childC201.negPreset02.NB.complaining := 2
childC201.negPreset02.NB.crueltyToAnimals := 0
childC201.negPreset02.NB.cussing := 0
childC201.negPreset02.NB.deceitfulnessLying := 0
childC201.negPreset02.NB.defiance := 0
childC201.negPreset02.NB.demanding := 0
childC201.negPreset02.NB.demandsAttention := 0
childC201.negPreset02.NB.destructionOfProperty := 0
childC201.negPreset02.NB.disobedient := 0
childC201.negPreset02.NB.disrespectfulOfPeers := 2
childC201.negPreset02.NB.disrespectfulOfAdults := 0
childC201.negPreset02.NB.harmingOthers := 0
childC201.negPreset02.NB.hostility := 0
childC201.negPreset02.NB.inappropriateDress := 0
childC201.negPreset02.NB.inappropriateSexualBehavior := 0
childC201.negPreset02.NB.manipulative := 0
childC201.negPreset02.NB.other := 0
childC201.negPreset02.NB.physicalAgression := 0
childC201.negPreset02.NB.poorHygiene := 0
childC201.negPreset02.NB.pouting := 0
childC201.negPreset02.NB.refusalToCompleteChores := 0
childC201.negPreset02.NB.selfHarming := 0
childC201.negPreset02.NB.slammingDoors := 0
childC201.negPreset02.NB.schoolBehavior := 0
childC201.negPreset02.NB.tantrum := 0
childC201.negPreset02.NB.theft := 0
childC201.negPreset02.NB.tobaccoUse := 0
childC201.negPreset02.NB.unauthorizedAbsence := 0
childC201.negPreset02.NB.verbalAbuse := 0
childC201.negPreset02.NB.violationOfRules := 0

childC201.negPreset03.NB.DONB := "Messi kept to himself and was consumed with electronics for his allotted electronics time."
childC201.negPreset03.NB.arguing := 0
childC201.negPreset03.NB.boundaries := 0
childC201.negPreset03.NB.busIncident := 0
childC201.negPreset03.NB.complaining := 0
childC201.negPreset03.NB.crueltyToAnimals := 0
childC201.negPreset03.NB.cussing := 0
childC201.negPreset03.NB.deceitfulnessLying := 0
childC201.negPreset03.NB.defiance := 0
childC201.negPreset03.NB.demanding := 0
childC201.negPreset03.NB.demandsAttention := 0
childC201.negPreset03.NB.destructionOfProperty := 0
childC201.negPreset03.NB.disobedient := 0
childC201.negPreset03.NB.disrespectfulOfPeers := 0
childC201.negPreset03.NB.disrespectfulOfAdults := 0
childC201.negPreset03.NB.harmingOthers := 0
childC201.negPreset03.NB.hostility := 0
childC201.negPreset03.NB.inappropriateDress := 0
childC201.negPreset03.NB.inappropriateSexualBehavior := 0
childC201.negPreset03.NB.manipulative := 0
childC201.negPreset03.NB.other := 0
childC201.negPreset03.NB.physicalAgression := 0
childC201.negPreset03.NB.poorHygiene := 0
childC201.negPreset03.NB.pouting := 0
childC201.negPreset03.NB.refusalToCompleteChores := 0
childC201.negPreset03.NB.selfHarming := 0
childC201.negPreset03.NB.slammingDoors := 0
childC201.negPreset03.NB.schoolBehavior := 0
childC201.negPreset03.NB.tantrum := 0
childC201.negPreset03.NB.theft := 0
childC201.negPreset03.NB.tobaccoUse := 0
childC201.negPreset03.NB.unauthorizedAbsence := 0
childC201.negPreset03.NB.verbalAbuse := 0
childC201.negPreset03.NB.violationOfRules := 0

childC202 := {"name": "Jayce", "sex": "male", "laundryDay": "Monday, Friday", "posPreset01": {"PB": {}}, "posPreset02": {"PB": {}}, "posPreset03": {"PB": {}}, "negPreset01": {"NB": {}}, "negPreset02": {"NB": {}}, "negPreset03": {"NB": {}}}

childC202.posPreset01.PB.DOPB := "Jayce was sociable and generally respectful to peers and adults."
childC202.posPreset01.PB.accountability := 0
childC202.posPreset01.PB.angerImpulseControl := 0
childC202.posPreset01.PB.busReport := 0
childC202.posPreset01.PB.cleanRoom := 0
childC202.posPreset01.PB.clothingCare := 0
childC202.posPreset01.PB.completedChore := 0
childC202.posPreset01.PB.completedHomework:= 0
childC202.posPreset01.PB.goodHygiene := 0
childC202.posPreset01.PB.goodSocialSkills := 2
childC202.posPreset01.PB.grateful := 0
childC202.posPreset01.PB.helpful := 0
childC202.posPreset01.PB.politeGoodManners := 0
childC202.posPreset01.PB.positiveReferral := 0
childC202.posPreset01.PB.practiceTruthfulness := 0
childC202.posPreset01.PB.respectfulOfAdults := 2
childC202.posPreset01.PB.respectfulOfPeers := 2
childC202.posPreset01.PB.respectfulOfProperty := 0
childC202.posPreset01.PB.other := 0
childC202.posPreset01.PB.posMod01 := 1
childC202.posPreset01.PB.posMod02 := 1
childC202.posPreset01.PB.posMod03 := 0
childC202.posPreset01.PB.posMod04 := 0
childC202.posPreset01.PB.posMod05 := 0
childC202.posPreset01.PB.posMod06 := 0

childC202.posPreset02.PB.DOPB := "Jayce was sociable and generally respectful to adults."
childC202.posPreset02.PB.PB.accountability := 0
childC202.posPreset02.PB.angerImpulseControl := 0
childC202.posPreset02.PB.busReport := 0
childC202.posPreset02.PB.cleanRoom := 0
childC202.posPreset02.PB.clothingCare := 0
childC202.posPreset02.PB.completedChore := 0
childC202.posPreset02.PB.completedHomework := 0
childC202.posPreset02.PB.goodHygiene := 0
childC202.posPreset02.PB.goodSocialSkills := 0
childC202.posPreset02.PB.grateful := 0
childC202.posPreset02.PB.helpful := 0
childC202.posPreset02.PB.politeGoodManners := 0
childC202.posPreset02.PB.positiveReferral := 0
childC202.posPreset02.PB.practiceTruthfulness := 0
childC202.posPreset02.PB.respectfulOfAdults := 0
childC202.posPreset02.PB.respectfulOfPeers := 0
childC202.posPreset02.PB.respectfulOfProperty := 0
childC202.posPreset02.PB.other := 0
childC202.posPreset02.PB.posMod01 := 1
childC202.posPreset02.PB.posMod02 := 1
childC202.posPreset02.PB.posMod03 := 0
childC202.posPreset02.PB.posMod04 := 0
childC202.posPreset02.PB.posMod05 := 0
childC202.posPreset02.PB.posMod06 := 0

childC202.posPreset03.PB.DOPB := ""
childC202.posPreset03.PB.accountability := 0
childC202.posPreset03.PB.angerImpulseControl := 0
childC202.posPreset03.PB.busReport := 0
childC202.posPreset03.PB.cleanRoom := 0
childC202.posPreset03.PB.clothingCare := 0
childC202.posPreset03.PB.completedChore := 0
childC202.posPreset03.PB.completedHomework := 0
childC202.posPreset03.PB.goodHygiene := 0
childC202.posPreset03.PB.goodSocialSkills := 0
childC202.posPreset03.PB.grateful := 0
childC202.posPreset03.PB.helpful := 0
childC202.posPreset03.PB.politeGoodManners := 0
childC202.posPreset03.PB.positiveReferral := 0
childC202.posPreset03.PB.practiceTruthfulness := 0
childC202.posPreset03.PB.respectfulOfAdults := 0
childC202.posPreset03.PB.respectfulOfPeers := 0
childC202.posPreset03.PB.respectfulOfProperty := 0
childC202.posPreset03.PB.other := 0
childC202.posPreset03.PB.posMod01 := 1
childC202.posPreset03.PB.posMod02 := 1
childC202.posPreset03.PB.posMod03 := 0
childC202.posPreset03.PB.posMod04 := 0
childC202.posPreset03.PB.posMod05 := 0
childC202.posPreset03.PB.posMod06 := 0

childC202.negPreset01.NB.DONB := "Jayce had a good day today."
childC202.negPreset01.NB.arguing := 0
childC202.negPreset01.NB.boundaries := 0
childC202.negPreset01.NB.busIncident := 0
childC202.negPreset01.NB.complaining := 0
childC202.negPreset01.NB.crueltyToAnimals := 0
childC202.negPreset01.NB.cussing := 0
childC202.negPreset01.NB.deceitfulnessLying := 0
childC202.negPreset01.NB.defiance := 0
childC202.negPreset01.NB.demanding := 0
childC202.negPreset01.NB.demandsAttention := 0
childC202.negPreset01.NB.destructionOfProperty := 0
childC202.negPreset01.NB.disobedient := 0
childC202.negPreset01.NB.disrespectfulOfPeers := 0
childC202.negPreset01.NB.disrespectfulOfAdults := 0
childC202.negPreset01.NB.harmingOthers := 0
childC202.negPreset01.NB.hostility := 0
childC202.negPreset01.NB.inappropriateDress := 0
childC202.negPreset01.NB.inappropriateSexualBehavior := 0
childC202.negPreset01.NB.manipulative := 0
childC202.negPreset01.NB.other := 0
childC202.negPreset01.NB.physicalAgression := 0
childC202.negPreset01.NB.poorHygiene := 0
childC202.negPreset01.NB.pouting := 0
childC202.negPreset01.NB.refusalToCompleteChores := 0
childC202.negPreset01.NB.selfHarming := 0
childC202.negPreset01.NB.slammingDoors := 0
childC202.negPreset01.NB.schoolBehavior := 0
childC202.negPreset01.NB.tantrum := 0
childC202.negPreset01.NB.theft := 0
childC202.negPreset01.NB.tobaccoUse := 0
childC202.negPreset01.NB.unauthorizedAbsence := 0
childC202.negPreset01.NB.verbalAbuse := 0
childC202.negPreset01.NB.violationOfRules := 0

childC202.negPreset02.NB.DONB := "Jayce had a good day today. He squirmed very much when asked to do his homework, but still completed it."
childC202.negPreset02.NB.arguing := 0
childC202.negPreset02.NB.boundaries := 0
childC202.negPreset02.NB.busIncident := 0
childC202.negPreset02.NB.complaining := 1
childC202.negPreset02.NB.crueltyToAnimals := 0
childC202.negPreset02.NB.cussing := 0
childC202.negPreset02.NB.deceitfulnessLying := 0
childC202.negPreset02.NB.defiance := 1
childC202.negPreset02.NB.demanding := 0
childC202.negPreset02.NB.demandsAttention := 0
childC202.negPreset02.NB.destructionOfProperty := 0
childC202.negPreset02.NB.disobedient := 0
childC202.negPreset02.NB.disrespectfulOfPeers := 0
childC202.negPreset02.NB.disrespectfulOfAdults := 0
childC202.negPreset02.NB.harmingOthers := 0
childC202.negPreset02.NB.hostility := 0
childC202.negPreset02.NB.inappropriateDress := 0
childC202.negPreset02.NB.inappropriateSexualBehavior := 0
childC202.negPreset02.NB.manipulative := 0
childC202.negPreset02.NB.other := 0
childC202.negPreset02.NB.physicalAgression := 0
childC202.negPreset02.NB.poorHygiene := 0
childC202.negPreset02.NB.pouting := 0
childC202.negPreset02.NB.refusalToCompleteChores := 0
childC202.negPreset02.NB.selfHarming := 0
childC202.negPreset02.NB.slammingDoors := 0
childC202.negPreset02.NB.schoolBehavior := 0
childC202.negPreset02.NB.tantrum := 0
childC202.negPreset02.NB.theft := 0
childC202.negPreset02.NB.tobaccoUse := 0
childC202.negPreset02.NB.unauthorizedAbsence := 0
childC202.negPreset02.NB.verbalAbuse := 0
childC202.negPreset02.NB.violationOfRules := 0

childC202.negPreset03.NB.DONB := "Jayce whined about his perceptions of unfairness, which resulted in an outburst of crying with a bitter attitude."
childC202.negPreset03.NB.arguing := 1
childC202.negPreset03.NB.boundaries := 0
childC202.negPreset03.NB.busIncident := 0
childC202.negPreset03.NB.complaining := 3
childC202.negPreset03.NB.crueltyToAnimals := 0
childC202.negPreset03.NB.cussing := 0
childC202.negPreset03.NB.deceitfulnessLying := 0
childC202.negPreset03.NB.defiance := 0
childC202.negPreset03.NB.demanding := 0
childC202.negPreset03.NB.demandsAttention := 0
childC202.negPreset03.NB.destructionOfProperty := 0
childC202.negPreset03.NB.disobedient := 0
childC202.negPreset03.NB.disrespectfulOfPeers := 2
childC202.negPreset03.NB.disrespectfulOfAdults := 0
childC202.negPreset03.NB.harmingOthers := 0
childC202.negPreset03.NB.hostility := 0
childC202.negPreset03.NB.inappropriateDress := 0
childC202.negPreset03.NB.inappropriateSexualBehavior := 0
childC202.negPreset03.NB.manipulative := 0
childC202.negPreset03.NB.other := 0
childC202.negPreset03.NB.physicalAgression := 0
childC202.negPreset03.NB.poorHygiene := 0
childC202.negPreset03.NB.pouting := 2
childC202.negPreset03.NB.refusalToCompleteChores := 0
childC202.negPreset03.NB.selfHarming := 0
childC202.negPreset03.NB.slammingDoors := 0
childC202.negPreset03.NB.schoolBehavior := 0
childC202.negPreset03.NB.tantrum := 0
childC202.negPreset03.NB.theft := 0
childC202.negPreset03.NB.tobaccoUse := 0
childC202.negPreset03.NB.unauthorizedAbsence := 0
childC202.negPreset03.NB.verbalAbuse := 0
childC202.negPreset03.NB.violationOfRules := 0

childC203 := {"name": "Christian", "sex": "male", "laundryDay": "Tuesday, Saturday", "posPreset01": {"PB": {}}, "posPreset02": {"PB": {}}, "posPreset03": {"PB": {}}, "negPreset01": {"NB": {}}, "negPreset02": {"NB": {}}, "negPreset03": {"NB": {}}}

childC203.posPreset01.PB.DOPB := "Christian was sociable, helpful, and generally respectful to staff and peers. He shows great accountability and character by doing the right thing without being told."
childC203.posPreset01.PB.accountability := 2
childC203.posPreset01.PB.angerImpulseControl := 1
childC203.posPreset01.PB.busReport := 0
childC203.posPreset01.PB.cleanRoom := 0
childC203.posPreset01.PB.clothingCare := 0
childC203.posPreset01.PB.completedChore := 0
childC203.posPreset01.PB.completedHomework := 0
childC203.posPreset01.PB.goodHygiene := 0
childC203.posPreset01.PB.goodSocialSkills := 2
childC203.posPreset01.PB.grateful := 0
childC203.posPreset01.PB.helpful := 1
childC203.posPreset01.PB.politeGoodManners := 2
childC203.posPreset01.PB.positiveReferral := 0
childC203.posPreset01.PB.practiceTruthfulness := 0
childC203.posPreset01.PB.respectfulOfAdults := 2
childC203.posPreset01.PB.respectfulOfPeers := 5
childC203.posPreset01.PB.respectfulOfProperty := 0
childC203.posPreset01.PB.other := 0
childC203.posPreset01.PB.posMod01 := 1
childC203.posPreset01.PB.posMod02 := 1
childC203.posPreset01.PB.posMod03 := 0
childC203.posPreset01.PB.posMod04 := 0
childC203.posPreset01.PB.posMod05 := 0
childC203.posPreset01.PB.posMod06 := 0

childC203.posPreset02.PB.DOPB := ""
childC203.posPreset02.PB.accountability := 0
childC203.posPreset02.PB.angerImpulseControl := 0
childC203.posPreset02.PB.busReport := 0
childC203.posPreset02.PB.cleanRoom := 0
childC203.posPreset02.PB.clothingCare := 0
childC203.posPreset02.PB.completedChore := 0
childC203.posPreset02.PB.completedHomework := 0
childC203.posPreset02.PB.goodHygiene := 0
childC203.posPreset02.PB.goodSocialSkills := 0
childC203.posPreset02.PB.grateful := 0
childC203.posPreset02.PB.helpful := 0
childC203.posPreset02.PB.politeGoodManners := 0
childC203.posPreset02.PB.positiveReferral := 0
childC203.posPreset02.PB.practiceTruthfulness := 0
childC203.posPreset02.PB.respectfulOfAdults := 0
childC203.posPreset02.PB.respectfulOfPeers := 0
childC203.posPreset02.PB.respectfulOfProperty := 0
childC203.posPreset02.PB.other := 0
childC203.posPreset02.PB.posMod02 := 1
childC203.posPreset02.PB.posMod02 := 1
childC203.posPreset02.PB.posMod03 := 0
childC203.posPreset02.PB.posMod04 := 0
childC203.posPreset02.PB.posMod05 := 0
childC203.posPreset02.PB.posMod06 := 0

childC203.posPreset03.PB.DOPB := ""
childC203.posPreset03.PB.accountability := 0
childC203.posPreset03.PB.angerImpulseControl := 0
childC203.posPreset03.PB.busReport := 0
childC203.posPreset03.PB.cleanRoom := 0
childC203.posPreset03.PB.clothingCare := 0
childC203.posPreset03.PB.completedChore := 0
childC203.posPreset03.PB.completedHomework := 0
childC203.posPreset03.PB.goodHygiene := 0
childC203.posPreset03.PB.goodSocialSkills := 0
childC203.posPreset03.PB.grateful := 0
childC203.posPreset03.PB.helpful := 0
childC203.posPreset03.PB.politeGoodManners := 0
childC203.posPreset03.PB.positiveReferral := 0
childC203.posPreset03.PB.practiceTruthfulness := 0
childC203.posPreset03.PB.respectfulOfAdults := 0
childC203.posPreset03.PB.respectfulOfPeers := 0
childC203.posPreset03.PB.respectfulOfProperty := 0
childC203.posPreset03.PB.other := 0
childC203.posPreset03.PB.posMod03 := 1
childC203.posPreset03.PB.posMod02 := 1
childC203.posPreset03.PB.posMod03 := 0
childC203.posPreset03.PB.posMod04 := 0
childC203.posPreset03.PB.posMod05 := 0
childC203.posPreset03.PB.posMod06 := 0

childC203.negPreset01.NB.DONB := "Christian had a good day today."
childC203.negPreset01.NB.arguing := 0
childC203.negPreset01.NB.boundaries := 0
childC203.negPreset01.NB.busIncident := 0
childC203.negPreset01.NB.complaining := 0
childC203.negPreset01.NB.crueltyToAnimals := 0
childC203.negPreset01.NB.cussing := 0
childC203.negPreset01.NB.deceitfulnessLying := 0
childC203.negPreset01.NB.defiance := 0
childC203.negPreset01.NB.demanding := 0
childC203.negPreset01.NB.demandsAttention := 0
childC203.negPreset01.NB.destructionOfProperty := 0
childC203.negPreset01.NB.disobedient := 0
childC203.negPreset01.NB.disrespectfulOfPeers := 0
childC203.negPreset01.NB.disrespectfulOfAdults := 0
childC203.negPreset01.NB.harmingOthers := 0
childC203.negPreset01.NB.hostility := 0
childC203.negPreset01.NB.inappropriateDress := 0
childC203.negPreset01.NB.inappropriateSexualBehavior := 0
childC203.negPreset01.NB.manipulative := 0
childC203.negPreset01.NB.other := 0
childC203.negPreset01.NB.physicalAgression := 0
childC203.negPreset01.NB.poorHygiene := 0
childC203.negPreset01.NB.pouting := 0
childC203.negPreset01.NB.refusalToCompleteChores := 0
childC203.negPreset01.NB.selfHarming := 0
childC203.negPreset01.NB.slammingDoors := 0
childC203.negPreset01.NB.schoolBehavior := 0
childC203.negPreset01.NB.tantrum := 0
childC203.negPreset01.NB.theft := 0
childC203.negPreset01.NB.tobaccoUse := 0
childC203.negPreset01.NB.unauthorizedAbsence := 0
childC203.negPreset01.NB.verbalAbuse := 0
childC203.negPreset01.NB.violationOfRules := 0

childC203.negPreset02.NB.DONB := ""
childC203.negPreset02.NB.arguing := 0
childC203.negPreset02.NB.boundaries := 0
childC203.negPreset02.NB.busIncident := 0
childC203.negPreset02.NB.complaining := 0
childC203.negPreset02.NB.crueltyToAnimals := 0
childC203.negPreset02.NB.cussing := 0
childC203.negPreset02.NB.deceitfulnessLying := 0
childC203.negPreset02.NB.defiance := 0
childC203.negPreset02.NB.demanding := 0
childC203.negPreset02.NB.demandsAttention := 0
childC203.negPreset02.NB.destructionOfProperty := 0
childC203.negPreset02.NB.disobedient := 0
childC203.negPreset02.NB.disrespectfulOfPeers := 0
childC203.negPreset02.NB.disrespectfulOfAdults := 0
childC203.negPreset02.NB.harmingOthers := 0
childC203.negPreset02.NB.hostility := 0
childC203.negPreset02.NB.inappropriateDress := 0
childC203.negPreset02.NB.inappropriateSexualBehavior := 0
childC203.negPreset02.NB.manipulative := 0
childC203.negPreset02.NB.other := 0
childC203.negPreset02.NB.physicalAgression := 0
childC203.negPreset02.NB.poorHygiene := 0
childC203.negPreset02.NB.pouting := 0
childC203.negPreset02.NB.refusalToCompleteChores := 0
childC203.negPreset02.NB.selfHarming := 0
childC203.negPreset02.NB.slammingDoors := 0
childC203.negPreset02.NB.schoolBehavior := 0
childC203.negPreset02.NB.tantrum := 0
childC203.negPreset02.NB.theft := 0
childC203.negPreset02.NB.tobaccoUse := 0
childC203.negPreset02.NB.unauthorizedAbsence := 0
childC203.negPreset02.NB.verbalAbuse := 0
childC203.negPreset02.NB.violationOfRules := 0

childC203.negPreset03.NB.DONB := ""
childC203.negPreset03.NB.arguing := 0
childC203.negPreset03.NB.boundaries := 0
childC203.negPreset03.NB.busIncident := 0
childC203.negPreset03.NB.complaining := 0
childC203.negPreset03.NB.crueltyToAnimals := 0
childC203.negPreset03.NB.cussing := 0
childC203.negPreset03.NB.deceitfulnessLying := 0
childC203.negPreset03.NB.defiance := 0
childC203.negPreset03.NB.demanding := 0
childC203.negPreset03.NB.demandsAttention := 0
childC203.negPreset03.NB.destructionOfProperty := 0
childC203.negPreset03.NB.disobedient := 0
childC203.negPreset03.NB.disrespectfulOfPeers := 0
childC203.negPreset03.NB.disrespectfulOfAdults := 0
childC203.negPreset03.NB.harmingOthers := 0
childC203.negPreset03.NB.hostility := 0
childC203.negPreset03.NB.inappropriateDress := 0
childC203.negPreset03.NB.inappropriateSexualBehavior := 0
childC203.negPreset03.NB.manipulative := 0
childC203.negPreset03.NB.other := 0
childC203.negPreset03.NB.physicalAgression := 0
childC203.negPreset03.NB.poorHygiene := 0
childC203.negPreset03.NB.pouting := 0
childC203.negPreset03.NB.refusalToCompleteChores := 0
childC203.negPreset03.NB.selfHarming := 0
childC203.negPreset03.NB.slammingDoors := 0
childC203.negPreset03.NB.schoolBehavior := 0
childC203.negPreset03.NB.tantrum := 0
childC203.negPreset03.NB.theft := 0
childC203.negPreset03.NB.tobaccoUse := 0
childC203.negPreset03.NB.unauthorizedAbsence := 0
childC203.negPreset03.NB.verbalAbuse := 0
childC203.negPreset03.NB.violationOfRules := 0

childC204 := {"name": "Xavi", "sex": "male", "laundryDay": "Unknown", "posPreset01": {"PB": {}}, "posPreset02": {"PB": {}}, "posPreset03": {"PB": {}}, "negPreset01": {"NB": {}}, "negPreset02": {"NB": {}}, "negPreset03": {"NB": {}}}

childC204.posPreset01.PB.DOPB := childC204.name . " was sociable and generally respectful to peers and staff."
childC204.posPreset01.PB.accountability := 0
childC204.posPreset01.PB.angerImpulseControl := 0
childC204.posPreset01.PB.busReport := 0
childC204.posPreset01.PB.cleanRoom := 0
childC204.posPreset01.PB.clothingCare := 0
childC204.posPreset01.PB.completedChore := 0
childC204.posPreset01.PB.completedHomework := 0
childC204.posPreset01.PB.goodHygiene := 0
childC204.posPreset01.PB.goodSocialSkills := 5
childC204.posPreset01.PB.grateful := 0
childC204.posPreset01.PB.helpful := 0
childC204.posPreset01.PB.politeGoodManners := 0
childC204.posPreset01.PB.positiveReferral := 0
childC204.posPreset01.PB.practiceTruthfulness := 0
childC204.posPreset01.PB.respectfulOfAdults := 2
childC204.posPreset01.PB.respectfulOfPeers := 5
childC204.posPreset01.PB.respectfulOfProperty := 0
childC204.posPreset01.PB.other := 0
childC204.posPreset01.PB.posMod01 := 1
childC204.posPreset01.PB.posMod02 := 1
childC204.posPreset01.PB.posMod03 := 0
childC204.posPreset01.PB.posMod04 := 0
childC204.posPreset01.PB.posMod05 := 0
childC204.posPreset01.PB.posMod06 := 0

childC204.posPreset02.PB.DOPB := ""
childC204.posPreset02.PB.accountability := 0
childC204.posPreset02.PB.angerImpulseControl := 0
childC204.posPreset02.PB.busReport := 0
childC204.posPreset02.PB.cleanRoom := 0
childC204.posPreset02.PB.clothingCare := 0
childC204.posPreset02.PB.completedChore := 0
childC204.posPreset02.PB.completedHomework := 0
childC204.posPreset02.PB.goodHygiene := 0
childC204.posPreset02.PB.goodSocialSkills := 0
childC204.posPreset02.PB.grateful := 0
childC204.posPreset02.PB.helpful := 0
childC204.posPreset02.PB.politeGoodManners := 0
childC204.posPreset02.PB.positiveReferral := 0
childC204.posPreset02.PB.practiceTruthfulness := 0
childC204.posPreset02.PB.respectfulOfAdults := 0
childC204.posPreset02.PB.respectfulOfPeers := 0
childC204.posPreset02.PB.respectfulOfProperty := 0
childC204.posPreset02.PB.other := 0
childC204.posPreset02.PB.posMod02 := 1
childC204.posPreset02.PB.posMod02 := 1
childC204.posPreset02.PB.posMod03 := 0
childC204.posPreset02.PB.posMod04 := 0
childC204.posPreset02.PB.posMod05 := 0
childC204.posPreset02.PB.posMod06 := 0

childC204.posPreset03.PB.DOPB := ""
childC204.posPreset03.PB.accountability := 0
childC204.posPreset03.PB.angerImpulseControl := 0
childC204.posPreset03.PB.busReport := 0
childC204.posPreset03.PB.cleanRoom := 0
childC204.posPreset03.PB.clothingCare := 0
childC204.posPreset03.PB.completedChore := 0
childC204.posPreset03.PB.completedHomework := 0
childC204.posPreset03.PB.goodHygiene := 0
childC204.posPreset03.PB.goodSocialSkills := 0
childC204.posPreset03.PB.grateful := 0
childC204.posPreset03.PB.helpful := 0
childC204.posPreset03.PB.politeGoodManners := 0
childC204.posPreset03.PB.positiveReferral := 0
childC204.posPreset03.PB.practiceTruthfulness := 0
childC204.posPreset03.PB.respectfulOfAdults := 0
childC204.posPreset03.PB.respectfulOfPeers := 0
childC204.posPreset03.PB.respectfulOfProperty := 0
childC204.posPreset03.PB.other := 0
childC204.posPreset03.PB.posMod03 := 1
childC204.posPreset03.PB.posMod02 := 1
childC204.posPreset03.PB.posMod03 := 0
childC204.posPreset03.PB.posMod04 := 0
childC204.posPreset03.PB.posMod05 := 0
childC204.posPreset03.PB.posMod06 := 0

childC204.negPreset01.NB.DONB := childC204.name . " had a good day today."
childC204.negPreset01.NB.arguing := 0
childC204.negPreset01.NB.boundaries := 0
childC204.negPreset01.NB.busIncident := 0
childC204.negPreset01.NB.complaining := 0
childC204.negPreset01.NB.crueltyToAnimals := 0
childC204.negPreset01.NB.cussing := 0
childC204.negPreset01.NB.deceitfulnessLying := 0
childC204.negPreset01.NB.defiance := 0
childC204.negPreset01.NB.demanding := 0
childC204.negPreset01.NB.demandsAttention := 0
childC204.negPreset01.NB.destructionOfProperty := 0
childC204.negPreset01.NB.disobedient := 0
childC204.negPreset01.NB.disrespectfulOfPeers := 0
childC204.negPreset01.NB.disrespectfulOfAdults := 0
childC204.negPreset01.NB.harmingOthers := 0
childC204.negPreset01.NB.hostility := 0
childC204.negPreset01.NB.inappropriateDress := 0
childC204.negPreset01.NB.inappropriateSexualBehavior := 0
childC204.negPreset01.NB.manipulative := 0
childC204.negPreset01.NB.other := 0
childC204.negPreset01.NB.physicalAgression := 0
childC204.negPreset01.NB.poorHygiene := 0
childC204.negPreset01.NB.pouting := 0
childC204.negPreset01.NB.refusalToCompleteChores := 0
childC204.negPreset01.NB.selfHarming := 0
childC204.negPreset01.NB.slammingDoors := 0
childC204.negPreset01.NB.schoolBehavior := 0
childC204.negPreset01.NB.tantrum := 0
childC204.negPreset01.NB.theft := 0
childC204.negPreset01.NB.tobaccoUse := 0
childC204.negPreset01.NB.unauthorizedAbsence := 0
childC204.negPreset01.NB.verbalAbuse := 0
childC204.negPreset01.NB.violationOfRules := 0

childC204.negPreset02.NB.DONB := ""
childC204.negPreset02.NB.arguing := 0
childC204.negPreset02.NB.boundaries := 0
childC204.negPreset02.NB.busIncident := 0
childC204.negPreset02.NB.complaining := 0
childC204.negPreset02.NB.crueltyToAnimals := 0
childC204.negPreset02.NB.cussing := 0
childC204.negPreset02.NB.deceitfulnessLying := 0
childC204.negPreset02.NB.defiance := 0
childC204.negPreset02.NB.demanding := 0
childC204.negPreset02.NB.demandsAttention := 0
childC204.negPreset02.NB.destructionOfProperty := 0
childC204.negPreset02.NB.disobedient := 0
childC204.negPreset02.NB.disrespectfulOfPeers := 0
childC204.negPreset02.NB.disrespectfulOfAdults := 0
childC204.negPreset02.NB.harmingOthers := 0
childC204.negPreset02.NB.hostility := 0
childC204.negPreset02.NB.inappropriateDress := 0
childC204.negPreset02.NB.inappropriateSexualBehavior := 0
childC204.negPreset02.NB.manipulative := 0
childC204.negPreset02.NB.other := 0
childC204.negPreset02.NB.physicalAgression := 0
childC204.negPreset02.NB.poorHygiene := 0
childC204.negPreset02.NB.pouting := 0
childC204.negPreset02.NB.refusalToCompleteChores := 0
childC204.negPreset02.NB.selfHarming := 0
childC204.negPreset02.NB.slammingDoors := 0
childC204.negPreset02.NB.schoolBehavior := 0
childC204.negPreset02.NB.tantrum := 0
childC204.negPreset02.NB.theft := 0
childC204.negPreset02.NB.tobaccoUse := 0
childC204.negPreset02.NB.unauthorizedAbsence := 0
childC204.negPreset02.NB.verbalAbuse := 0
childC204.negPreset02.NB.violationOfRules := 0

childC204.negPreset03.NB.DONB := ""
childC204.negPreset03.NB.arguing := 0
childC204.negPreset03.NB.boundaries := 0
childC204.negPreset03.NB.busIncident := 0
childC204.negPreset03.NB.complaining := 0
childC204.negPreset03.NB.crueltyToAnimals := 0
childC204.negPreset03.NB.cussing := 0
childC204.negPreset03.NB.deceitfulnessLying := 0
childC204.negPreset03.NB.defiance := 0
childC204.negPreset03.NB.demanding := 0
childC204.negPreset03.NB.demandsAttention := 0
childC204.negPreset03.NB.destructionOfProperty := 0
childC204.negPreset03.NB.disobedient := 0
childC204.negPreset03.NB.disrespectfulOfPeers := 0
childC204.negPreset03.NB.disrespectfulOfAdults := 0
childC204.negPreset03.NB.harmingOthers := 0
childC204.negPreset03.NB.hostility := 0
childC204.negPreset03.NB.inappropriateDress := 0
childC204.negPreset03.NB.inappropriateSexualBehavior := 0
childC204.negPreset03.NB.manipulative := 0
childC204.negPreset03.NB.other := 0
childC204.negPreset03.NB.physicalAgression := 0
childC204.negPreset03.NB.poorHygiene := 0
childC204.negPreset03.NB.pouting := 0
childC204.negPreset03.NB.refusalToCompleteChores := 0
childC204.negPreset03.NB.selfHarming := 0
childC204.negPreset03.NB.slammingDoors := 0
childC204.negPreset03.NB.schoolBehavior := 0
childC204.negPreset03.NB.tantrum := 0
childC204.negPreset03.NB.theft := 0
childC204.negPreset03.NB.tobaccoUse := 0
childC204.negPreset03.NB.unauthorizedAbsence := 0
childC204.negPreset03.NB.verbalAbuse := 0
childC204.negPreset03.NB.violationOfRules := 0

childC205 := {name: ""}
childC206 := {name: ""}
childC207 := {name: ""}
childC208 := {name: ""}

; -------------------------------------------------------------------------------------------------
Gui, Add, Tab, x0 y0 w%guiW% h%guiH%, Progress_Note|Options

; -------------------------------------------------------------------------------------------------
Gui, Tab, Progress_Note

Gui, Add, Button, x%helpX% y0 w40 h20 gHelp, ?
Gui, Add, Button, x%RLDX% y0 w40 h20 gRLD, RLD

gui, add, text, 0x12 x1 y28 w%borderW% h%borderH%,

rowY=40
gui, add, text, x5 y%rowY% h20, Date (mm/dd/yyyy):
gui, add, edit,  x105 y%rowY%  w115 vdate, % today

Gui, Add, CheckBox, x225 y%rowY% h20 visEditNote, Edit Existing Note

rowY+=25
gui, add, text, x5 y%rowY% h20, Child Presets:
gui, add, button, x105 y%rowY% w35 h20 gsetChildC101, C101
gui, add, button, x145 y%rowY% w35 h20 gsetChildC102, C102
gui, add, button, x185 y%rowY% w35 h20 gsetChildC103, C103
gui, add, button, x225 y%rowY% w35 h20 gsetChildC104, C104
gui, add, button, x265 y%rowY% w35 h20 gsetChildC105, C105
gui, add, button, x305 y%rowY% w35 h20 gsetChildC106, C106
gui, add, button, x345 y%rowY% w35 h20 gsetChildC107, C107
gui, add, button, x385 y%rowY% w35 h20 gsetChildC108, C108

rowY+=25
gui, add, button, x105 y%rowY% w35 h20 gsetChildC201, C201
gui, add, button, x145 y%rowY% w35 h20 gsetChildC202, C202
gui, add, button, x185 y%rowY% w35 h20 gsetChildC203, C203
gui, add, button, x225 y%rowY% w35 h20 gsetChildC204, C204
gui, add, button, x265 y%rowY% w35 h20 gsetChildC205, C205
gui, add, button, x305 y%rowY% w35 h20 gsetChildC206, C206
gui, add, button, x345 y%rowY% w35 h20 gsetChildC207, C207
gui, add, button, x385 y%rowY% w35 h20 gsetChildC208, C208

rowY+=25
gui, add, text,  x5 y%rowY% h20, Child Name:
gui, add, edit,  x105 y%rowY% w115 h20 vchildName
gui, add, text,  x245 y%rowY% w300 h20 vlaundryDay, Laundry Day:

rowY+=35
gui, add, text, x5 y%rowY% h20, Positive Modifiers:
Gui, Add, CheckBox, x105 y%rowY% h20 vposMod01 gapplyPosModifiers, Tidy
Gui, Add, CheckBox, x175 y%rowY% h20 vposMod02 gapplyPosModifiers, Chore
Gui, Add, CheckBox, x245 y%rowY% h20 vposMod03 gapplyPosModifiers, Deep C.

rowY+=25
Gui, Add, CheckBox, x105 y%rowY% h20 vposMod04 gapplyPosModifiers, Shower
Gui, Add, CheckBox, x175 y%rowY% h20 vposMod05 gapplyPosModifiers, S. Laund.
Gui, Add, CheckBox, x245 y%rowY% h20 vposMod06 gapplyPosModifiers, C. Laund.

rowY+=25
gui, add, text, x5 y%rowY% h20, Positive Presets:
gui, add, button, x105 y%rowY% w35 h20 gsetPosPreset01, P-01
gui, add, button, x145 y%rowY% w35 h20 gsetPosPreset02, P-02
gui, add, button, x185 y%rowY% w35 h20 gsetPosPreset03, P-03

rowY+=25
gui, add, text, x5 y%rowY% h20, Description of Positive Behaviors:

rowY+=25
gui, add, edit, x5 y%rowY% w%fullWidth% h60 vDOPB,

rowY+=75
gui, add, text, x5 y%rowY% h20, Negative Presets:
gui, add, button, x105 y%rowY% w35 h20 gsetNegPreset01, N-01
gui, add, button, x145 y%rowY% w35 h20 gsetNegPreset02, N-02
gui, add, button, x185 y%rowY% w35 h20 gsetNegPreset03, N-03

rowY+=25
gui, add, text, x5 y%rowY% h20, Description of Negative Behaviors:

rowY+=25
gui, add, edit, x5 y%rowY% w%fullWidth% h60 vDONB,

rowY+=75
gui, add, text, x5 y%rowY% w%fullWidth% h60, Priviledge Level
gui, add, DropDownList, x105 y%rowY% w65 vpriviledgeLevel AltSubmit, Blue||Green|Orange|Red|Purple|Yellow

rowY+=35
gui, add, button, x5 y%rowY% w%fullWidth% h40 gdoProgressNote, Make Progress Note!!!
rowY+=43
gui, add, progress, x5 y%rowY% w%fullWidth% h15 cee5511 vprogbar,

; -------------------------------------------------------------------------------------------------
Gui, Tab, Options
Gui, Add, Button, x%helpX% y0 w40 h20 gHelp, ?
Gui, Add, Button, x%RLDX% y0 w40 h20 gRLD, RLD
Gui, Add, CheckBox, x10 y30 h20 vcheckOnTop gKeepOnTop checked, Keep on Top of other Windows
Gui, Add, CheckBox, x10 y50 h20 vcheckMousePos gshowMousePos, Show Mouse Position and Active Window

return
; -------------------------------------------------------------------------------------------------
setPosModString:
gui, submit, nohide
posModString := ""
pronoun := ""
possessive := ""
posModArray := []

if(currChild.sex = "male") {
	pronoun := " He "
	possessive := "his "
} else {
	pronoun := " She "
	possessive := "her "
}

if(posMod01 = true) {
	thing := "had a tidy room"
	posModArray.push(thing)
}

if(posMod02 = true) {
	thing := "completed " . possessive . "chore"
	posModArray.push(thing)
}

if(posMod03 = true) {
	thing := "completed " . possessive . "deep cleaning"
	posModArray.push(thing)
}

if(posMod04 = true) {
	thing := "took " . possessive . "shower"
	posModArray.push(thing)
}

if(posMod05 = true) {
	thing := "started " . possessive . "laundry"
	posModArray.push(thing)
}

if(posMod06 = true) {
	thing := "finished " . possessive . "laundry"
	posModArray.push(thing)
}


if(posMod01 = false and posMod02 = false and posMod03 = false and posMod04 = false and posMod05 = false and posMod06 = false) {
	posModString := ""
} else {
	posModString := pronoun
	for i, thing in posModArray
		if(posModArray.length() = 1)
			posModString := posModString . thing
		else if(posModArray.length() = 2 and i = 1)
			posModString := posModString . thing . " and "
		else if(i = posModArray.length() - 1 and posModArray.length() > 2)
			posModString := posModString . thing . ", and "
		else if(i != posModArray.length() and posModArray.length() > 2)
			posModString := posModString . thing . ", "
		else if(i = posModArray.length())
			posModString := posModString . thing
		
	posModString := posModString . "."
}

return


applyPosModifiers:
gosub, setPosModString
GuiControl,, DOPB, % currPosPreset.PB.DOPB . posModString
SoundBeep
return

; ----------------------------------------------------------------

setChildName:
GuiControl,, childName, % currChild.name
GuiControl,, laundryDay, % "Laundry Day: " . currChild.laundryDay
return

setChildC101:
currChild := childC101
gosub, setChildName
SoundBeep
return

setChildC102:
currChild := childC102
gosub, setChildName
SoundBeep
return

setChildC103:
currChild := childC103
gosub, setChildName
SoundBeep
return

setChildC104:
currChild := childC104
gosub, setChildName
SoundBeep
return

setChildC105:
currChild := childC105
gosub, setChildName
SoundBeep
return

setChildC106:
currChild := childC106
gosub, setChildName
SoundBeep
return

setChildC107:
currChild := childC107
gosub, setChildName
SoundBeep
return

setChildC108:
currChild := childC108
gosub, setChildName
SoundBeep
return

setChildC201:
currChild := childC201
gosub, setChildName
SoundBeep
return

setChildC202:
currChild := childC202
gosub, setChildName
SoundBeep
return

setChildC203:
currChild := childC203
gosub, setChildName
SoundBeep
return

setChildC204:
currChild := childC204
gosub, setChildName
SoundBeep
return

setChildC205:
currChild := childC205
gosub, setChildName
SoundBeep
return

setChildC206:
currChild := childC206
gosub, setChildName
SoundBeep
return

setChildC207:
currChild := childC207
gosub, setChildName
SoundBeep
return

setChildC208:
currChild := childC208
gosub, setChildName
SoundBeep
return

; -----------------------------------------------------
setPosPreset01:
currPosPreset := currChild.posPreset01
currPBArray := currChild.posPreset01.PB
gosub, setPosPresetModifiers
gosub, setPosModString
GuiControl,, DOPB, % currPosPreset.PB.DOPB . posModString
SoundBeep
return

setPosPreset02:
currPosPreset := currChild.posPreset02
currPBArray := currChild.posPreset02.PB
gosub, setPosPresetModifiers
gosub, setPosModString
GuiControl,, DOPB, % currPosPreset.PB.DOPB . posModString
SoundBeep
return

setPosPreset03:
currPosPreset := currChild.posPreset03
currPBArray := currChild.posPreset03.PB
gosub, setPosPresetModifiers
gosub, setPosModString
GuiControl,, DOPB, % currPosPreset.PB.DOPB . posModString
SoundBeep
return

setPosPresetModifiers:
GuiControl,, posMod01, % currPosPreset.PB.posMod01
GuiControl,, posMod02, % currPosPreset.PB.posMod02
GuiControl,, posMod03, % currPosPreset.PB.posMod03
GuiControl,, posMod04, % currPosPreset.PB.posMod04
GuiControl,, posMod05, % currPosPreset.PB.posMod05
GuiControl,, posMod06, % currPosPreset.PB.posMod06
Return

evalPosModifiers:
if(posMod01 = true)
	currPosPreset.PB.cleanRoom := 1
else
	currPosPreset.PB.cleanRoom := 0

if(posMod02 = true and posMod03 = true)
	currPosPreset.PB.completedChore := 2

else if(posMod02 = true)
	currPosPreset.PB.completedChore := 1

else if(posMod03 = true)
	currPosPreset.PB.completedChore := 1
else
	currPosPreset.PB.completedChore := 0

if(posMod04 = true)
	currPosPreset.PB.goodHygiene := 1
else
	currPosPreset.PB.goodHygiene := 0

if(posMod05 = true and posMod06 = true)
	currPosPreset.PB.clothingCare := 2

else if(posMod05 = true)
	currPosPreset.PB.clothingCare := 1

else if(posMod06 = true)
	currPosPreset.PB.clothingCare := 1
else
	currPosPreset.PB.clothingCare := 0

return

; -----------------------------------------------------
setNegPreset01:
currNegPreset := currChild.negPreset01
currNBArray := currNegPreset.NB
GuiControl,, DONB, % currNBArray.DONB . negModString
SoundBeep
return

setNegPreset02:
currNegPreset := currChild.negPreset02
currNBArray := currNegPreset.NB
GuiControl,, DONB, % currNBArray.DONB . negModString
SoundBeep
return

setNegPreset03:
currNegPreset := currChild.negPreset03
currNBArray := currNegPreset.NB
GuiControl,, DONB, % currNBArray.DONB . negModString
SoundBeep
return

progUp:
prog := prog + progStep
GuiControl,,progbar, % prog
beepTone := % beepTone + beepStep
if (beepTone > 1250)
	{
		beepTone := 750
	}
SoundBeep, %beepTone%, %beepLength%
return

tabProgUpSleep:
Send, {Tab}
gosub, progUp
Sleep, % sleepAmount
return

^`::
doProgressNote:
gui, submit, nohide

; If there exists a window with the windowTitleChunk in its title, it will become active
; Else, the routine will short circuit
if WinExist(windowTitleChunk) {
	winActivate
}

else
	{
		msgbox, "There ain't no Daily Progress Note window, BRUH."
		return
	}

gosub, evalPosModifiers
prog := 0
GuiControl,,progbar, prog
SoundBeep, 950, 200

; htmlfile := ComObjCreate("htmlfile") ;v1 sintax
; ; htmlfile := ComObject("htmlfile") ;v2 sintax
; htmlfile.write("<meta http-equiv='X-UA-Compatible' content='IE=edge'>")
; JS := htmlfile.parentWindow
; JS.eval("alert('this is AHK')")

Sleep, % sleepAmount * 2
send ^a
Sleep, % sleepAmount
send % date
send {Tab}
Sleep, % sleepAmount

if (isEditNote == False) {
	send {Tab}
	Sleep, % sleepAmount
}

Sleep, % sleepAmount * 2

Send, % currPBArray.accountability
gosub, tabProgUpSleep

Send, % currPBArray.angerImpulseControl
gosub, tabProgUpSleep

Send, % currPBArray.busReport
gosub, tabProgUpSleep

Send, % currPBArray.cleanRoom
gosub, tabProgUpSleep

Send, % currPBArray.clothingCare
gosub, tabProgUpSleep

Send, % currPBArray.completedChore
gosub, tabProgUpSleep

Send, % currPBArray.completedHomework
gosub, tabProgUpSleep

Send, % currPBArray.goodHygiene
gosub, tabProgUpSleep

Send, % currPBArray.goodSocialSkills
gosub, tabProgUpSleep

Send, % currPBArray.grateful
gosub, tabProgUpSleep

Send, % currPBArray.helpful
gosub, tabProgUpSleep

Send, % currPBArray.politeGoodManners
gosub, tabProgUpSleep

Send, % currPBArray.positiveReferral
gosub, tabProgUpSleep

Send, % currPBArray.practiceTruthfulness
gosub, tabProgUpSleep

Send, % currPBArray.respectfulOfAdults
gosub, tabProgUpSleep

Send, % currPBArray.respectfulOfPeers
gosub, tabProgUpSleep

Send, % currPBArray.respectfulOfProperty
gosub, tabProgUpSleep

Send, % currPBArray.other
gosub, tabProgUpSleep

Send, ^a
Sleep, % sleepAmount
Send, % DOPB
Sleep, % sleepAmount
gosub, tabProgUpSleep

Send, % currNBArray.arguing
gosub, tabProgUpSleep

Send, % currNBArray.boundaries
gosub, tabProgUpSleep

Send, % currNBArray.busIncident
gosub, tabProgUpSleep

Send, % currNBArray.complaining
gosub, tabProgUpSleep

Send, % currNBArray.crueltyToAnimals
gosub, tabProgUpSleep

Send, % currNBArray.cussing
gosub, tabProgUpSleep

Send, % currNBArray.deceitfulnessLying
gosub, tabProgUpSleep

Send, % currNBArray.defiance
gosub, tabProgUpSleep

Send, % currNBArray.demanding
gosub, tabProgUpSleep

Send, % currNBArray.demandsAttention
gosub, tabProgUpSleep

Send, % currNBArray.destructionOfProperty
gosub, tabProgUpSleep

Send, % currNBArray.disobedient
gosub, tabProgUpSleep

Send, % currNBArray.disrespectfulOfPeers
gosub, tabProgUpSleep

Send, % currNBArray.disrespectfulOfAdults
gosub, tabProgUpSleep

Send, % currNBArray.harmingOthers
gosub, tabProgUpSleep

Send, % currNBArray.hostility
gosub, tabProgUpSleep

Send, % currNBArray.inappropriateDress
gosub, tabProgUpSleep

Send, % currNBArray.inappropriateSexualBehavior
gosub, tabProgUpSleep

Send, % currNBArray.manipulative
gosub, tabProgUpSleep

Send, % currNBArray.other
gosub, tabProgUpSleep

Send, % currNBArray.physicalAgression
gosub, tabProgUpSleep

Send, % currNBArray.poorHygiene
gosub, tabProgUpSleep

Send, % currNBArray.pouting
gosub, tabProgUpSleep

Send, % currNBArray.refusalToCompleteChores
gosub, tabProgUpSleep

Send, % currNBArray.selfHarming
gosub, tabProgUpSleep

Send, % currNBArray.slammingDoors
gosub, tabProgUpSleep

Send, % currNBArray.schoolBehavior
gosub, tabProgUpSleep

Send, % currNBArray.tantrum
gosub, tabProgUpSleep

Send, % currNBArray.theft
gosub, tabProgUpSleep

Send, % currNBArray.tobaccoUse
gosub, tabProgUpSleep

Send, % currNBArray.unauthorizedAbsence
gosub, tabProgUpSleep

Send, % currNBArray.verbalAbuse
gosub, tabProgUpSleep

Send, % currNBArray.violationOfRules
gosub, tabProgUpSleep

Send, ^a
Sleep, % sleepAmount
Send, % DONB
Sleep, % sleepAmount
gosub, tabProgUpSleep

; This tabs to the "Signature Date" field
Loop, 10
	{
		Send, {Tab}
		Sleep, % sleepAmount
	}
	
Loop, % priviledgeLevel
	{
		Send, {Tab}
		Sleep, % sleepAmount
	}

Send, {Space}
Sleep, % sleepAmount

Loop, % 6 - priviledgeLevel + 3
	{
		Send, {Tab}
		Sleep, % sleepAmount
	}
	
Send, % date
Sleep, % sleepAmount
Send, {Tab}

GuiControl,,progbar, 100
SoundBeep, 750, 200

Return

; -------------------------------------------------------------------------------------------------
; Show the mouse position x and y as a tooltip
showMousePos:
CoordMode,Mouse,Screen
gui, submit, nohide
GuiControlGet, checkMousePos
if (checkMousePos = 1)
	{
		WatchCursor:
			WinGetTitle, Title, A
			MouseGetPos, xpos, ypos
			ToolTip, X%xpos% Y%ypos% Title:%Title%
		SetTimer, WatchCursor, 100
	}

if (CheckMousePos = 0)
	{
		RemoveToolTip:
			ToolTip
			return
	}

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
