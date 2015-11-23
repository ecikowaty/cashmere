import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Card {
   id: root

   state: "closed"
   enabled: state === "open"

   property int   widthBase: 56
   property real  widthMultiplier: 2.6
   property int   visibleItems: 5
   property var   items

   property string text: items[0]

   function open() {
      state = "open"
   }

   function close() {
      state = "closed"
   }

//   ListView {
//      id: listView
//      anchors.fill: parent
//      clip: true
//      model: items.length

//      delegate: Button {
//         width: parent.width
//         height: 48
//         text: items[index]
//         onClicked: root.text = items[index]
//         style: SingleLineListItemStyle {

//         }
//      }
//   }

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
            width: widthBase * widthMultiplier
            height: 0
            opacity: 0
         }
      }
   ]

   transitions: [
      Transition {
         to: "open"
         NumberAnimation {
            properties: "width,height"
            easing.type: Easing.OutCubic
            duration: 300
         }
         NumberAnimation {
            property: "opacity"
            duration: 300
         }
      },
      Transition {
         to: "closed"
         SequentialAnimation {
            NumberAnimation {
               property: "opacity"
               duration: 500
            }

            NumberAnimation {
               properties: "width,height"
               duration: 0
            }
         }
      }
   ]
}

