import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyleBase {
   id: root

   property color textColor: "white"

   label: Label {
      fontStyle: FontStyles.button

      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter

      color: control.enabled ? textColor : Qt.rgba(0, 0, 0, 0.26)
      text: control.text

      onPaintedWidthChanged: root.textPaintedWidth = paintedWidth
   }

   background: Card {
      id: card

      state: "normal"

      implicitWidth: root.textPaintedWidth + root.horizontalMargins < 88 ? 88 : root.textPaintedWidth + root.horizontalMargins
      implicitHeight: 36

      Behavior on color { ColorAnimation { duration: 100 } }

      Item {
          anchors.fill: parent
          clip: true

          Ripple {
              id: ripple
              anchors.centerIn: parent
              color: root.lightBackground ? Qt.rgba(1, 1, 1, 0.16) : Qt.rgba(0, 0, 0, 0.16)
          }

          Connections {
             target: control
             onClicked: ripple.start()
          }
      }

      states: [
         State {
            name: "normal"
            when: !control.hovered && !control.pressed && control.enabled
            PropertyChanges {
               target: card
               color: root.color.regular[colorIndex]
            }
         },
         State {
            name: "hover"
            when: control.hovered && !control.pressed && control.enabled
            PropertyChanges {
               target: card
               color: root.color.regular[colorIndex + 1]
            }
         },
         State {
            name: "pressed"
            when: control.pressed && control.enabled
            PropertyChanges {
               target: card
               color: root.color.regular[colorIndex + 2]
            }
         },
         State {
            name: "disabled"
            when: !control.enabled
            PropertyChanges {
               target: card
               color: Qt.rgba(0, 0, 0, 0.12)
            }
         }
      ]
   }
}

