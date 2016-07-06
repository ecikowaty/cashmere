import QtQuick 2.5
import QtQuick.Controls 1.4

import "."
import "Styles"

Rectangle {
   id: root

   property var callbackAction

   function show(text, buttonText, timeout, callback) {
      callbackAction = callback

      label.text = text
//      button.action.text = buttonText
      button.text = "dupa2"

      closeTimer.interval = timeout
      closeTimer.start()

      root.anchors.topMargin = -48
   }

   width: parent.width
   height: 48

   anchors.top: parent.bottom
   Behavior on anchors.topMargin {
      NumberAnimation {
         duration: 500; easing.type: Easing.OutQuart
      }
   }

   color: "#323232"

   radius: 2

   Timer {
      id: closeTimer
      interval: 3000
      onTriggered: root.anchors.topMargin = 0
   }

   Label {
      id: label

      anchors {
         left: parent.left; leftMargin: 24
         verticalCenter: parent.verticalCenter
      }

      color: Theme.onDarkBackground.primary
   }

   Button {
      id: button

      action: Action {
         onTriggered: callbackAction()
      }

//      text: "Dupa"
      anchors {
         right: parent.right; rightMargin: 24
         verticalCenter: parent.verticalCenter
      }

      style: FlatButtonStyle {
         lightBackground: false
         fontColor: Colors.amber.regular[5]
      }
   }
}
