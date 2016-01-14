import QtQuick 2.5
import "."

// todo: error + disabled
TextInput {
   id: root

   width: 200
   height: 48

   property alias placeholderText: placeholderLabel.text
   property alias placeholderTextColor: placeholderLabel.color

   Label {
      id: placeholderLabel

      fontStyle: FontStyles.subheading
      color: Theme.onLightBackground.secondary

      opacity: root.text.length === 0
      Behavior on opacity { NumberAnimation { duration: 100 } }

      anchors.verticalCenter: parent.verticalCenter
   }

   Divider {
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 8

      height: root.activeFocus ? 2 : 1
      Behavior on height { NumberAnimation { duration: 100 } }

      color: root.activeFocus ? Theme.primaryColor : Theme.onLightBackground.dividers
   }

   font {
      family: "Roboto"
      pixelSize: FontStyles.subheading.size
      weight: FontStyles.subheading.weight
   }

   verticalAlignment: TextInput.AlignVCenter

   cursorDelegate: Rectangle {
      width: 1
      height: root.font.pixelSize
      color: Theme.primaryColor
      visible: root.activeFocus

      Behavior on opacity { NumberAnimation { duration: 150 } }

      Timer {
         interval: 500
         repeat: true
         running: root.activeFocus
         onRunningChanged: parent.opacity = running

         onTriggered: parent.opacity = !parent.opacity
      }
   }

   color: Theme.onLightBackground.primary
   selectionColor: Theme.primaryColor
}

