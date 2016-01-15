import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."

RadioButtonStyle {
   id: root
   spacing: 24

   property int leftMargin: 16

   background: ListItem {
      control: root.control
   }

   label: Label {
      anchors {
         left: parent.left
         leftMargin: root.leftMargin
      }

      text: control.text
      fontStyle: FontStyles.subheading
   }

   indicator: Icon {
      anchors {
         left: parent.left
         leftMargin: root.leftMargin
      }

      implicitWidth: 24
      implicitHeight: 24

      name: "radio_button_unchecked"
      color: Theme.onLightBackground.secondary

      Icon {
         opacity: control.checked
         Behavior on opacity { NumberAnimation { duration: 100 } }

         name: "radio_button_checked"
         color: Theme.primaryColor
      }
   }
}

