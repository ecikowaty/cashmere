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
      elevation: root.elevation + 2

      width: parent.width
      height: parent.height
      anchors.centerIn: parent

      anchors.verticalCenterOffset: elevation / 2
   }

//   RectangularGlow {
//      anchors {
//         horizontalCenter: parent.horizontalCenter
//         top: parent.top; topMargin: elevation / 2
//      }

//      visible: elevation > 0

//      width: parent.width
//      height: parent.height + 1

//      color: Qt.rgba(0, 0, 0, 0.26)

//      glowRadius: 1 + elevation / 1.5
//      cornerRadius: 2 + elevation / 1.5
//      spread: 0
//   }


   Rectangle {
      id: rect

      anchors.fill: parent
      radius: 2
   }
}

