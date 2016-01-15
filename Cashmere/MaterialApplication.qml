import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

ApplicationWindow {
   id: app

   visible: true

   width: 480
   height: 800

   x: 470
   y: 80

   color: "#fafafa"

   property alias initialView: pageStack.initialItem
   property alias navigationDrawer: navigationDrawer
   property alias overlay: overlay

   function isInitialPage(page) {
      return pageStack.initialItem === page
   }

   function stackDepth() {
      return pageStack.depth
   }

   function pushPage(page) {
      pageStack.push(page)
   }

   function popPage() {
      if (pageStack.depth > 1) {
         pageStack.pop()
      }
   }

   FocusScope {
      id: focusScope
      anchors.fill: parent

      MouseArea {
         anchors.fill: parent
         onClicked: forceActiveFocus()
      }
   }

   PageStack {
      id: pageStack
      anchors.fill: parent
   }

   NavigationDrawer {
      id: navigationDrawer
      actions: [
         Action {
            text: "Dialog"
            onTriggered: console.debug(text)
         },
         Action {
            text: "Textfield"
            onTriggered: console.debug(text)
         },
         Action {
            text: "Tabs"
            onTriggered: console.debug(text)
         },
         Action {
            text: "Lists"
            onTriggered: console.debug(text)
         }
      ]
   }

   Overlay {
      id: overlay
      anchors.fill: parent
   }
}
