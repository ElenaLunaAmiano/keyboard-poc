sub init()
    ' channel is designed for FHD coords
m.screenWidth  = 1280
m.screenHeight = 720



m.button = m.top.findNode("buttonMode")
m.button.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"
m.button.setFocus(true)

m.keyboard = m.top.findNode("theKeyboard")

m.enteredText = m.top.findNode("enteredText")
m.keyboard.observeFieldScoped("text", "textChanged")

m.keyboard.mode = "AddressLower"

m.keyboard.textEditBox.voiceEnabled = true
m.keyboard.textEditBox.flipVoiceToolTip = true

' m.line.uri = "pkg:/images/pixel/pixel_white.png"
' m.line.width = 400
' m.cursor.uri = "pkg:/images/pixel/pixel_white.png"

m.keyboard.setFocus(true)

' m.keyboard.textEditBox
m.keyboard.keyGrid.visible = false

end sub