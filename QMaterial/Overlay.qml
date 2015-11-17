import QtQuick 2.0

Rectangle {
   id: root

   color: Qt.rgba(0, 0, 0, (darken  && enabled) ? 0.3 : 0)
   Behavior on color { ColorAnimation {} }

   property alias placeholder: placeholder
   property bool  darken: false
   property rect  mappedItem: Qt.rect(0, 0, 0, 0)

   signal clicked()

   MouseArea {
      id: overlay
      anchors.fill: parent
      onClicked: root.clicked()
   }

   Item {
      id: placeholder

      x: mappedItem.x
      y: mappedItem.y
      width: mappedItem.width
      height: mappedItem.height
   }

   function mapPlaceholderTo(where) {
      root.mappedItem = mapFromItem(where, 0, 0, where.width, where.height)
   }
}

