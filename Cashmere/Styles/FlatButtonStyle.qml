import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyleBase {
   id: root

   property color fontColor: light ? "white" : color.regular[5]

   label: Label {
      fontStyle: FontStyles.button

      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter

      color: control.enabled ? fontColor : Qt.rgba(0, 0, 0, 0.26)

      text: control.text

      onPaintedWidthChanged: root.textPaintedWidth = paintedWidth
   }

   background: Rectangle {
      id: background

      implicitWidth: root.textPaintedWidth + root.horizontalMargins < 64 ? 64 : root.textPaintedWidth + root.horizontalMargins
      implicitHeight: 36

      Behavior on color { ColorAnimation { duration: 100 } }

      Item {
          anchors.fill: parent
          clip: true

          Ripple {
              id: ripple
              anchors.centerIn: parent
              color: light ? Qt.rgba(1, 1, 1, 0.16) : Qt.rgba(0, 0, 0, 0.16)
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

