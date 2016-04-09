import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

Card {
   id: root

   width: 56 * widthFactor
   height: 250

   elevation: 24

   parent: overlay
   anchors.centerIn: parent

   state: "closed"
   enabled: isOpen()
   opacity: isOpen()

   Behavior on opacity { NumberAnimation { duration: 150 } }

   property int widthFactor: 5

   signal opened()

   function isOpen() {
      return state === "open"
   }

   function open() {
      opened()
      overlayBinder.bind(true)
      state = "open"
   }

   function close() {
      state = "closed"
   }

   MouseArea {
      anchors.fill: parent // doesn't propagate event over to Overlay
   }

   OverlayBinder {
      id: overlayBinder
      onClicked: close()
      enableWhen: isOpen()
   }
}

