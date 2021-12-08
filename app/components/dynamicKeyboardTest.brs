function init()
    m.keyboard = m.top.findNode("theKeyboard")
    m.keyboard.domain = "email"
m.keyboard.textEditBox.voiceEnabled = true

    ' channel is designed for HD coords
    m.screenWidth  = 1280
    m.screenHeight = 720

    centerKeyGrid()
end function

function centerKeyGrid()
    brect = m.keyboard.boundingRect()
    m.keyboard.translation = [(m.screenWidth-brect.width) / 2, (m.screenHeight-brect.height) / 2]
 end function