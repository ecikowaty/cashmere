import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."
import "."

ButtonStyleBase {
   id: root

   property bool iconDefined: control.action && control.action.iconName

   property Component icon: Icon {
      name: control.action.iconName
      color: Theme.secondaryText
   }

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

            sourceComponent: root.iconDefined ? root.icon : undefined
         }

         Label {
            anchors.left: root.iconDefined ? iconLoader.right : parent.left
            anchors.leftMargin: root.iconDefined ? 32 : 16
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

