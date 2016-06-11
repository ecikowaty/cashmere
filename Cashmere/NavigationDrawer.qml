import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Card {
   id: root

   x: xWhenHidden

   width: parent.width - grippingPaneSize
   height: parent.height

   radius: 0
   elevation: 16

   anchors.bottom: parent.bottom

   property alias content: contentLoader.sourceComponent

   property int grippingPaneSize: 32

   property int xWhenHidden: -width + horizontalPositionShift - grippingPaneSize

   property int horizontalPositionShift: 0
   Behavior on horizontalPositionShift {
      NumberAnimation {
         easing.type: Easing.OutQuart
      }
   }

   function isOpen() {
      return state === "open"
   }

   function open() {
      state = "open"
      openAnimation.running = true
   }

   function close() {
      state = "closed"
      hideAnimation.running = true
   }

   MouseArea {
      id: mouseArea

      width: parent.width + grippingPaneSize * 2
      height: parent.height - 56

      anchors.bottom: parent.bottom

      onPressAndHold: horizontalPositionShift = 48

      onClicked: {
         // just consume the event
      }

      onPressed: {
         hideAnimation.running = false
         openAnimation.running = false
      }

      onReleased: horizontalPositionShift = 0

      drag {
         target: root
         axis: Drag.XAxis
         minimumX: -root.width
         maximumX: 0
         filterChildren: true
      }

      propagateComposedEvents: true

      VelocityCalculator {
         id: velocityCalculator

         observed: root.x
         measureWhen: parent.pressed && parent.drag.active

         onVelocityMeasured: {
            if (velocity > 300) {
               increasing ? open() : close()
            }
            else {
               Math.abs(root.x) < root.width / 2 ? open() : close()
            }
         }
      }

      Loader {
         id: contentLoader

         width: root.width
         height: root.height

         anchors.top: parent.top
         anchors.topMargin: -56
      }
   }

   Rectangle {
      id: drawerOverlay

      width: parent.width * 2
      height: parent.height

      anchors.left: parent.right

      color: Qt.rgba(0, 0, 0, 0.4)
      opacity: 1 - (Math.abs(navigationDrawer.x) / navigationDrawer.width)
   }

   NumberAnimation {
      id: hideAnimation
      target: root
      property: "x"
      to: xWhenHidden
      duration: 500
      easing.type: Easing.OutCubic
   }

   NumberAnimation {
      id: openAnimation
      target: root
      property: "x"
      to: 0
      duration: 500
      easing.type: Easing.OutCubic
   }
}
