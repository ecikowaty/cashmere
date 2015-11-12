import QtQuick 2.0

Rectangle {
   id: root

   color: Qt.rgba(0, 0, 0, darken ? 0.3 : 0)
   Behavior on color { ColorAnimation {} }

   property alias placeholder: placeholder
   property bool  darken: false

   signal clicked()

   MouseArea {
      id: overlay
      anchors.fill: parent
      onClicked: root.clicked()
   }

   Item {
      id: placeholder
   }

   function placeOntop(where, item) {
      var mapped = mapFromItem(where, 0, 0, where.width, where.height)

      placeholder.x = mapped.x
      placeholder.y = mapped.y
      placeholder.width = mapped.width
      placeholder.height = mapped.height
   }
}

