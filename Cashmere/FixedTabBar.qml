import QtQuick 2.0
import QtQuick.Controls 1.4
import "Styles"
import "."

TabBar {
   id: root

   Row {
      anchors.fill: parent
      anchors.leftMargin: 16
      anchors.rightMargin: 16

      Repeater {
         model: tabs.length

         delegate: Button {
            id: button
            width: root.width / tabs.length - 16
            height: 48
            text: tabs[index].name ? tabs[index].name : tabs[index]
            onClicked: currentTab = index

            style: TabButtonStyle {
               light: true
            }

            Rectangle {
               id: indicator
               color: Theme.accentColor

               height: 2

               opacity: currentTab === index
               Behavior on opacity { NumberAnimation {} }

               anchors.bottom: parent.bottom
               anchors.left: parent.left
               anchors.right: parent.right
            }
         }
      }
   }


}
