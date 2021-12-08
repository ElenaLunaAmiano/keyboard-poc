sub init()
    ' channel is designed for FHD coords
    m.screenWidth  = 1280
    m.screenHeight = 720

    m.keyboard = m.top.findNode("theKeyboard")

    m.enteredText = m.top.findNode("enteredText")
    m.keyboard.observeFieldScoped("text", "textChanged")

    m.keyboard.mode = "Pin"

    m.keyboard.textEditBox.voiceEnabled = true
    ' m.keyboard.textEditBox.flipVoiceToolTip = true
    centerKeyGrid()

    m.keyboard.setFocus(true)
end sub

function centerKeyGrid()
    brect = m.keyboard.boundingRect()
    m.keyboard.translation = [(m.screenWidth-brect.width) / 2, (m.screenHeight-brect.height) / 2]
 end function