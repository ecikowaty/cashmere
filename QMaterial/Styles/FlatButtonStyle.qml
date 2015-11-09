import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
   id: root

   property string state: "normal"
   property MouseArea touchArea
   property color supportingColor: "#999999"

   function alphaOf(color, alpha) {
      return Qt.rgba(color.r, color.g, color.b, alpha)
   }

   background: Rectangle {
      id: background

      Behavior on color { ColorAnimation { duration: 100 } }

      states: [
         State {
            name: "normal"
            when: !touchArea.containsMouse && !touchArea.pressed
            PropertyChanges {
               target: background
               color: Qt.rgba(0, 0, 0, 0)
            }
         },
         State {
            name: "hover"
            when: touchArea.containsMouse && !touchArea.pressed
            PropertyChanges {
               target: background
               color: alphaOf(supportingColor, 0.2)
            }
         },
         State {
            name: "pressed"
            when: touchArea.pressed
            PropertyChanges {
               target: background
               color: alphaOf(supportingColor, 0.4)
            }
         }
      ]
   }
}

