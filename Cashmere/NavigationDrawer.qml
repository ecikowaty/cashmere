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

   property list<Action> actions

   property int grippingPaneSize: 32

   property int xWhenHidden: -width + horizontalPositionShift - grippingPaneSize

   property int horizontalPositionShift: 0
   Behavior on horizontalPositionShift {
      NumberAnimation {
         easing.type: Easing.OutQuart
      }
   }

   onHorizontalPositionShiftChanged: console.debug(horizontalPositionShift)

   function show() {
      state = "visible"
      openAnimation.running = true
   }

   function hide() {
      state = "hidden"
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
               increasing ? show() : hide()
            }
            else {
               Math.abs(root.x) < root.width / 2 ? show() : hide()
            }
         }
      }

      ListView {
         id: actionList

         width: root.width
         height: root.height

         anchors.top: parent.top
         anchors.topMargin: -56

         enabled: actions.length > 0

         model: actions.length

         delegate: Button {
            width: parent.width
            height: 48

            action: root.actions[index]
            style: SingleLineListItemStyle {

            }
         }
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
