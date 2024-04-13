; #SingleInstance, Force
; sendMode, Input
; SetBatchLines, -1
; SetWorkingDir, %A_ScriptDir%

; mouse sideButton
; switchScreen
XButton2::^#Left
XButton1::^#Right

; alt+enter
; windowTop
!enter::
{
    try {
        ow := WinGet("id", "A")
        WinTopToggle(ow)
    } catch Error as e {
        ; handle the error
        MsgBox "An error occurred: " e.message
    }
}
return
WinTopToggle(w) {
    oTitle := WinGetTitle("ahk_id " w)
    Winset("AlwaysOnTop", "Toggle", "ahk_id " w)
    ExStyle := WinGet("ExStyle", "ahk_id " w)
    if (ExStyle & 0x8) ; 0x8 is WS_EX_TOPMOST
        oTop := "winOnTop"
    else
        oTop := "cancelWinOnTop"
    tooltip(oTitle " " oTop)
    SetTimer("RemoveToolTip", 5000)
return

RemoveToolTip:
    SetTimer("RemoveToolTip", "Off")
    ToolTip()
return
}

; ctrl+shift+alt+v in every where
; originalPaste
^+!v::
{
    SendInput(%Clipboard%)
}
return


; Pause in keyboard corner
; switch to suspend mode
Pause::
{
    Suspend
    toggle:=!toggle
    if(toggle){
        MsgBox("[paused!]")
    }
    else{
        MsgBox("[unpaused!]")
    }
}
return

; CapsLock modify
; Map CapsLock to Esc
CapsLock::Esc
; Map ctrl+CapsLock to CapsLock
F13::CapsLock
^CapsLock::F13

; Capslock + hjkl for vim editor
; Map CapsLock+H to Left arrow key
CapsLock & h::Send("{Left}")
; Map CapsLock+L to Right arrow key
CapsLock & l::Send("{Right}")
; Map CapsLock+J to Down arrow key
CapsLock & j::Send("{Down}")
; Map CapsLock+K to Up arrow key
CapsLock & k::Send("{Up}")