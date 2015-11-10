import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Item {
   id: root

   property list<Action>   actions
   property alias          spacing: row.spacing
   property int            visibleLimit: 2
   property bool           overflowMenuVisible: actions.length > visibleLimit

   Row {
      id: row

      spacing: 32
      anchors {
         verticalCenter: parent.verticalCenter
         right: overflowMenuVisible ? overflowButton.left : parent.right
         rightMargin: overflowMenuVisible ? 24 : 0
      }

      Repeater {
         model: overflowMenuVisible ? visibleLimit : actions.length
         Button {
            width: 24
            height: width

            style: ActionButtonStyle {
               light: true
               action: actions[index]
            }
         }
      }
   }

   Button {
      id: overflowButton

      width: 24
      height: width

      visible: overflowMenuVisible
      enabled: overflowMenuVisible

      anchors {
         verticalCenter: parent.verticalCenter
         right: parent.right
      }

      style: ActionButtonStyle {
         light: true
         action: Action {
            iconName: "more_vert"
         }
      }
   }
}

