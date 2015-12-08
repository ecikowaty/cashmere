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
   property alias currentIndex: listView.currentIndex

   property string text: items[currentIndex]

   function open() {
      state = "open"
   }

   function close() {
      state = "closed"
   }

   anchors {
      top: parent.top
      topMargin: {

      }

      left: parent.left; leftMargin: -16
   }

   ListView {
      id: listView
      anchors.fill: parent
      clip: true
      model: items.length

      delegate: Button {
         width: parent.width
         height: 48
         text: items[index]
         opacity: root.state === "open"

         onClicked: root.text = items[index]

         style: SingleLineListItemStyle {

         }

         Behavior on opacity {
            SequentialAnimation {
               PauseAnimation {
                  duration: opacity ? 0 : 100 * index + 300
               }

               NumberAnimation {
                  duration: opacity ? 100 : 300
               }
            }
         }
      }
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
            easing.type: Easing.OutQuart
            duration: 300
         }
         NumberAnimation {
            property: "opacity"
            duration: 200
         }
      },
      Transition {
         to: "closed"
         SequentialAnimation {
            NumberAnimation {
               property: "opacity"
               duration: 200
            }

            NumberAnimation {
               properties: "width,height"
               duration: 0
            }
         }
      }
   ]
}

