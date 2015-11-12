import QtQuick 2.5
import "."

Item {
   id: root

   signal clicked()
   property alias enableWhen: enabledBinding.value
   property bool darken: false

   Connections {
      target: overlay
      onClicked: {
         console.debug("clicked!")
         root.clicked()
      }
   }

   Binding {
      id: enabledBinding
      target: overlay
      property: "enabled"
   }

   Binding {
      id: darkenBinding
      target: overlay
      property: "darken"
      value: overlay.enabled && darken
   }
}

