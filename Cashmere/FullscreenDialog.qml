import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Page {
   id: root

   width: parent.width
   height: parent.height

   state: "hidden"

   Behavior on y {
      NumberAnimation {
         properties: "y"
         duration: 750
         easing.type: Easing.OutQuart
      }
   }

   function open() {
      overlay.bind(true)
      state = "visible"
   }

   function close() {
      state = "hidden"
   }

   function toggle() {
      state = (state === "hidden") ? "visible" : "hidden"
   }

   actionBar {
      title: "Fullscreen"
      actions: [
         Action {
            text: "Save"
            iconName: "save"
         }
      ]

      onBackPressed: root.close()
   }

   Rectangle {
      width: parent.width
      height: parent.height

      anchors.bottom: parent.top

      color: "black"

      opacity: 0.5 - root.y / root.height
   }

   states: [
      State {
         name: "hidden"
         PropertyChanges {
            target: root
            y: root.height
         }
      },
      State {
         name: "visible"
         PropertyChanges {
            target: root
            y: 0
         }
      }
   ]
}
