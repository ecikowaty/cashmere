import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyleBase {
   id: root

   property color fontColor: lightBackground
                             ? Theme.onLightBackground.primary
                             : Theme.onDarkBackground.primary

   label: Label {
      fontStyle: FontStyles.button

      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter

      color: root.fontColor

      text: control.text

      onPaintedWidthChanged: root.textPaintedWidth = paintedWidth
   }

   background: Item {
      id: background

      implicitWidth: root.textPaintedWidth + root.horizontalMargins < 88 ? 88 : root.textPaintedWidth + root.horizontalMargins
      implicitHeight: 48

      Item {
          anchors.fill: parent
          clip: true

          Ripple {
              id: ripple
              anchors.centerIn: parent
              color: lightBackground ? Qt.rgba(1, 1, 1, 0.16) : Qt.rgba(0, 0, 0, 0.16)
          }

          Connections {
             target: control
             onClicked: ripple.start()
          }
      }

      states: [
         State {
            name: "normal"
            when: control.enabled
            PropertyChanges {

            }
         },
         State {
            name: "disabled"
            when: !control.enabled
            PropertyChanges {

            }
         }
      ]
   }
}

