#SingleInstance force
#Persistent  ; Keep this script running until the user explicitly exits it*
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
;SetNumlockState, AlwaysOn

;#InstallKeybdHook
;#InstallMouseHook

Layer := 1


;Layer checker
z::
ToolTip %Layer%
SetTimer, RemoveToolTip, 2000
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return


;Layer modifier
CapsLock::
Layer := 2
if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200)
	Layer := 3
KeyWait, CapsLock
Layer := 1
Return


;Layer test
#if Layer=2
v::o
tab::!l
Return
#if layer =3
$v::p
Return