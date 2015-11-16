import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."
import "."

ButtonStyleBase {
   id: root

   property Component icon

   label: Item {

   }

   background: Rectangle {
      id: background

      Item {
         anchors.fill: parent

         Loader {
            id: iconLoader
            width: 24
            height: 24

            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.verticalCenter: parent.verticalCenter

            sourceComponent: root.icon
         }

         Label {
            anchors.left: root.icon ? iconLoader.right : parent.left
            anchors.leftMargin: root.icon ? 32 : 16
            anchors.verticalCenter: parent.verticalCenter

            fontStyle: FontStyles.subheading
            text: control.text
         }
      }

      Behavior on color { ColorAnimation { duration: 100 } }

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

