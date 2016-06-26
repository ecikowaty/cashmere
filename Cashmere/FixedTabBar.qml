import QtQuick 2.0
import QtQuick.Controls 1.4
import "Styles"
import "."

TabBar {
   id: root

   property bool lightBackground: true
   property color highlight: Theme.accentColor
   property color activeFontColor
   property color inactiveFontColor

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
               lightBackground: root.lightBackground
               fontColor: root.currentTab === index
                          ? root.activeFontColor
                          : root.inactiveFontColor
            }

            Rectangle {
               id: indicator
               color: root.highlight

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
