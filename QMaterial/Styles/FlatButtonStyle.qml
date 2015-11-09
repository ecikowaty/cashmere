import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyleBase {
   id: root

   function alphaOf(color, alpha) {
      return Qt.rgba(color.r, color.g, color.b, alpha)
   }

   property color supportingColor: "#999999"

   label: Label {
      style: FontStyles.button

      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter

      color: control.enabled ? root.color.regular[root.colorIndex] : Qt.rgba(0, 0, 0, 0.26)
      text: control.text

      onPaintedWidthChanged: root.textPaintedWidth = paintedWidth
   }

   background: Rectangle {
      id: background

      implicitWidth: root.textPaintedWidth < 88 ? 88 : root.textPaintedWidth + 32
      implicitHeight: 36

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
         },
         State {
            name: "disabled"
            when: !control.enabled
            PropertyChanges {
               target: background
               color: alphaOf(supportingColor, 0)
            }
         }
      ]
   }
}

