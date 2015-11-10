import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Item {
   id: root

   property list<Action>   actions
   property alias          spacing: row.spacing

   Icon {
      id: leftIcon

      anchors {
         verticalCenter: parent.verticalCenter
         right: parent.right
      }

      name: "more_vert"
      light: true
   }

   Row {
      id: row
      spacing: 32
      anchors {
         verticalCenter: parent.verticalCenter
         right: leftIcon.left; rightMargin: 24
      }

      Repeater {
         model: actions.length
         Icon {
            name: actions[index].iconName
            light: true
         }
      }
   }
}

