import QtQuick 2.5
import QtQuick.Controls 1.4
import "Styles"
import "."

Card {
   id: root

   z: overlay.z + 1

   state: "closed"

   readonly property int   widthFactor: 56
   property double         multiplier: 2.0

   property int            visibleLimit: 3
   property int            itemHeight: 48
   property int            verticalMargins: 16
   property list<Action>   actions

   function open() {
      overlayBinder.bind(false)
      root.state = "open"
   }

   function close() {
      root.state = "closed"
   }

   function isOpen() {
      return root.state === "open"
   }

   OverlayBinder {
      id: overlayBinder
      onClicked: root.close()
      enableWhen: isOpen()
   }

   ListView {
      id: listView

      header: Item { height: 8 }
      footer: Item { height: 8 }

      interactive: visibleLimit < actions.length

      property int targetHeight: 0

      anchors.fill: parent

      model: actions.length
      clip: true

      delegate: Button {
         width: parent.width
         height: root.itemHeight
         action: actions[index]
         onClicked: root.close()
         style: SingleLineListItemStyle {

         }
      }
   }


   states: [
      State {
         name: "closed"
         PropertyChanges {
            target: root
            width: 0
            height: 0
            opacity: 0
         }
      },
      State {
         name: "open"
         PropertyChanges {
            target: root
            width: multiplier * widthFactor
            height: (actions.length > visibleLimit ? visibleLimit : actions.length) * itemHeight + verticalMargins
            opacity: 1
         }
      }
   ]

   transitions: [
      Transition {
         from: "closed"
         to: "open"

         NumberAnimation {
            target: root
            properties: "width,height"
            duration: 200
            easing.type: Easing.OutQuad
         }
      },
      Transition {
         from: "open"
         to: "closed"

         SequentialAnimation {

            NumberAnimation {
               target: root
               property: "opacity"
               duration: 200
            }
            NumberAnimation {
               target: root
               properties: "width,height"
               duration: 0
            }
         }
      }
   ]
}

