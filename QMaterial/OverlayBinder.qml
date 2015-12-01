import QtQuick 2.5
import "."

Item {
   id: root

   signal clicked()

   property alias enableWhen: enabledBinding.value
   property bool  darken: false
   property Item  mirroredItem

   function bind(darken) {
      overlay.mapPlaceholderTo(mirroredItem)
      overlay.darken = darken
   }

   function reparent() {
      mirroredItem = parent.parent
      parent.parent = overlay.placeholder
   }

   Connections {
      target: overlay
      onClicked: {
         darken = false
         root.clicked()
      }
   }

   Binding {
      id: enabledBinding
      target: overlay
      property: "enabled"
   }
}

