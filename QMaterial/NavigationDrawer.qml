import QtQuick 2.5
import "."

Card {
   id: root

   x: -width - 16

//   state: "hidden"

   width: parent.width - 56
   height: parent.height

   elevation: 16

//   opacity: x > -width || dragArea.pressed
//   Behavior on opacity { NumberAnimation { duration: 200 } }

   function show() {
      state = "visible"
      openAnimation.running = true
   }

   function hide() {
      state = "hidden"
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
               increasing ? show() : hide()
            }
            else {
               Math.abs(root.x) < root.width / 2 ? show() : hide()
            }
         }
      }

      onPressed: {
         hideAnimation.running = false
         openAnimation.running = false
      }
   }

   Rectangle {
      id: drawerOverlay

      width: parent.width * 2
      height: parent.height * 2

      anchors.left: parent.right

      color: Qt.rgba(0, 0, 0, 0.4)
      opacity: 1 - (Math.abs(navigationDrawer.x) / navigationDrawer.width)

      MouseArea {
         anchors.fill: parent
         onClicked: root.hide()
         enabled: root.state === "visible"
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

