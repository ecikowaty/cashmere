import QtQuick 2.5

Rectangle {
   id: root

   property bool hovered
   property bool pressed

   Behavior on color { ColorAnimation { duration: 100 } }

   states: [
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
