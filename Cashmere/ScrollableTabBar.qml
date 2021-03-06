import QtQuick 2.0
import QtQuick.Controls 1.4
import "Styles"
import "."

TabBar {
   id: root

   onCurrentTabChanged: listView.currentIndex = currentTab

   ListView {
      id: listView
      anchors.fill: parent

      width: parent.width
      orientation: Qt.Horizontal

      highlightFollowsCurrentItem: true
      highlightMoveVelocity: width / root.visibleTabs * 5

      model: tabs.length
      snapMode: ListView.SnapToItem

      header: Item {
         width: 72
         height: parent.height
      }

      onCurrentIndexChanged: root.currentTab = currentIndex

      delegate: MaterialButton {
         id: button
         height: 48
         text: tabs[index]
         onClicked: listView.currentIndex = index

         style: TabButtonStyle {
            lightBackground: true
         }

         Rectangle {
            id: indicator
            color: Theme.accentColor

            height: 2

            opacity: listView.currentIndex === index
            Behavior on opacity { NumberAnimation {} }

            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
         }
      }
   }
}
