#SingleInstance force
#Persistent  ; Keep this script running until the user explicitly exits it.

SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
;#InstallKeybdHook
;#InstallMouseHook


{ ;Monitoring Windows
	
	KeyHistory
	WinGetActiveTitle, Title
	WinWait, %Title%
	SetKeyDelay 0, 32
	Send {Lwin down}{Right}{Right}{Right}{Right}{Lwin up}{LControl down}{k}{LControl Up}
	
	IfWinExist Event Tester
		WinClose Event Tester
	
	Run, C:\Program Files (x86)\Thrustmaster\TARGET\Tools\EventTester.exe
	WinWait, Event Tester
	SetKeyDelay 0, 32
	Send {Lwin down}{Right}{Right}{Lwin up}{esc}
	return
	
	#IfWinActive Event Tester
		$F5::
	WinActivate %Title%
	SetKeyDelay 500, 32
	Send {F5}
	return
}

{ ;Before running a Game
	#IfWinNotExist MSI Afterburner
		#t::
	Run, C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe
	WinWait MSI Afterburner
	
	#IfWinNotExist Set Timer Resolution
		Run, D:\-  Téléchargements sur D\TimerResolution.exe
	WinWait Set Timer Resolution
	WinMinimize Set Timer Resolution
	WinActivate MSI Afterburner
	WinMaximize MSI Afterburner
	return
}

{ ;Joystick ID (UYse JoyID Program)
	;6Joy = T16000L (See JoyID)
	;5Joy = Vjoy
}

{ ;Testing
	
	
	
;Testing
}

/*
	$a::
	KeyWait, a, T0.1
	
	if (ErrorLevel)
	{
		Send {b down}
		keywait a
		Send {b up}
	}
	else {
		KeyWait, a, D T0.1
		
		if (ErrorLevel)
		{
			Send {a down}
			keywait a
			Send {a up}
		}
		
		else
		{
			Send {c down}
			keywait a
			Send {c up}
		}
		
	}
	
	KeyWait, a
	return
*/

{
	/*
		$f1::
		{
			count++
			settimer, actions, 333
		}
		return
		
		actions:
		{
			if (count = 1)
			{
				send {F1}
			}
			else if (count = 2)
			{
				send {F2}
			}
			else if (count = 3)
			{
				send {F3}
			}
			count := 0
		}
		return	
	*/
	
	/*
		SetTimer, WatchAxis, 5
		return
		
		WatchAxis:
		GetKeyState, 6JoyX, 6JoyX  ; Get position of X axis.
		GetKeyState, 6JoyY, 6JoyY  ; Get position of Y axis.
		KeyToHoldDownPrev = %KeyToHoldDown%  ; Prev now holds the key that was down before (if any).
		
		if 6JoyX > 70
			KeyToHoldDown = Right
		else if 6JoyX < 30
			KeyToHoldDown = Left
		else if 6JoyY > 70
			KeyToHoldDown = Down
		else if 6JoyY < 30
			KeyToHoldDown = Up
		else
			KeyToHoldDown =
		
		if KeyToHoldDown = %KeyToHoldDownPrev%  ; The correct key is already down (or no key is needed).
			return  ; Do nothing.
		
; Otherwise, release the previous key and press down the new key:
		SetKeyDelay -1  ; Avoid delays between keystrokes.
		if KeyToHoldDownPrev   ; There is a previous key to release.
			Send, {%KeyToHoldDownPrev% up}  ; Release it.
		if KeyToHoldDown   ; There is a key to press down.
			Send, {%KeyToHoldDown% down}  ; Press it down.
		return
	*/
	
	/*
		
		6Joy1::
		If GetKeyState("6Joy2", "P")=1
		{
			send {d Down}
			keywait 6Joy1
			send, {d Up}
		}
		else 
			if GetKeyState("6joy3", "p")=1
			{
				send {v Down}
				keywait 6Joy1
				send, {v Up}
			}
		Else 
		{
			send {c Down}
			keywait 6Joy1
			send, {c Up}
		}
		Return
	*/
}

/*
	$f8::
	{
		count++
		settimer, actionsF8, 200
	}
	return
	
	actionsF8:
	{
		if (count = 1)
		{
			send {F8}
		}
		else if (count = 2)
		{
			send {F9}
		}
		else if (count = 3)
		{
			send {F10}
		}
		count := 0
	}
	return	
*/

/*
	$g::
	KeyWait g, t0.200
	t:= A_TimeSinceThisHotkey
	If ErrorLevel
	{
		SendInput {h down}
		KeyWait g
		SendInput {h up}
	}
	else
	{
		SendInput {g down}
		sleep 32
		SendInput {g up}
	}
	return
*/

/*
	$k::
	KeyWait k, t0.200
	t:= A_TimeSinceThisHotkey
	If ErrorLevel
	{
		SendInput {l down}
		KeyWait k
		SendInput {l up}
	}
	else
	{
		SendInput {k down}
		sleep 32
		SendInput {k up}
	}
	return
*/


/*
	{
		;Mouse wheel remapping and/or Shift.
		;#IfWinActive EscapeFromTarkov
		
		~WheelUp:: 
		SetkeyDelay,32, 32
		If GetKeyState("MButton") 
			send {PGUP}
		
		Else
			If GetKeyState("Space") 
				send {Home}
		Else
			If (GetKeyState("6Joy1")==1)
				send g
		Return
		
		~WheelDown:: 
		SetkeyDelay,32, 32
		If GetKeyState("MButton") 
			send {PGDN}
		
		Else 
			If GetKeyState("Space") 
				send {End}
		Return
		;#IfWinActive
	}
	
*/


/*
	;Mouse button remapping and/or Shift.
	{
		;#IfWinActive EscapeFromTarkov	
		
		XButton2::
		SetKeyDelay 32, 32
		send ^t
		Return
		
		XButton1::t
		
		~Right & LButton::F1
		Return
		
		~Right & RButton::F2
		Return
		
		~Right & XButton1::F3
		Return
		
		~Right & XButton2::F4
		Return
		
		~Right & WheelUp::
		send, {F5}
		Sleep, 100
		Return
		
		~Right & WheelDown::
		send, {F6}
		Sleep, 100
		Return
		
		~Right & MButton::F7
		Return
		
		~Right & F8::F9
		Return
		
		~Right & F9::F10
		Return
		;#IfWinActive
	}
*/

;Layer initialisation?
Layer := 1


/*
	;Layer checker
	z::
	ToolTip %Layer%
	SetTimer, RemoveToolTip, 2000
	return
	nn
	RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	ToolTip
	return
*/



;Layer modifier
CapsLock::
Layer := 2
if (A_ThisHotkey = A_PriorHotkey && A_TimeSincePriorHotkey < 200)
	Layer := 3
KeyWait, CapsLock
Layer := 1
Return

	;Layer test

#if Layer=1
{ ;All Layer 1
	
	{ ; Mouse Wheel Layer 1
		~WheelUp:: 
		SetkeyDelay, 0, 32
		If GetKeyState("MButton") 
			send {Home}
		;Else
		;	If (GetKeyState("6Joy1")==1)
		;		send g
		Return
		
		~WheelDown:: 
		SetkeyDelay, 0, 32
		If GetKeyState("MButton") 
			send {End}
		
		;Else 
		;	If GetKeyState("Space") 
		;		send {End}
		Return
	}	
	
	{ ;All Layer 1 Digit remapping Layer 1 Short/Long, Layer 2 Short/Long, Layer 3 Short/Long
		
		$SC002:: ;[1, F1], [7, F7], [F13, F19]
		KeyWait SC002, t0.200&
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			Send {F1 down}
			KeyWait SC002
			SendInput {F1 up}
		}
		else
		{
			SendInput {SC002 down}
			sleep 32
			KeyWait SC002
			SendInput {SC002 up}
		}
		return
		
		
		
		$SC003:: ;[2, F2], [8, F8], [F14, F20]
		KeyWait SC003, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F2 down}
			KeyWait SC003
			SendInput {F2 up}
		}
		else
		{
			SendInput {SC003 down}
			sleep 32
			KeyWait SC003
			SendInput {SC003 up}
		}
		return
		
		$SC004:: ;[3, F3], [9, F9], [F15, F21]
		KeyWait SC004, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F3 down}
			KeyWait SC004
			SendInput {F3 up}
		}
		else
		{
			SendInput {SC004 down}
			sleep 32
			KeyWait SC004
			SendInput {SC004 up}
		}
		return
		
		$SC005:: ;[4, F4], [10, F10], [F16, F22]
		KeyWait SC005, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F4 down}
			KeyWait SC005
			SendInput {F4 up}
		}
		else
		{
			SendInput {SC005 down}
			sleep 32
			KeyWait SC005
			SendInput {SC005 up}
		}
		return
		
		$SC006:: ;[5, F5], [11, F11], [F17, F23]
		KeyWait SC006, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F5 down}
			KeyWait SC006
			SendInput {F5 up}
		}
		else
		{
			SendInput {SC006 down}
			sleep 32
			KeyWait SC006
			SendInput {SC006 up}
		}
		return
		
		$SC007:: ;[6, F6], [12, F12], [F18, F24]
		KeyWait SC007, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F6 down}
			KeyWait SC007
			SendInput {F6 up}
		}
		else
		{
			SendInput {SC007 down}
			sleep 32
			KeyWait SC007
			SendInput {SC007 up}
		}
		return
	}
	
	{ ; Layer 1 Mouse button remapping and/or Shift.

	;#IfWinActive EscapeFromTarkov	
		
		XButton2::
		SetKeyDelay 32, 32
		send ^t
		Return
		
		XButton1::t
		
		~Right & LButton::F1
		Return
		
		~Right & RButton::F2
		Return
		
		~Right & XButton1::F3
		Return
		
		~Right & XButton2::F4
		Return
		
		~Right & WheelUp::
		send, {F5}
		Sleep, 100
		Return
		
		~Right & WheelDown::
		send, {F6}
		Sleep, 100
		Return
		
		~Right & MButton::F7
		Return
		
		~Right & F8::F9
		Return
		
		~Right & F9::F10
		Return
	;#IfWinActive
	}
}


#if Layer = 2
	
{ ;All Layer 2
	
	{ ; Mouse Wheel Layer 2
		~WheelUp:: 
		SetkeyDelay, 0, 32
		send {PgUp}
		Return
		
		~WheelDown:: 
		SetkeyDelay, 0, 32
		send {PgDn}
		Return
		
	}	
	
	{ ;All Layer 2 Digit remapping
		
		$SC002:: ;[1, F1], [7, F7], [F13, F19]
		KeyWait SC002, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F7 down}
			KeyWait SC002
			SendInput {F7 up}
		}
		else
		{
			SendInput {SC008 down}
			sleep 32
			KeyWait SC002
			SendInput {SC008 up}
		}
		return
		
		
		$SC003:: ;[2, F2], [8, F8], [F14, F20]
		KeyWait SC003, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F8 down}
			KeyWait SC003
			SendInput {F8 up}
		}
		else
		{
			SendInput {SC009 down}
			sleep 32
			KeyWait SC003
			SendInput {SC009 up}
		}
		return
		
		$SC004:: ;[3, F3], [9, F9], [F15, F21]
		KeyWait SC004, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F9 down}
			KeyWait SC004
			SendInput {F9 up}
		}
		else
		{
			SendInput {SC00A down}
			sleep 32
			KeyWait SC004
			SendInput {SC00A up}
		}
		return
		
		$SC005:: ;[4, F4], [10, F10], [F16, F22]
		KeyWait SC005, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F10 down}
			KeyWait SC005
			SendInput {F10 up}
		}
		else
		{
			SendInput {SC00B down}
			sleep 32
			KeyWait SC005
			SendInput {SC00B up}
		}
		return
		
		$SC006:: ;[5, F5], [11, F11], [F17, F23]
		KeyWait SC006, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F11 down}
			KeyWait SC006
			SendInput {F11 up}
		}
		else
		{
			SendInput {SC00C down}
			sleep 32
			KeyWait SC006
			SendInput {SC00C up}
		}
		return
		
		$SC007:: ;[6, F6], [12, F12], [F18, F24]
		KeyWait SC007, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F12 down}
			KeyWait SC007
			SendInput {F12 up}
		}
		else
		{
			SendInput {SC00D down}
			sleep 32
			KeyWait SC007
			SendInput {SC00D up}
		}
		return
	}
	
	{ ; Layer 2 Mouse button remapping and/or Shift.
		
	;#IfWinActive EscapeFromTarkov	
		
		LButton::F1
		Return
		
		RButton::F2
		Return
		
		XButton1::F3
		Return
		
		XButton2::F4
		Return
		
		/*
			WheelUp::
			send, {F5}
			Sleep, 100
			Return
			
			WheelDown::
			send, {F6}
			Sleep, 100
			Return
			
			
			MButton::F7
			Return
		*/
		
		F8::F9
		Return
		
		F9::F10
		Return
	;#IfWinActive
	}
	
	tab::!l
	w::b
	x::n
	c::,
	v::Del
	;f::g
	r::t
	
	{ ;Layer 2 "f" remapping
		$f::
		KeyWait f, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {h down}
			KeyWait f
			SendInput {h up}
		}
		else
		{
			SendInput {g down}
			sleep 32
			SendInput {g up}
		}
		return
	}
	
	{ ;Layer 2 "r" remapping
		$r::
		KeyWait r, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {y down}
			KeyWait r
			SendInput {y up}
		}
		else
		{
			SendInput {t down}
			sleep 32
			SendInput {t up}
		}
		return
	}
	
}

#if Layer = 3
	
{ ;All Layer 3
	
	{ ; Mouse Wheel Layer 3
		SetkeyDelay, 0, 32
		If GetKeyState("MButton") 
			send {PGUP}
		else
			send {Insert}
		;Else
		;	If (GetKeyState("6Joy1")==1)
		;		send g
		Return
		
		~WheelDown:: 
		SetkeyDelay, 0, 32
		If GetKeyState("MButton") 
			send {PGDN}
		Else
			send {Del}
		;Else 
		;	If GetKeyState("Space") 
		;		send {End}
		Return
	}
	
	{ ;All Layer 3 Digit remapping
		$SC002:: ;[1, F1], [7, F7], [F13, F19]
		KeyWait SC002, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F19 down}
			KeyWait SC002
			SendInput {F19 up}
		}
		else
		{
			SendInput {F13 down}
			sleep 32
			KeyWait SC002
			SendInput {F13 up}
		}
		return
		
		
		$SC003:: ;[2, F2], [8, F8], [F14, F20]
		KeyWait SC003, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F20 down}
			KeyWait SC003
			SendInput {F20 up}
		}
		else
		{
			SendInput {F14 down}
			sleep 32
			KeyWait SC003
			SendInput {F14 up}
		}
		return
		
		$SC004:: ;[3, F3], [9, F9], [F15, F21]
		KeyWait SC004, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F21 down}
			KeyWait SC004
			SendInput {F21 up}
		}
		else
		{
			SendInput {F15 down}
			sleep 32
			KeyWait SC004
			SendInput {F15 up}
		}
		return
		
		$SC005:: ;[4, F4], [10, F10], [F16, F22]
		KeyWait SC005, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F22 down}
			KeyWait SC005
			SendInput {F22 up}
		}
		else
		{
			SendInput {F16 down}
			sleep 32
			KeyWait SC005
			SendInput {F16 up}
		}
		return
		
		$SC006:: ;[5, F5], [11, F11], [F17, F23]
		KeyWait SC006, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F23 down}
			KeyWait SC006
			SendInput {F23 up}
		}
		else
		{
			SendInput {F17 down}
			sleep 32
			KeyWait SC006
			SendInput {F17 up}
		}
		return
		
		$SC007:: ;[6, F6], [12, F12], [F18, F24]
		KeyWait SC007, t0.200
		t:= A_TimeSinceThisHotkey
		If ErrorLevel
		{
			SendInput {F24 down}
			KeyWait SC007
			SendInput {F24 up}
		}
		else
		{
			SendInput {F18 down}
			sleep 32
			KeyWait SC007
			SendInput {F18 up}
		}
		return
	}
	
	{ ; Layer 3 Mouse button remapping and/or Shift.
		
	;#IfWinActive EscapeFromTarkov	
		
		LButton::F1
		Return
		
		RButton::F2
		Return
		
		XButton1::F3
		Return
		
		XButton2::F4
		Return
		
		/*
			WheelUp::
			WheelUp::
			send, {F5}
			Sleep, 100
			Return
			
			WheelDown::
			send, {F6}
			Sleep, 100
			Return
			
			
			MButton::F7
			Return
		*/
		
		F8::F9
		Return
		
		F9::F10
		Return
	;#IfWinActive
	}
	
	tab::AppsKey
	w::Numpad0
	x::Numpad1
	c::Numpad2
	v::Numpad3
	;r::y
	f::h
	
}