import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
   id: root

   property int     elevation: 0
   property alias   color: rect.color

   width: 200
   height: 50

   z: parent.z + elevation

   RectangularGlow {
      anchors {
         horizontalCenter: parent.horizontalCenter
         top: parent.top; topMargin: elevation / 2.4
      }

      width: parent.width * 1.02
      height: parent.height * 1.02

      color: Qt.rgba(0, 0, 0, 0.3)

      glowRadius: 1 * elevation
      cornerRadius: 4 + elevation / 2
      spread: 0.0
   }


   Rectangle {
      id: rect

      anchors.fill: parent

      radius: 2
   }
}

