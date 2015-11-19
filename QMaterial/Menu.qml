import QtQuick 2.5
import QtQuick.Controls 1.4
import "Styles"
import "."

Card {
   id: root

   z: overlay.z + 1

   state: "hidden"

   readonly property int   widthFactor: 56
   property double         multiplier: 2.0

   property int            visibleLimit: 3
   property int            itemHeight: 48
   property int            verticalMargins: 16
   property list<Action>   actions
   property Item           oldParent
   property alias          currentItemIndex: listView.currentIndex

   function open() {
      overlay.mapPlaceholderTo(oldParent)
      overlay.darken = false
      root.state = "open"
   }

   function hide() {
      root.state = "hidden"
   }

   function isOpen() {
      return root.state === "open"
   }

   OverlayBinder {
      onClicked: root.hide()
      enableWhen: isOpen()
   }

   Component.onCompleted: {
      oldParent = parent
      parent = overlay.placeholder
   }

   Behavior on width { NumberAnimation { duration: 100; easing.type: Easing.OutQuart } }
   Behavior on height { NumberAnimation { duration: 100; easing.type: Easing.OutQuart } }

   ListView {
      id: listView

      header: Item { height: 8 }
      footer: Item { height: 8 }

      interactive: visibleLimit < actions.length

      property int targetHeight: 0

      anchors.fill: parent

      model: actions.length
      clip: true

      highlightRangeMode: ListView.StrictlyEnforceRange
      preferredHighlightBegin: height / 3 + 8
      preferredHighlightEnd: height * 2/3

      delegate: Button {
         width: parent.width
         height: root.itemHeight
         action: actions[index]
         onClicked: root.hide()
         style: SingleLineListItemStyle {

         }
      }
   }

   states: [
      State {
         name: "hidden"
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
         from: "hidden"
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
         to: "hidden"

         SequentialAnimation {

            NumberAnimation {
               target: root
               property: "opacity"
               duration: 200
               easing.type: Easing.OutQuad
            }
            NumberAnimation {
               target: root
               properties: "width,height"
               duration: 0
               easing.type: Easing.OutQuad
            }
         }
      }
   ]
}

