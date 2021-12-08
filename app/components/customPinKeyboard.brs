sub init()
    m.modes = [ "Pin" ]

    m.top.keyGrid.keyDefinitionUri="pkg:/data/CustomPinKDF.json"

' TODO: Get a background image from UX and palette colors to demonstrate how to customize keyboard colors
  keyboardPalette = createObject("roSGNode", "RSGPalette")
   keyboardPalette.colors = { "FocusColor": "0xFCCC12", "PrimaryTextColor": "0xFFFFFF", "SecondaryItemColor": "0xFFFFFF", "FocusItemColor": "0x000000", "KeyboardColor": "0x1B1B1B", "InputFieldColor":"0x000000" }
   m.top.palette = keyboardPalette
end sub

sub modeChanged()
    updateMode(m.top.mode)
end sub

sub updateMode(mode as String)
    print "-- updateMode mode "; mode
    print "-- updateMode m.top.keyGrid.mode "; m.top.keyGrid.mode
    m.currMode = mode
    if m.currMode <> m.top.keyGrid.mode
        m.top.keyGrid.mode = m.currMode
    end if
end sub

function keySelected(key as string) as boolean
     ? "KEY SELECTED: "; key
     print "in keySelected";
     print "-- selected key "; key
    handled = false

    return handled
 end function