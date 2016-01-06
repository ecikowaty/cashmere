import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."
import "."

ButtonStyleBase {
   id: root

   property bool iconDefined: control.action && control.action.iconName

   property int leftMargin: 16

   property Component icon: Icon {
      name: control.action.iconName
      color: Theme.onLightBackground.secondary
   }

   label: Item {

   }

   background: ListItem {
      id: background

      pressed: control.pressed
      hovered: control.hovered

      Item {
         anchors.fill: parent

         Loader {
            id: iconLoader
            width: 24
            height: 24

            anchors.left: parent.left
            anchors.leftMargin: root.leftMargin
            anchors.verticalCenter: parent.verticalCenter

            sourceComponent: root.iconDefined ? root.icon : undefined
         }

         Label {
            anchors.left: root.iconDefined ? iconLoader.right : parent.left
            anchors.leftMargin: leftMargin
            anchors.verticalCenter: parent.verticalCenter

            fontStyle: FontStyles.subheading
            text: control.text
         }
      }
   }
}

