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
         replaceFloatingButton(pageStack.currentItem.floatingButton)
      }
   }

   function replaceFloatingButton(button) {
      floatingButtonLoader.replace(button)
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

   Loader {
      id: floatingButtonLoader
      anchors {
         right: parent.right; rightMargin: 24
         bottom: parent.bottom; bottomMargin: 24
      }

      property var newButton

      function switchButton() {
         sourceComponent = newButton
         newButton = null
      }

      function replace(button) {
         if (sourceComponent) {
            buttonScaleOut.running = true
            newButton = button
         }
         else {
            sourceComponent = button
            buttonScaleIn.running = true
         }
      }

      // todo: add a small rotation animation
      NumberAnimation {
         id: buttonScaleOut
         property: "scale"
         target: floatingButtonLoader
         from: 1
         to: 0
         duration: target ? 200 : 0
         easing.type: Easing.OutCubic

         onStopped: {
            floatingButtonLoader.switchButton()
            buttonScaleIn.running = true
         }
      }

      NumberAnimation {
         id: buttonScaleIn
         property: "scale"
         target: floatingButtonLoader
         from: 0
         to: 1
         duration: 200
         easing.type: Easing.OutCubic
      }
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
