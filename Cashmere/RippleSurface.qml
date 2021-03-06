import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Item {
   id: root

   anchors.fill: parent

   signal clicked()

   function alphaOf(color, alpha) {
      return Qt.rgba(color.r, color.g, color.b, alpha)
   }

   MouseArea {
      anchors.fill: parent
      propagateComposedEvents: true
      onClicked: {
         ripple.start(mouse)
         root.clicked()
      }
   }

   Ripple {
      id: ripple

      color: alphaOf("#999", 0.2)
      expandedSize: parent.width * 0.8
   }
}
