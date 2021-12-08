function init()
    m.pinpad = m.top.findNode("thePinPad")
    m.pinpad.textEditBox.voiceEnabled = true

    m.pinpad.keyGrid.keyDefinitionUri="pkg:/data/DynamicPinKDF.json"

    keyboardPalette = createObject("roSGNode", "RSGPalette")
    keyboardPalette.colors = { "FocusColor": "0xFCCC12", "PrimaryTextColor": "0xFFFFFF", "SecondaryItemColor": "0xFFFFFF", "FocusItemColor": "0x000000", "KeyboardColor": "0x1B1B1B", "InputFieldColor":"0x000000" }
    m.pinpad.palette = keyboardPalette
    m.pinpad.textEditBox.voiceEntryType = "numeric"
    m.pinpad.textEditBox.voiceToolTipWidth = 200
    m.pinpad.textEditBox.flipVoiceToolTip = true
    ' channel is designed for HD coords
    m.screenWidth  = 1280
    m.screenHeight = 720

    centerKeyGrid()
end function

function centerKeyGrid()
    brect = m.pinpad.boundingRect()

    m.pinpad.translation = [(m.screenWidth-brect.width) / 2, (m.screenHeight-brect.height) / 2]
 end function