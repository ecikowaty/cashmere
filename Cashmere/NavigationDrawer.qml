import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Card {
   id: root

   x: -width - 16

   width: parent.width - 56
   height: parent.height
   radius: 0

   elevation: 16

   property list<Action> actions

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

      anchors.fill: parent
      anchors.rightMargin: -32

      drag {
         target: root
         axis: Drag.XAxis
         minimumX: -root.width
         maximumX: 0
         filterChildren: true
      }

      ListView {
         id: actionList
         anchors.fill: parent
         enabled: actions.length > 0

         model: actions.length

         delegate: Button {
            width: parent.width
            height: 48

            onPressedChanged: console.debug("pressed")

            action: root.actions[index]
            style: SingleLineListItemStyle {

            }
         }
      }

      propagateComposedEvents: true

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
         console.debug("drag")
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

