import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

Card {
   id: root

   elevation: 4

   radius: 0
   color: Theme.primary

   property alias actions: overlow.actions
   property alias title: titleLabel.text

   function closeOverflowMenu() {
      overflow.close()
   }

   signal backPressed()

   Item {
      anchors {
         fill: parent
         leftMargin: 16
         rightMargin: 16
      }

      Button {
         id: leftButton

         width: 24
         height: width

         anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
         }

         style: ActionButtonStyle {
            light: true
            action: Action {
               iconName: "arrow_back"
               onTriggered: root.backPressed()
            }
         }
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

      Overflow {
         id: overlow

         anchors.left: titleLabel.right
         anchors.right: parent.right

         anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
         }
      }
   }
}

