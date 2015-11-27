import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

Card {
   id: root

   height: 56
   elevation: castShadow ? 4 : 0

   radius: 0
   color: Theme.primaryColor

   property alias actions: overlow.actions
   property alias title: titleLabel.text
   property alias visibleLimit: overlow.visibleLimit

   property bool  castShadow: true

   signal backPressed()

   Item {
      id: content

      height: 56
      anchors {
         left: parent.left; leftMargin: 16
         right: parent.right; rightMargin: 16
      }

      Button {
         id: leftButton

         width: 24
         height: width

         anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
         }

         action: Action {
            iconName: app.isInitialPage(root.parent) ? "menu" : "arrow_back"
            onTriggered: root.backPressed()
         }

         style: ActionButtonStyle {
            light: true
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

