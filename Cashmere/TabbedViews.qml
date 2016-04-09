import QtQuick 2.5
import QtQml.Models 2.2
import "."

View {
   id: root
   hasTabs: true

   property alias tabBarHeight: tabBarLoader.height

   property alias tabBar: tabBarLoader.sourceComponent
   property alias views: swipeView.views
   property alias interactive: swipeView.interactive
   property var   currentView: swipeView.currentItem

   Loader {
      id: tabBarLoader

      width: parent.width
      height: 48
   }

   SwipeView {
      id: swipeView

      Binding {
         target: tabBarLoader.item
         property: "currentTab"
         when: tabBarLoader.item
         value: swipeView.currentIndex
      }

      Connections {
         target: tabBarLoader.item
         onCurrentTabChanged: swipeView.currentIndex = tabBarLoader.item.currentTab
      }

      anchors {
         top: tabBarLoader.bottom
         left: parent.left
         right: parent.right
         bottom: parent.bottom
      }
   }

}

