import QtQuick 2.0
import QtQuick.Controls 1.4
import "Styles"
import "."


ListView {
   id: root

   property int   visibleTabs: items.length
   property var   items: []

   signal tabSelected(var index)

   interactive: visibleTabs < items.length

   width: parent.width
   anchors.bottom: parent.bottom
   model: items.length

   orientation: Qt.Horizontal

   delegate: Button {
      id: button
      width: root.width / visibleTabs
      height: 48
      text: items[index]
      onClicked: {
         root.currentIndex = index
         tabSelected(index)
      }

      style: TabButtonStyle {
         light: true
      }

      Rectangle {
         id: indicator
         color: Theme.accentColor

         height: 2

         opacity: currentIndex === index
         Behavior on opacity { NumberAnimation {} }

         anchors.bottom: parent.bottom
         anchors.left: parent.left
         anchors.right: parent.right

         function anchorTo(button) {
            parent         = button
            anchors.left   = button.left
            anchors.right  = button.right
         }

         transitions: Transition {
            AnchorAnimation {
               easing.type: Easing.OutQuart
            }
         }
      }
   }
}

