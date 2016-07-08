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
      buttonLabel.text = buttonText

      closeTimer.interval = timeout
      closeTimer.start()

      root.anchors.topMargin = -root.height
   }

   function stopTimer() {
      closeTimer.stop()
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
         onTriggered: {
            callbackAction()
            root.anchors.topMargin = 0
         }
      }

      anchors {
         right: parent.right; rightMargin: 24
         verticalCenter: parent.verticalCenter
      }

      Label {
         id: buttonLabel
         fontStyle: FontStyles.button
         anchors.fill: parent

         verticalAlignment: Text.AlignVCenter
         horizontalAlignment: Text.AlignHCenter
         color: Colors.amber.regular[5]
      }

      style: FlatButtonStyle {
         lightBackground: false
      }
   }

}
