import QtQuick 2.0
import QtQuick.Controls 1.4
import "Styles"
import "."


ListView {
   id: root

   property int visibleTabs: 2

   width: parent.width
   orientation: Qt.Horizontal

   highlightFollowsCurrentItem: true
   highlightMoveVelocity: root.width / root.visibleTabs * 5

   model: 2
   snapMode: ListView.SnapToItem

   delegate: Button {
      id: button
      width: root.width / root.visibleTabs
      height: 48
      text: views[index].name
      onClicked: root.currentIndex = index

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
      }
   }
}
