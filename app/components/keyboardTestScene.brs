sub addListItem(label as string, component as string)
    testListItem = m.testListContent.createChild("ContentNode")
    testListItem.TITLE = label

    m.testComponents.Push(component)
 end sub

 sub listItemSelected()
   print "in listItemSelected"; m.list
   selectedItem = m.list.itemSelected
   print "-- selected item "; selectedItem

   if (selectedItem >= 0) and (selectedItem < m.testListContent.GetChildCount())
       selectedComponent = m.testComponents.GetEntry(selectedItem)
   print "SelectedComponent is "; selectedComponent

       m.list.visible = false

   m.CurrentTest = CreateObject("RoSGNode", selectedComponent)
   m.CurrentTest.id = "CURRENT_TEST"
   m.top.AppendChild(m.CurrentTest)

       m.CurrentTest.SetFocus(true)
   end if
 end sub

 function onKeyEvent(key as String, press as Boolean) as Boolean
    '  print "in testList.xml onKeyEvent ";key;" "; press
     if press then
        if key = "back"
            if not (m.CurrentTest = invalid)
                print "CLEANING UP m.CURRENTTEST"
                m.top.RemoveChild(m.CurrentTest)
                m.CurrentTest = invalid

                m.list.visible = true
                m.list.SetFocus(true)
                return true
            end if
        end if
     end if
     return false
 end function

 sub init()
    ' create the content for the list
    m.top.backgroundColor = "0x000000"

    m.testListContent = createObject("RoSGNode", "ContentNode")

    m.tracker=m.top.createChild("TrackerTask")

    ' NOTE: The component name to load for each list item
    ' is kept in a parallel roArray for now
    m.testComponents = createObject("RoArray", 4, true)

    addListItem("DynamicKeyboard Test",     "DynamicKeyboardTest")
    addListItem("DynamicPinPad Test",       "DynamicPinPadTest")
    addListItem("DynamicMiniKeyboard Test", "DynamicMiniKeyboardTest")
    addListItem("Custom Address Keyboard Test", "CustomAddressKeyboardTest")
    addListItem("Custom Search Keyboard Test", "CustomSearchKeyboardTest")

    print "TestComponents"; m.testComponents

    m.list = m.top.FindNode("TestListContent")
    m.list.content = m.testListContent

    m.list.ObserveField("itemSelected", "listItemSelected")

    ' set focus on the Scene (which will set focus on the initialFocus node)
    m.top.setFocus(true)
 end sub