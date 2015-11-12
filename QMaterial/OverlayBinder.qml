import QtQuick 2.5
import "."

Item {
   id: root

   signal clicked()
   property alias enableWhen: binding.value

   Connections {
      target: overlay
      onClicked: root.clicked()
   }

   Binding {
      id: binding
      target: overlay
      property: "enabled"
   }
}

