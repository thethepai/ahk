#SingleInstance, Force
sendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

; mouse sideButton
; switchScreen
XButton2::^#Left
XButton1::^#Right

; alt+enter
; windowTop
!enter::
    WinGet ow, id, A
    WinTopToggle(ow)
return
WinTopToggle(w) {

    WinGetTitle, oTitle, ahk_id %w%
    Winset, AlwaysOnTop, Toggle, ahk_id %w%
    WinGet, ExStyle, ExStyle, ahk_id %w%
    if (ExStyle & 0x8) ; 0x8 为 WS_EX_TOPMOST.在WinGet的帮助中可以得知状态的表示
        oTop = winOnTop
    else
        oTop = cancelWinOnTop
    tooltip %oTitle% %oTop%
    SetTimer, RemoveToolTip, 5000
return

RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return
}

; ctrl+shift+alt+v every where
; originalPaste
^+!v::
    SendInput {Raw}%Clipboard%
Return


; Pause in keyboard corner
; switch to suspend mode
Pause::
    Suspend
    toggle:=!toggle
    if(toggle){
        MsgBox, [paused!]
    }
    else{
        MsgBox, [unpaused!]
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
CapsLock & h::Send {Left}
; Map CapsLock+L to Right arrow key
CapsLock & l::Send {Right}
; Map CapsLock+J to Down arrow key
CapsLock & j::Send {Down}
; Map CapsLock+K to Up arrow key
CapsLock & k::Send {Up}