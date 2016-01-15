import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQml.Models 2.2
import "."
import "Styles"

Rectangle {
   id: root

   color: "#fafafa"

   property alias actionBar: actionBar
   property alias views: viewsModel.children

   property Component tabBar

   ActionBar {
      id: actionBar

      width: parent.width
      height: 56 + tabBarLoader.height

      title: "ActionBar"

      onBackPressed: app.popPage()

      Loader {
         id: tabBarLoader

         width: parent.width
         height: views.length > 1 ? 48 : 0
         visible: height > 0
         anchors.bottom: actionBar.bottom

         sourceComponent: root.tabBar
      }
   }

   ListView {
      id: listView

      orientation: Qt.Horizontal
      snapMode: ListView.SnapOneItem

      highlightFollowsCurrentItem: true
      highlightMoveVelocity: listView.width * 5

      onFlickEnded: listView.currentIndex = visibleArea.xPosition / visibleArea.widthRatio

      Binding {
         target: tabBarLoader.item
         property: "currentTab"
         when: tabBarLoader.item
         value: listView.currentIndex
      }

      Connections {
         target: tabBarLoader.item
         onCurrentTabChanged: listView.currentIndex = tabBarLoader.item.currentTab
      }

      anchors {
         top: actionBar.bottom
         left: parent.left
         right: parent.right
         bottom: parent.bottom
      }

      interactive: views.length > 1

      model: ObjectModel {
         id: viewsModel
      }

      onWidthChanged: {
         for (var i = 0; i < views.length; ++i) {
            views[i].width = listView.width
         }
      }

      onHeightChanged: {
         for (var i = 0; i < views.length; ++i) {
            views[i].height = listView.height
         }
      }

   }
}

