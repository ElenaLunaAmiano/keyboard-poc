sub Main()
    showMarkupSGScreen()
end sub

sub showMarkupSGScreen()
    print "in showMarkupSGScreen"
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("KeyboardTestScene")
    scene.backgroundColor="0x000000FF"
    scene.backgroundUri = ""
    screen.show()

    while(true)
        msg = wait(0, m.port)
	msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub
