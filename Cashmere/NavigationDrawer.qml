import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

MouseArea {
   id: root

   x: xWhenHidden

   width: parent.width + grippingPaneSize
   height: parent.height

   property list<Action> actions

   property int grippingPaneSize: 32

   property int xWhenHidden: -width + horizontalPositionShift + grippingPaneSize

   property int horizontalPositionShift: 0
   Behavior on horizontalPositionShift {
      NumberAnimation {
         easing.type: Easing.OutQuart
      }
   }

   onHorizontalPositionShiftChanged: console.debug(horizontalPositionShift)

   onPressAndHold: {
      console.debug("hold")
      horizontalPositionShift = 48
   }

   onPressed: {
      console.debug("pressed")
      hideAnimation.running = false
      openAnimation.running = false
   }

   onReleased: {
      console.debug("released")
      horizontalPositionShift = 0
   }

   drag {
      target: root
      axis: Drag.XAxis
      minimumX: -root.width
      maximumX: 0
      filterChildren: true
   }

   propagateComposedEvents: true

   function show() {
      state = "visible"
      openAnimation.running = true
   }

   function hide() {
      state = "hidden"
      hideAnimation.running = true
   }

   VelocityCalculator {
      id: velocityCalculator

      observed: root.x
      measureWhen: pressed && drag.active

      onVelocityMeasured: {
         if (velocity > 300) {
            increasing ? show() : hide()
         }
         else {
            Math.abs(root.x) < root.width / 2 ? show() : hide()
         }
      }
   }

   Card {
      radius: 0
      elevation: 16

      anchors.fill: parent
      anchors.rightMargin: grippingPaneSize + 32

      ListView {
         id: actionList
         anchors.fill: parent
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

   NumberAnimation {
      id: hideAnimation
      target: root
      property: "x"
      to: xWhenHidden
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

