import QtQuick 2.5

Rectangle {
   id: root

   property int expandedSize: parent.width > parent.height ? parent.width : parent.height
   property alias running: clickAnimation.running

   function start() {
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
         duration: 200
      }

      NumberAnimation {
         target: root
         property: "opacity"
         to: 0
         duration: 300
      }

      onStopped: {
         root.width = 0
         root.opacity = 1
      }
   }
}
