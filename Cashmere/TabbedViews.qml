import QtQuick 2.5
import QtQml.Models 2.2

View {
   id: root
   hasTabs: true

   property alias tabBarHeight: tabBarLoader.height

   property alias tabBar: tabBarLoader.sourceComponent
   property alias views: viewsModel.children
   property alias interactive: listView.interactive
   property var   currentView: listView.currentItem

   Loader {
      id: tabBarLoader

      width: parent.width
      height: 48
   }

   ListView {
      id: listView

      orientation: Qt.Horizontal
      snapMode: ListView.SnapOneItem

      highlightFollowsCurrentItem: true
      highlightMoveVelocity: listView.width * 5

      clip: true

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
         top: tabBarLoader.bottom
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

      Component.onCompleted: {
         // weird fix for ListView showing incorrect item on start
         listView.currentIndex = 1
         listView.currentIndex = 0
      }
   }

}

