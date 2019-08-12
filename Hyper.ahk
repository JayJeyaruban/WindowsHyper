#NoEnv ; recommended for performance and compatibility with future autohotkey releases.
#UseHook
#InstallKeybdHook
#SingleInstance force

SendMode Input

;; Deactivate capslock completely
SetCapslockState, AlwaysOff

;; Remap capslock to hyper
;; if capslock is toggled, remap it to esc

;; Note: must use tidle prefix to fire hotkey once it is pressed
;; not until the hotkey is released
~Capslock::
    ;; must use downtemp to emulate hyper key, you cannot use down in this case 
    ;; according to http://bit.ly/2fLyHHI, downtemp is as same as down except for ctrl/alt/shift/win keys
    ;; in those cases, downtemp tells subsequent sends that the key is not permanently down, and may be 
    ;; released whenever a keystroke calls for it.
    ;; for example, Send {Ctrl Downtemp} followed later by Send {Left} would produce a normal {Left}
    ;; keystroke, not a Ctrl{Left} keystroke
    Send {F20 DownTemp}
    KeyWait, Capslock
    Send {F20 Up}
    if (A_PriorKey = "Capslock") {
        Send {Esc}
    }
return

;; Vim Controls
~Capslock & h:: Send {Left}
~Capslock & l:: Send {Right}
~Capslock & k:: Send {Up}
~Capslock & j:: Send {Down}

~Capslock & e::^Right
~Capslock & b::^Left
~Capslock & 4::End
~Capslock & 0::Home
~Capslock & o::Send {End}{Enter}
~Capslock & x::Delete

;; Mac-like Cmd + backspace
~Capslock & Backspace::Send {Shift down}{Home down}{Home up}{Shift up}{Backspace}

Esc::Capslock
