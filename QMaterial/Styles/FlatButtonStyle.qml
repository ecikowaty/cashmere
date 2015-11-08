import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
   id: root

   property string state: "normal"
   property MouseArea touchArea
   property color supportingColor: "#999999"

   background: Rectangle {
      id: card

      states: [
         State {
            name: "normal"
            when: !touchArea.containsMouse && !touchArea.pressed
            PropertyChanges {
               target: card
               color: Qt.rgba(0, 0, 0, 0)
            }
         },
         State {
            name: "hover"
            when: touchArea.containsMouse && !touchArea.pressed
            PropertyChanges {
               target: card
               color: baseColor.regular[colorIndex + 1]
            }
         },
         State {
            name: "pressed"
            when: touchArea.pressed
            PropertyChanges {
               target: card
               color: baseColor.regular[colorIndex + 2]
            }
         }
      ]
   }
}

