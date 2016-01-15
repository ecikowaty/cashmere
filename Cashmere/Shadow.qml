import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
   id: root

   opacity: parent.opacity === 1 ? parent.opacity : parent.opacity * 0.75

   property int elevation: 2
   property int glowRadius: 1 + elevation / 3
   property int cornerRadius: 2 + elevation / 1.5

   property color color: Qt.rgba(0, 0, 0, 0.7)

   Item {
      id: topContainer

      width: parent.width - 4
      height: elevation  * 2 - root.anchors.verticalCenterOffset
      anchors.bottom: parent.top
      anchors.bottomMargin: root.anchors.verticalCenterOffset - 2
      anchors.horizontalCenter: parent.horizontalCenter
      clip: true

      RectangularGlow {
         id: topGlow

         width: parent.width + 6

         anchors.verticalCenter: parent.bottom
         anchors.verticalCenterOffset: root.anchors.verticalCenterOffset
         anchors.horizontalCenter: parent.horizontalCenter

         glowRadius: root.glowRadius + 2
         cornerRadius: root.cornerRadius + 2
         spread: 0
         color: root.color
      }
   }

   Item {
      id: leftContainer

      width: elevation * 2
      height: parent.height + elevation * 2

      anchors.right: parent.left
      anchors.rightMargin: - 2
      anchors.verticalCenter: parent.verticalCenter
      clip: true

      RectangularGlow {
         id: leftGlow

         height: root.height

         anchors.horizontalCenter: parent.right
         anchors.verticalCenter: parent.verticalCenter

         glowRadius: root.glowRadius + 2
         cornerRadius: root.cornerRadius + 2
         spread: 0
         color: root.color
      }
   }

   Item {
      id: rightContainer

      width: elevation * 2
      height: parent.height + elevation * 2
      anchors.left: parent.right
      anchors.leftMargin: - 2
      anchors.verticalCenter: parent.verticalCenter
      clip: true

      RectangularGlow {
         id: rightGlow

         height: root.height

         anchors.horizontalCenter: parent.left
         anchors.verticalCenter: parent.verticalCenter

         glowRadius: root.glowRadius + 2
         cornerRadius: root.cornerRadius + 2
         spread: 0
         color: root.color
      }
   }

   Item {
      id: bottomContainer

      height: elevation * 2 + root.anchors.verticalCenterOffset + 2
      anchors {
         top: parent.bottom
         topMargin: -root.anchors.verticalCenterOffset - 2
         left: leftContainer.right
         right: rightContainer.left
      }
      clip: true

      RectangularGlow {
         id: bottomGlow

         width: parent.width + 6
         height: root.anchors.verticalCenterOffset * 2

         anchors.verticalCenter: parent.top
         anchors.horizontalCenter: parent.horizontalCenter

         glowRadius: root.glowRadius + 2
         cornerRadius: root.cornerRadius + 2
         spread: 0
         color: root.color
      }
   }
}

