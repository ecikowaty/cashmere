import QtQuick 2.5
import QtQuick.Controls 1.4
import "."
import "Styles"

Item {
   id: root

   property list<Action>   actions
   property alias          spacing: row.spacing
   property int            visibleLimit: 2
   property bool           moreButtonVisible: actions.length > visibleLimit

   function openMenu() {
      overflowMenu.visible = true
   }

   function closeMenu() {
      overflowMenu.visible = false
   }

   Row {
      id: row

      spacing: 32
      anchors {
         verticalCenter: parent.verticalCenter
         right: moreButtonVisible ? moreButton.left : parent.right
         rightMargin: moreButtonVisible ? 24 : 0
      }

      Repeater {
         model: moreButtonVisible ? visibleLimit : actions.length
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
      id: moreButton

      width: 24
      height: width

      visible: moreButtonVisible
      enabled: moreButtonVisible

      anchors {
         verticalCenter: parent.verticalCenter
         right: parent.right
      }

      style: ActionButtonStyle {
         light: true
         action: Action {
            iconName: "more_vert"
            onTriggered: {
               var items = []
               var itemCounter = 0
               for (var i = visibleLimit; i < actions.length; ++i) {
                  items[itemCounter++] = actions[i]
               }

               overflowMenu.actions = items
               overflowMenu.open()
            }
         }
      }

      Menu {
         id: overflowMenu

         elevation: 6

         anchors.right: parent.right
         anchors.top: parent.top
      }
   }
}

