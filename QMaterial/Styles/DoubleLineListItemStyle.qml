import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."
import "."

ButtonStyleBase {
   id: root

   property string primaryText
   property string secondaryText

   property Component icon

   label: Item {

   }

   background: Rectangle {
      id: background

      Behavior on color { ColorAnimation { duration: 100 } }


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

         Item {
            width: Math.max(primaryLabel.paintedWidth, secondaryLabel.paintedWidth)
            height: primaryLabel.paintedHeight + secondaryLabel.paintedHeight

            anchors {
               left: root.icon ? iconLoader.right : parent.left
               leftMargin: root.icon ? 32 : 16
               verticalCenter: parent.verticalCenter
            }

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

