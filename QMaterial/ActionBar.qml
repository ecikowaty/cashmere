import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."

Card {
   id: root

   width: parent.width
   height: 48

   radius: 0
   color: Theme.primary

   Item {
      anchors.fill: parent
      anchors.margins: 16

      Icon {
         anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
         }

         name: "menu"
         light: true
      }
   }
}

