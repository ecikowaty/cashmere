import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQml.Models 2.2
import "."
import "Styles"

Rectangle {
   id: root
   color: "#fafafa"

   property alias thisPage: root
   property alias actionBar: actionBar
   property alias tabBar: tabBar
   property alias views: viewsModel.children

   property int   currentTab: 0
   onCurrentTabChanged: console.debug(currentTab)

   ActionBar {
      id: actionBar

      width: parent.width

      title: "ActionBar"

      onBackPressed: app.popPage()

      TabBar {
         id: tabBar

         width: parent.width
         height: views.length > 1 ? 48 : 0
         anchors.bottom: actionBar.bottom

         visible: views.length > 1
         model: views.length

         onCurrentIndexChanged: listView.currentIndex = currentIndex
      }
   }

   ListView {
      id: listView

      orientation: Qt.Horizontal
      snapMode: ListView.SnapOneItem

      onCurrentIndexChanged: {
         listView.currentIndex = currentIndex
         tabBar.currentIndex = currentIndex
      }

      highlightFollowsCurrentItem: true
      highlightMoveVelocity: listView.width * 5

      onFlickEnded: listView.currentIndex = visibleArea.xPosition / visibleArea.widthRatio

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
            views[i].width    = listView.width
         }
      }

      onHeightChanged: {
         for (var i = 0; i < views.length; ++i) {
            views[i].height   = listView.height
         }
      }

   }
}

