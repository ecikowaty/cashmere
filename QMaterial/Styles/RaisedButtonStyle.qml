import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyleBase {
   id: root

   label: Label {
      style: FontStyles.button

      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter

      color: control.enabled ? "white" : Qt.rgba(0, 0, 0, 0.26)
      text: control.text

      onPaintedWidthChanged: root.textPaintedWidth = paintedWidth
   }

   background: Card {
      id: card

      state: "normal"

      implicitWidth: root.textPaintedWidth < 88 ? 88 : root.textPaintedWidth + 32
      implicitHeight: 36

      color: root.color.regular[colorIndex]
      Behavior on color { ColorAnimation { duration: 100 } }

      Item {
          anchors.fill: parent
          clip: true

          Ripple {
              id: ripple
              anchors.centerIn: parent
              color: Qt.rgba(0, 0, 0, 0.16)
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

