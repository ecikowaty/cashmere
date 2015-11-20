import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Card {
   id: root

   state: "closed"

   property int widthBase: 56
   property int widthMultiplier: 3
   property int visibleItems: 5

   function open() {
      state = "open"
   }

   function close() {
      state = "closed"
   }

   states: [
      State {
         name: "open"
         PropertyChanges {
            target: root
            width: widthBase * widthMultiplier
            height: visibleItems * 48
            opacity: 1
         }
      },
      State {
         name: "closed"
         PropertyChanges {
            target: root
            width: root.parent.width
            height: root.parent.height
            opacity: 0
         }
      }
   ]

   transitions: [
      Transition {
         to: "open"
         NumberAnimation {
            properties: "width,height"
            easing.type: Easing.OutQuint
            duration: 300
         }
         NumberAnimation {
            property: "opacity"
            duration: 0
         }
      },
      Transition {
         to: "closed"
         SequentialAnimation {
            NumberAnimation {
               property: "opacity"
            }

            NumberAnimation {
               properties: "width,height"
               duration: 0
            }
         }
      }
   ]
}

