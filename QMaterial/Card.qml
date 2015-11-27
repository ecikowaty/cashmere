import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
   id: root

   property alias radius: rect.radius
   property int   elevation: 2
   property alias color: rect.color

   width: 200
   height: 50

   z: parent.z + elevation

   Shadow {
      elevation: root.elevation === 0 ? 0 : root.elevation + 2

      width: parent.width
      height: parent.height
      anchors.centerIn: parent

      anchors.verticalCenterOffset: elevation / 2
   }


   Rectangle {
      id: rect

      anchors.fill: parent
      radius: 2
   }
}

