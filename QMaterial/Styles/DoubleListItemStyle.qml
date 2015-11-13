import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."
import "."

ButtonStyleBase {
   id: root

   property string primaryText
   property string secondaryText

   label: Item {}

   background: Rectangle {
      id: background

      Behavior on color { ColorAnimation { duration: 100 } }

      Item {
         anchors.fill: parent
         anchors.margins: 16

         Label {
            id: primaryLabel

            fontStyle: FontStyles.subheading
            text: root.primaryText
         }

         Label {
            id: secondaryLabel
            anchors.bottom: parent.bottom

            fontStyle: FontStyles.body1
            color: Theme.secondaryText
            text: root.secondaryText
         }
      }

      states: [
         State {
            name: "normal"
            when: !control.hovered && !control.pressed && control.enabled
            PropertyChanges {
               target: background
               color: Qt.rgba(0, 0, 0, 0)
            }
         },
         State {
            name: "hover"
            when: control.hovered && !control.pressed && control.enabled
            PropertyChanges {
               target: background
               color: alphaOf(supportingColor, 0.2)
            }
         },
         State {
            name: "pressed"
            when: control.pressed && control.enabled
            PropertyChanges {
               target: background
               color: alphaOf(supportingColor, 0.4)
            }
         }
      ]
   }
}

