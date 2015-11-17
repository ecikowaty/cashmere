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

