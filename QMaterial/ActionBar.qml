import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."

Card {
   id: root

   width: parent.width
   height: 56

   radius: 0
   color: Theme.primary

   property alias actions: overlow.actions
   property alias title: titleLabel.text

   Item {
      anchors {
         fill: parent
         leftMargin: 16
         rightMargin: 16
      }

      Label {
         id: titleLabel

         text: "Material demo"
         fontStyle: FontStyles.title
         color: "white"

         anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left; leftMargin: 72
         }
      }

      Icon {
         id: menuIcon

         anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
         }

         name: "menu"
         light: true
      }

      Overflow {
         id: overlow

         width: 500
         spacing: 32

         anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
         }
      }
   }
}

