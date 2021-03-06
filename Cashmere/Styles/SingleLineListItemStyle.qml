import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."
import "."

ButtonStyleBase {
   id: root

   property bool iconDefined: control.action && control.action.iconName

   property int leftMargin: 16

   property Component mainComponent: Label {
      fontStyle: FontStyles.subheading
      text: control.text
   }

   property Component icon: Icon {
      name: control.action.iconName
      color: Theme.onLightBackground.secondary
   }

   lightBackground: false

   label: Item {

   }

   background: ListItem {
      id: background

      control: root.control

      Item {
         anchors.fill: parent

         Loader {
            id: iconLoader
            width: 24
            height: 24

            anchors.left: parent.left
            anchors.leftMargin: root.leftMargin
            anchors.verticalCenter: parent.verticalCenter

            sourceComponent: iconDefined ? root.icon : undefined
         }

         Loader {
            anchors.left: iconDefined ? iconLoader.right : parent.left
            anchors.leftMargin: leftMargin * (iconDefined ? 2 : 1)
            anchors.verticalCenter: parent.verticalCenter

            sourceComponent: root.mainComponent
         }
      }
   }
}

