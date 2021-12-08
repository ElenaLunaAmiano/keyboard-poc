function init()
    m.kb = m.top.findNode("theKeyboard")
    m.kb.textEditBox.hintText = "Enter Search Query"
    m.kb.textEditBox.voiceEnabled = true

    ' channel is designed for FHD coords
    m.screenWidth  = 1920
    m.screenHeight = 1080

    centerKeyGrid()
end function

function centerKeyGrid()
    brect = m.kb.boundingRect()

    m.kb.translation = [(m.screenWidth-brect.width) / 2, (m.screenHeight-brect.height) / 2]
 end function