    sub init()
                ' channel is designed for FHD coords
        m.screenWidth  = 1280
        m.screenHeight = 720

        m.keyboard = m.top.findNode("theKeyboard")

        m.enteredText = m.top.findNode("enteredText")
    	m.keyboard.observeFieldScoped("text", "textChanged")

        m.keyboard.mode = "AddressLower"

        m.keyboard.textEditBox.voiceEnabled = true
        m.keyboard.textEditBox.flipVoiceToolTip = true

        m.keyboard.setFocus(true)
    end sub