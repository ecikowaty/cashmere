import QtQuick 2.5

Rectangle {
   id: root

   state: "normal"

   property bool hovered
   property bool pressed
   property color supportingColor: "#999"

   function alphaOf(color, alpha) {
      return Qt.rgba(color.r, color.g, color.b, alpha)
   }

   Behavior on color { ColorAnimation { duration: 100 } }

   states: [
      State {
         name: ""
         PropertyChanges {
            target: root
            color: Qt.rgba(0, 0, 0, 0)
         }
      },
      State {
         name: "normal"
         when: !hovered && !pressed && enabled
         PropertyChanges {
            target: root
            color: Qt.rgba(0, 0, 0, 0)
         }
      },
      State {
         name: "hover"
         when: hovered && !pressed && enabled
         PropertyChanges {
            target: root
            color: alphaOf(supportingColor, 0.2)
         }
      },
      State {
         name: "pressed"
         when: pressed && enabled
         PropertyChanges {
            target: root
            color: alphaOf(supportingColor, 0.4)
         }
      }
   ]
}
