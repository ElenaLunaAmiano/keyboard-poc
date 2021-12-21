sub init()
    ' channel is designed for FHD coords
    m.screenWidth  = 1280
    m.screenHeight = 720

    m.focusableItems = {
        BUTTON: "button"
        KEYGRID: "keyGrid"
        TEXTFIELD: "textField"
    }

    m.button = m.top.findNode("buttonMode")
    m.button.focusBitmapUri = "pkg:/images/buttons/button_focused.png"
    ' m.button.backgroundURI = "pkg:/images/buttons/generic_outline.png"
    m.button.width = 111
    m.button.height = 42
    m.button.iconUri = ""
    m.button.focusedIconUri = ""

    m.keyboard = m.top.findNode("theKeyboard")

    m.enteredText = m.top.findNode("enteredText")
    m.keyboard.observeFieldScoped("text", "textChanged")

    m.keyboard.mode = "AddressLower"

    m.keyboard.textEditBox.voiceEnabled = true
    m.keyboard.textEditBox.flipVoiceToolTip = true
    ' m.keyboard.textEditBox.backgroundUri = "pkg:/images/buttons/generic_outline.png"
    ' m.keyboard.textEditBox.backgroundUri = "pkg:/images/pixel/pixel_white.png"
    m.keyboard.fontUri = "pkg:/fonts/regular.ttf"

    m.line = m.top.findNode("line")
    m.line.uri = "pkg:/images/pixel/pixel_white.png"
    m.line.width = 1100
    m.line.height = 1
    m.line.translation = [70,320]

    m.keyboard.keyGrid.visible = true
    m.button.text = "HIDE"

    m.previousFocus = invalid
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "OK" AND m.previousFocus = invalid 
        if m.keyboard.keyGrid.isInFocusChain()
            m.previousFocus = m.focusableItems.KEYGRID
            return true
        end if 
    end if
    print "------------------Custom search keyboard onKeyEvent ";key;" "; press
    print "Search m.button.hasFocus() "; m.button.hasFocus()
    print "Search m.keyboard.textEditBox.hasFocus() "; m.keyboard.textEditBox.hasFocus()
    print "Search m.keyboard.keyGrid.KeyGrid() "; m.keyboard.keyGrid.hasFocus()
    print "Search m.keyboard.isInFocusChain() "; m.keyboard.isInFocusChain()
    print "Search m.keyboard.textEditBox.isInFocusChain() "; m.keyboard.textEditBox.isInFocusChain()
    print "Search m.keyboard.keyGrid.isInFocusChain() "; m.keyboard.keyGrid.isInFocusChain()
    ' print "------------------Custom search IDS  "

    print "+++++++ PREVIOUS "; m.previousFocus

        if m.button.hasFocus()
            m.previousFocus = m.focusableItems.BUTTON
            print "Search IF 1"
            if (key = "OK")
                toggleKeyboard()
            else if (key = "down" OR key = "right")
                print "Search IF 2"
                m.button.setFocus(false)
                m.keyboard.textEditBox.setFocus(true)
                m.keyboard.keyGrid.visible = true
            end if
        else if m.keyboard.textEditBox.hasFocus()
            print "Search IF 3"
            if key = "up"
                if m.previousFocus = m.focusableItems.KEYGRID
                    print "Search IF 4"
                    m.previousFocus = m.focusableItems.TEXTFIELD
                else
                    print "Search IF 5"
                    m.previousFocus = m.focusableItems.TEXTFIELD
                    m.keyboard.textEditBox.setFocus(false)
                    m.button.setFocus(true)
                    m.button.text = "SHOW"
                    m.keyboard.keyGrid.visible = false
                end if
            else if key="down"
                m.previousFocus = m.keyboard.keyGrid.id
            end if
        else if m.keyboard.keyGrid.hasFocus()
            print "Search IF 6"
            m.previousFocus = m.focusableItems.KEYGRID
        end if
    return true
end function

sub toggleKeyboard()
    if m.previousFocus = invalid then return

    print "TOGGLE "; m.keyboard.keyGrid.visible
    m.keyboard.keyGrid.visible = NOT m.keyboard.keyGrid.visible
    print "VISIBLE "; m.keyboard.keyGrid.visible
    if m.keyboard.keyGrid.visible = false
        m.button.text = "SHOW"
    else
        m.button.text = "HIDE"
    end if
end sub