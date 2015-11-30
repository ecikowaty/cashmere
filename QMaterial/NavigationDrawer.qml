import QtQuick 2.5
import "."

Card {
   id: root

   x: -width - 16

   width: parent.width - 56
   height: parent.height

   elevation: 16

//   opacity: x > -width || dragArea.pressed
//   Behavior on opacity { NumberAnimation { duration: 200 } }

   function show() {
      openAnimation.running = true
   }

   function hide() {
      hideAnimation.running = true
   }

   MouseArea {
      id: dragArea

      property int dragStartingX: 0
      property double dragStartTime: -1

      anchors.fill: parent
      anchors.rightMargin: -32

      drag {
         target: parent
         axis: Drag.XAxis
         minimumX: -root.width
         maximumX: -16
      }

      VelocityCalculator {
         id: velocityCalculator

         observed: root.x
         measureWhen: dragArea.pressed

         onVelocityMeasured: {
            if (velocity > 300) {
               increasing ? openAnimation.running = true : hideAnimation.running = true
            }
            else {
               Math.abs(root.x) < root.width / 2 ? openAnimation.running = true : hideAnimation.running = true
            }
         }
      }

      onPressed: {
         hideAnimation.running = false
         openAnimation.running = false
      }
   }

   NumberAnimation {
      id: hideAnimation
      target: root
      property: "x"
      to: -width - 16
      duration: 400
      easing.type: Easing.OutCubic
   }

   NumberAnimation {
      id: openAnimation
      target: root
      property: "x"
      to: 0
      duration: 400
      easing.type: Easing.OutCubic
   }
}

