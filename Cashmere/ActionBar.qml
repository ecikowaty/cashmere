import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "."
import "Styles"

Card {
   id: root

   height: 56
   elevation: 4

   radius: 0
   color: Theme.primaryColor

   property alias actions: overlow.actions
   property alias title: titleLabel.text
   property alias visibleLimit: overlow.visibleLimit
   property alias customLeftButton: customButtonLoader.sourceComponent

   signal backPressed()

   Item {
      id: content

      height: parent.height

      anchors {
         left: parent.left; leftMargin: 16
         right: parent.right; rightMargin: 16
      }

      Loader {
         id: customButtonLoader

         width: 24
         height: width

         anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
         }
      }

      Button {
         id: drawerButton

         width: 24
         height: width

         anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
         }

         visible: isInitialPage(root.parent) && navigationDrawer.enabled && !customButtonLoader.item

         action: Action {
            iconName: "menu"
            onTriggered: navigationDrawer.show()
         }

         style: ActionButtonStyle {
            lightBackground: false
         }
      }

      Button {
         id: backButton

         width: 24
         height: width

         anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
         }

         visible: !app.isInitialPage(root.parent) && !customButtonLoader.item

         action: Action {
            iconName: "arrow_back"
            onTriggered: root.backPressed()
         }

         style: ActionButtonStyle {
            lightBackground: false
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

         height: 24
         lightBackground: false

         anchors {
            left: titleLabel.right; right: parent.right
            top: parent.top; bottom: parent.bottom
         }
      }
   }
}

