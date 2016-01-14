import QtQuick 2.5

Rectangle {
   id: root

   property int   expandedSize: parent.width > parent.height ? parent.width : parent.height
   property alias running: clickAnimation.running
   property int   duration: 500

   function start(mouse) {
//      root.x = mouse ? mouse.x : root.width / 2
//      root.y = mouse ? mouse.y : root.height / 2
      clickAnimation.running = false
      clickAnimation.running = true
   }

   width: 0
   height: width
   radius: width / 2

   SequentialAnimation {
      id: clickAnimation

      NumberAnimation {
         target: root
         property: "width"
         to: expandedSize
         duration: root.duration * 3/5
         easing.type: Easing.OutQuart
      }

      NumberAnimation {
         target: root
         property: "opacity"
         to: 0
         duration: root.duration * 2/5
      }

      onStopped: {
         root.width = 0
         root.opacity = 1
      }
   }
}
